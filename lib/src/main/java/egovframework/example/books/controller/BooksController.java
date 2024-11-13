package egovframework.example.books.controller;

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

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.example.Pagination;
import egovframework.example.books.dao.BooksDAO;
import egovframework.example.books.dao.LikeDAO;
import egovframework.example.books.dao.LoanDAO;
import egovframework.example.books.dao.ResvDAO;
import egovframework.example.books.model.LoanVO;
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

		Map<String, Object> response = new HashMap<>();

		//연체 상태인지 확인
		EgovMap emap = loanDao.overdueCount(userid);
		if (emap != null) {
			if (emap.get("overdueState").equals("Y")) {
				response.put("status", "overdue");
				response.put("dueCount", emap.get("dueCount").toString());

				ObjectMapper objectMapper = new ObjectMapper();
				return objectMapper.writeValueAsString(response);
			}
		}

		//몇 권 빌렸는지 확인
		EgovMap loanBook = loanDao.loanBookCount(userid);
		if (loanBook != null) {
			int loanBookCount = Integer.parseInt(loanBook.get("count").toString());
			System.out.println(loanBookCount);
			if (loanBookCount > 14) {
				response.put("status", "toomuchbook");

				ObjectMapper objectMapper = new ObjectMapper();
				return objectMapper.writeValueAsString(response);
			}
		}

		LoanVO vo = new LoanVO();
		vo.setUserid(userid);
		vo.setBookId(bookId);

		LocalDate today = LocalDate.now();
		LocalDate returnDateLocal = today.plusDays(14);

		vo.setLoanDate(Date.valueOf(today));
		vo.setReturnDate(Date.valueOf(returnDateLocal));

		int idx = loanDao.loanInsert(vo);
		response.put("status", "success");
		response.put("idx", idx);

		//예약도서라면
		EgovMap param = new EgovMap();
		param.put("userid", userid);
		param.put("bookId", bookId);

		int resvCnt = 0;
		try {
			ResvDao.resvDelete(param);
			resvCnt = ResvDao.resvChkResvCnt(bookId);
			response.put("resvCnt", resvCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ObjectMapper objectMapper = new ObjectMapper();
		String result = objectMapper.writeValueAsString(response);

		return result;
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
	public String newBooks(Model model) throws Exception {
		List<EgovMap> list = booksDao.newlist();
		List<EgovMap> sampleList = booksDao.sampleNewlist();

		model.addAttribute("sampleList", sampleList);
		model.addAttribute("list", list);
		return "books/newBooks";
	}

	@RequestMapping(value = "bestBooks.do")
	public String bestBooks(Model model) throws Exception {
		List<EgovMap> list = booksDao.bestlist();
		List<EgovMap> sampleList = booksDao.sampleBestlist();

		model.addAttribute("sampleList", sampleList);
		model.addAttribute("list", list);
		return "books/bestBooks";
	}
}
