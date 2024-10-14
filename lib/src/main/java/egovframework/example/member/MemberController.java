package egovframework.example.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.member.service.impl.MemberDAO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Resource(name = "MemberDAO")
	private MemberDAO memberDAO;

	@RequestMapping(value = "list.do")
	public String list() throws Exception {
		System.out.println(memberDAO.getUserid());
		return "member/memberIndex";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() throws Exception {
		return "member/login";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(Model model) throws Exception {
		return "/";
	}

}
