package egovframework.example.mypage;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import egovframework.example.books.service.impl.LoanDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Resource(name = "LoanDAO")
	private LoanDAO loanDao;

	@RequestMapping(value = "loanList.do", method = RequestMethod.GET)
	public String loanList(@RequestParam(name = "page", defaultValue = "1") int page, Model model, HttpSession session) throws Exception {

		String userid = (String) session.getAttribute("userid");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);

		Pagination pinfo = new Pagination();
		pinfo.setPage(page);

		int count = loanDao.loanCount(map);

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

		List<EgovMap> list = loanDao.loanList(map);

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pinfo", pinfo);
		model.addAttribute("pageInfo", paginationInfo);

		return "mypage/loanList";
	}

	@ResponseBody
	@RequestMapping(value = "extendsDate.do", method = RequestMethod.GET)
	public String extendsDate(@RequestParam(name = "loanId") int loanId) throws Exception {

		EgovMap emap = null;
		try {
			emap = loanDao.loanDateInfo(loanId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int dueDate = Integer.parseInt(emap.get("countDate").toString());
		String returnDateStr = emap.get("returnDate").toString();

		if (dueDate < 28) {
			try {
				loanDao.extendsDate(loanId);
			} catch (Exception e) {
				e.printStackTrace();
			}

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate returnDate = LocalDate.parse(returnDateStr, formatter);

			returnDate = returnDate.plusDays(7);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("loanId", loanId);
			map.put("returnDate", java.sql.Date.valueOf(returnDate));

			try {
				loanDao.loanDuedateUpdate(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "success";
		} else {
			return "error";
		}
	}

	@ResponseBody
	@RequestMapping(value = "returnState.do", method = RequestMethod.GET)
	public String returnState(@RequestParam(name = "loanId") int loanId) throws Exception {

		try {
			loanDao.returnState(loanId);

			LocalDate today = LocalDate.now();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("returnDate", java.sql.Date.valueOf(today));
			map.put("loanId", loanId);

			loanDao.loanDuedateUpdate(map);
			loanDao.returndateUpdate(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@RequestMapping(value = "loanHistory.do", method = RequestMethod.GET)
	public String loanHistory(@RequestParam(name = "page", defaultValue = "1") int page, Model model, HttpSession session) throws Exception {

		String userid = (String) session.getAttribute("userid");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);

		Pagination pinfo = new Pagination();
		pinfo.setPage(page);

		int count = loanDao.loanHistoryCount(map);

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

		List<EgovMap> list = loanDao.loanHistoryList(map);

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pinfo", pinfo);
		model.addAttribute("pageInfo", paginationInfo);

		return "mypage/loanHistory";
	}

	@RequestMapping(value = "resvList.do", method = RequestMethod.GET)
	public String resvList() throws Exception {
		return "mypage/resvList";
	}

	@RequestMapping(value = "wishList.do", method = RequestMethod.GET)
	public String wishList() throws Exception {
		return "mypage/wishList";
	}

	@RequestMapping(value = "programList.do", method = RequestMethod.GET)
	public String programList() throws Exception {
		return "mypage/programList";
	}

	@RequestMapping(value = "seatList.do", method = RequestMethod.GET)
	public String seatList() throws Exception {
		return "mypage/seatList";
	}

	@RequestMapping(value = "likedList.do", method = RequestMethod.GET)
	public String likedList() throws Exception {
		return "mypage/likedList";
	}

}
