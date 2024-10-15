package egovframework.example.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/service/*")
public class ServiceController {

	@RequestMapping(value = "wishBooks.do", method = RequestMethod.GET)
	public String wishBooks() throws Exception {
		return "service/wishBooks";
	}

	@RequestMapping(value = "programs.do", method = RequestMethod.GET)
	public String programs() throws Exception {
		return "service/programs";
	}

	@RequestMapping(value = "multiSeats.do", method = RequestMethod.GET)
	public String bookSeats() throws Exception {
		return "service/seat";
	}

	@RequestMapping(value = "qna.do", method = RequestMethod.GET)
	public String qna() throws Exception {
		return "service/qna";
	}

}
