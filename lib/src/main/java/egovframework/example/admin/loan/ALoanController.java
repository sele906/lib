package egovframework.example.admin.loan;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/loan/*")
public class ALoanController {

	@RequestMapping(value = "loanList.do", method = RequestMethod.GET)
	public String loanList() throws Exception {
		return "/admin/loan/loanList";
	}

	@RequestMapping(value = "resvList.do", method = RequestMethod.GET)
	public String resvList() throws Exception {
		return "/admin/loan/resvList";
	}

	@RequestMapping(value = "overdueList.do", method = RequestMethod.GET)
	public String overdueList() throws Exception {
		return "/admin/loan/overdueList";
	}

}
