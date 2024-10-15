package egovframework.example.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@RequestMapping(value = "loanList.do", method = RequestMethod.GET)
	public String loanList() throws Exception {
		return "mypage/loanList";
	}

	@RequestMapping(value = "loanHistory.do", method = RequestMethod.GET)
	public String loanHistory() throws Exception {
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
