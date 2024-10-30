package egovframework.example.books;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.Pagination;
import egovframework.example.books.service.LoanVO;
import egovframework.example.books.service.impl.BooksDAO;
import egovframework.example.books.service.impl.LikeDAO;
import egovframework.example.books.service.impl.LoanDAO;
import egovframework.example.books.service.impl.ResvDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/books/")
public class BooksController {

	@Resource(name = "BooksDAO")
	private BooksDAO booksDao;

	@Resource(name = "LoanDAO")
	private LoanDAO loanDao;

	@Resource(name = "LikeDAO")
	private LikeDAO LikeDao;

	@Resource(name = "ResvDAO")
	private ResvDAO ResvDao;

	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public String search(@RequestParam(name = "ctgId", defaultValue = "") String ctgId, @RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "sKey", defaultValue = "") String sKey, @RequestParam(name = "sort", defaultValue = "new") String sort, HttpSession session, Model model) throws Exception {

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
		map.put("sort", sort);

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

		map.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		map.put("firstIndex", paginationInfo.getFirstRecordIndex());

		String userid = (String) session.getAttribute("userid");
		map.put("userid", userid);

		List<EgovMap> list = booksDao.booklist(map);

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("map", map);
		model.addAttribute("pinfo", pinfo);
		model.addAttribute("pageInfo", paginationInfo);

		return "books/search";
	}

	@ResponseBody
	@RequestMapping(value = "loan.do", method = RequestMethod.GET)
	public String loan(@RequestParam(name = "bookId") int bookId, @RequestParam(name = "userid") String userid) throws Exception {

		LoanVO vo = new LoanVO();
		vo.setUserid(userid);
		vo.setBookId(bookId);

		LocalDate today = LocalDate.now();
		LocalDate returnDateLocal = today.plusDays(14);

		vo.setLoanDate(Date.valueOf(today));
		vo.setReturnDate(Date.valueOf(returnDateLocal));

		int idx = loanDao.loanInsert(vo);

		return String.valueOf(idx);
	}

	@ResponseBody
	@RequestMapping(value = "like.do", method = RequestMethod.GET)
	public String like(@RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "bookId") int bookId, @RequestParam(name = "userid") String userid) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("bookId", bookId);

		LikeDao.likeAdd(map);

		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "liked.do", method = RequestMethod.GET)
	public String liked(@RequestParam(name = "bookId") int bookId, @RequestParam(name = "userid") String userid) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("bookId", bookId);

		LikeDao.likeDelete(map);

		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "resv.do", method = RequestMethod.GET)
	public String resv(@RequestParam(name = "bookId") int bookId, @RequestParam(name = "loanId") int loanId, @RequestParam(name = "userid") String userid) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("bookId", bookId);
		map.put("loanId", loanId);

		try {

			EgovMap emap = ResvDao.resvChkLoan(map);
			String loanState = (String) emap.get("loanState");
			if (!loanState.equals("N")) {
				return "alreadyLoaned";
			}

			int resvUsrCnt = ResvDao.resvChkResv(map);
			if (resvUsrCnt != 0) {
				return "alreadyReserved";
			}

			int resvCnt = ResvDao.resvChkResvCnt(bookId);
			if (resvCnt > 4) {
				return "fullyReserved";
			}

			ResvDao.resvInsert(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "resvDelete.do", method = RequestMethod.GET)
	public String resvDelete(@RequestParam(name = "bookId") int bookId, @RequestParam(name = "userid") String userid) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("bookId", bookId);

		try {
			ResvDao.resvDelete(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
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
