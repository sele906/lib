package egovframework.example.books;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.Pagination;
import egovframework.example.books.service.impl.BooksDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/books/")
public class BooksController {

	@Resource(name = "BooksDAO")
	private BooksDAO booksDao;

	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public String search(@RequestParam(name = "ctgId", defaultValue = "") String ctgId, @RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "sKey", defaultValue = "") String sKey, Model model) throws Exception {

		//키워드
		List<EgovMap> ctgList = booksDao.dataCtg();
		model.addAttribute("ctgList", ctgList);

		//키워드와 페이지 전달
		Pagination pinfo = new Pagination();
		pinfo.setsKey(sKey);
		pinfo.setPage(pageNum);

		Map<String, Object> map = new HashMap();
		map.put("sKey", sKey);
		map.put("pageNum", pageNum);
		map.put("ctgId", ctgId);

		int count = booksDao.bookCount(map);

		//페이징처리
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pinfo.getPage());
		paginationInfo.setRecordCountPerPage(pinfo.getPageUnit());
		paginationInfo.setPageSize(pinfo.getPageSize());

		paginationInfo.setTotalRecordCount(count);
		pinfo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pinfo.setLastIndex(paginationInfo.getLastRecordIndex());
		pinfo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<EgovMap> list = booksDao.booklist(map);

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("map", map);
		model.addAttribute("pinfo", pinfo);
		model.addAttribute("pageInfo", paginationInfo);

		return "books/search";
	}

	@RequestMapping(value = "newBooks.do")
	public String newBooks() throws Exception {
		return "books/newBooks";
	}

	@RequestMapping(value = "bestBooks.do")
	public String bestBooks() throws Exception {
		return "books/bestBooks";
	}
}
