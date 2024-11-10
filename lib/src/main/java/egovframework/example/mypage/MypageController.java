package egovframework.example.mypage;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.Pagination;
import egovframework.example.books.service.impl.LikeDAO;
import egovframework.example.books.service.impl.LoanDAO;
import egovframework.example.books.service.impl.ResvDAO;
import egovframework.example.member.service.MemberVO;
import egovframework.example.member.service.impl.MemberDAO;
import egovframework.example.service.impl.MultiDAO;
import egovframework.example.service.impl.WishDAO;
import egovframework.example.service.impl.WishFileService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Resource(name = "LoanDAO")
	private LoanDAO loanDao;

	@Resource(name = "LikeDAO")
	private LikeDAO LikeDao;

	@Resource(name = "ResvDAO")
	private ResvDAO ResvDao;

	@Resource(name = "WishDAO")
	private WishDAO wishDao;

	@Resource(name = "MemberDAO")
	private MemberDAO MemDao;

	@Resource(name = "MultiDAO")
	private MultiDAO multiDao;

	@Resource(name = "WishFileService")
	private WishFileService WishFileService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

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
				loanDao.loanNotStateUpdate(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "success";
		} else {
			return "error";
		}
	}

	@Autowired
	private JavaMailSender mailSender;

	@ResponseBody
	@RequestMapping(value = "returnState.do", method = RequestMethod.GET)
	public String returnState(@RequestParam(name = "loanId") int loanId, HttpSession session) throws Exception {
		
		String oriUserid = (String) session.getAttribute("userid");
		String result = "";

		try {
			
			LocalDate today = LocalDate.now();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("returnDate", java.sql.Date.valueOf(today));
			map.put("loanId", loanId);

			//반납일-대출일 > 대출기간 인지 확인
			EgovMap dueEmap = loanDao.loanChkOverdue(map); //연체여부 말고도 연체일자 가져오기

			if (dueEmap.get("overdueState").equals("Y")) {
				//대출상태와 대출기간 업데이트
				loanDao.loanOverdueUpdate(map);
				//ㅇㅇ일동안 대여 불가능하다는 메세지 넣기
				result = dueEmap.get("dueCount").toString();
				
			} else if (dueEmap.get("overdueState").equals("N")) {
				//대출상태와 대출기간 업데이트
				loanDao.loanUpdate(map);
				result = "success";
			}

			//만약 예약 테이블에 책이 있다면
			EgovMap emap = null;
			emap = loanDao.loanChkResv(loanId);

			if (emap != null) {

				try {
					MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

					messageHelper.setFrom("seunga906@gmail.com");
					messageHelper.setTo(emap.get("email").toString());

					String userid = emap.get("userid").toString();
					String title = emap.get("title").toString();
					String author = emap.get("author").toString();

					String msg = "<div>" + "해당 도서가 대출 가능합니다.<br><br>" + "<b>\"" + title + "\"</b><br>" + author + " [저]<br><br>" + "지금 바로 도서관에서 만나보세요!<br>" + "</div>";

					messageHelper.setSubject("[LiBLIO] " + userid + "님, 예약된 도서가 대출가능 상태입니다.");
					messageHelper.setText(msg, true);
					mailSender.send(mimeMessage);

				} catch (Exception e) {
					e.printStackTrace();
					return "error";
				}
			}

		} catch (

		Exception e) {
			e.printStackTrace();
		}

		return result;
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
	public String resvList(@RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "sKey", defaultValue = "") String sKey, HttpSession session, Model model) throws Exception {

		//키워드와 페이지 전달
		String userid = (String) session.getAttribute("userid");

		Pagination8 pinfo = new Pagination8();
		pinfo.setsKey(sKey);
		pinfo.setPage(pageNum);

		Map<String, Object> map = new HashMap();
		map.put("sKey", sKey);
		map.put("pageNum", pageNum);
		map.put("userid", userid);

		int count = ResvDao.resvCount(map);

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

		List<EgovMap> list = ResvDao.resvList(map);

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("map", map);
		model.addAttribute("pinfo", pinfo);
		model.addAttribute("pageInfo", paginationInfo);

		return "mypage/resvList";
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

	@RequestMapping(value = "wishList.do", method = RequestMethod.GET)
	public String wishList(@RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "sKey", defaultValue = "") String sKey, HttpSession session, Model model) throws Exception {

		//키워드와 페이지 전달
		String userid = (String) session.getAttribute("userid");

		Pagination8 pinfo = new Pagination8();
		pinfo.setsKey(sKey);
		pinfo.setPage(pageNum);

		Map<String, Object> map = new HashMap();
		map.put("sKey", sKey);
		map.put("pageNum", pageNum);
		map.put("userid", userid);

		int count = wishDao.wishCount(map);

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

		List<EgovMap> list = wishDao.wishList(map);

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("map", map);
		model.addAttribute("pinfo", pinfo);
		model.addAttribute("pageInfo", paginationInfo);

		return "mypage/wishList";
	}

	@ResponseBody
	@RequestMapping(value = "wishDelete.do", method = RequestMethod.GET)
	public String wishDelete(@RequestParam(name = "wishId") int wishId, @RequestParam(name = "userid") String userid, Model model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("wishId", wishId);
		map.put("userid", userid);

		try {
			WishFileService.deleteFile(wishId);
			wishDao.wishDelete(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@RequestMapping(value = "seatList.do", method = RequestMethod.GET)
	public String seatList(@RequestParam(name = "msg", required = false) String msg, HttpSession session, Model model) throws Exception {
		String userid = (String) session.getAttribute("userid");
		List<EgovMap> list = multiDao.seatUserSelect(userid);
		List<EgovMap> notUserList = multiDao.seatNotUserSelect(userid);
		
		model.addAttribute("list", list);
		model.addAttribute("notUserList", notUserList);
		model.addAttribute("msg", msg);
		return "mypage/seatList";
	}

	@RequestMapping(value = "seatList.do", method = RequestMethod.POST)
	public String seatList(@RequestParam(name = "seatNum") String seatNum, HttpSession session) throws Exception {

		String userid = (String) session.getAttribute("userid");
		String[] seatArray = seatNum.split(",");

		try {
			for (String seat : seatArray) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("seatNum", Integer.parseInt(seat));
				map.put("status", "Y");
				map.put("userid", userid);

				multiDao.seatInsert(map);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/mypage/seatList.do?msg=success";
	}

	@ResponseBody
	@RequestMapping(value = "seatDelete.do", method = RequestMethod.GET)
	public String seatDelete(@RequestParam(name = "seatNum") String num, HttpSession session) throws Exception {

		String userid = (String) session.getAttribute("userid");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seatNum", num);
		map.put("userid", userid);

		try {
			multiDao.seatDelete(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@RequestMapping(value = "likedList.do", method = RequestMethod.GET)
	public String likedList(@RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "sKey", defaultValue = "") String sKey, HttpSession session, Model model) throws Exception {

		//키워드와 페이지 전달
		String userid = (String) session.getAttribute("userid");

		Pagination8 pinfo = new Pagination8();
		pinfo.setsKey(sKey);
		pinfo.setPage(pageNum);

		Map<String, Object> map = new HashMap();
		map.put("sKey", sKey);
		map.put("pageNum", pageNum);
		map.put("userid", userid);

		int count = LikeDao.count(map);

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

		List<EgovMap> list = LikeDao.likeList(map);

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("map", map);
		model.addAttribute("pinfo", pinfo);
		model.addAttribute("pageInfo", paginationInfo);
		model.addAttribute("list", list);

		return "mypage/likedList";
	}

	@RequestMapping(value = "memIndex.do", method = RequestMethod.GET)
	public String memIndex(@RequestParam(name = "msg", required = false) String msg, Model model) throws Exception {
		model.addAttribute("msg", msg);
		return "mypage/memIndex";
	}

	@RequestMapping(value = "memInfo.do", method = RequestMethod.POST)
	public String memInfo(MemberVO vo, HttpSession session, Model model) throws Exception {

		String userid = (String) session.getAttribute("userid");
		String passwd = MemDao.chkPasswd(userid);
		boolean chk = passwordEncoder.matches(vo.getPasswd(), passwd);

		if (chk) {
			try {
				MemberVO mvo = MemDao.getMemInfo(userid);
				model.addAttribute("info", mvo);
				return "mypage/memInfo";
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return "redirect:/mypage/memIndex.do?msg=error";

	}

	@RequestMapping(value = "updateMem.do", method = RequestMethod.POST)
	public String updateMem(MemberVO vo, HttpSession session, Model model) throws Exception {

		vo.setBirth(java.sql.Date.valueOf(vo.getBirthdate()));
		String encodePW = passwordEncoder.encode(String.valueOf(vo.getPasswd()));
		vo.setPasswd(encodePW);

		try {
			MemDao.updateMem(vo);
			model.addAttribute("msg", "updateMemSuccess");
			return "redirect:/main.do";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/mypage/memIndex.do?msg=Memerror";

	}

	@RequestMapping(value = "deleteMem.do", method = RequestMethod.GET)
	public String deleteMem(HttpSession session, Model model) throws Exception {

		String userid = (String) session.getAttribute("userid");

		try {
			MemDao.deleteMem(userid);
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/main.do?msg=deleteMem";

	}

}
