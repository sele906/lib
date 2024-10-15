package egovframework.example.admin.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/member/*")
public class AMemberController {

	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String list() throws Exception {
		return "/admin/member/memberList";
	}

}
