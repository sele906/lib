package egovframework.example.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.member.service.impl.MemberDAO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Resource(name = "MemberDAO")
	private MemberDAO memberDAO;

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() throws Exception {
		return "member/login";
	}

	@RequestMapping(value = "join.do", method = RequestMethod.GET)
	public String join() throws Exception {
		return "member/join";
	}

	@RequestMapping(value = "adminLogin.do", method = RequestMethod.GET)
	public String adminLogin() throws Exception {
		return "member/adminLogin";
	}

	@RequestMapping(value = "adminJoin.do", method = RequestMethod.GET)
	public String adminJoin() throws Exception {
		return "member/adminJoin";
	}

	@RequestMapping(value = "findInfo.do", method = RequestMethod.GET)
	public String findInfo() throws Exception {
		return "member/findInfo";
	}

}
