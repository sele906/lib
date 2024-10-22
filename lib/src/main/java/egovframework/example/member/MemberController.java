package egovframework.example.member;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.member.service.MemberVO;
import egovframework.example.member.service.impl.MemberDAO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Resource(name = "MemberDAO")
	private MemberDAO memberDAO;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() throws Exception {
		return "member/login";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(MemberVO vo) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.isAuthenticated()) {
			return "redirect:/main.do";
		}
		return "redirect:/member/login.do";
	}

	@RequestMapping(value = "join.do", method = RequestMethod.GET)
	public String join() throws Exception {
		return "member/join";
	}

	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/useridCheck.do", method = RequestMethod.POST)
	public String useridCheck(MemberVO vo, Model model) throws Exception {
		String result = memberDAO.checkUserid(vo);
		return result;
	}

	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public String join(MemberVO vo, @RequestParam(name = "birthdate") String birthdate) throws Exception {

		birthdate = "2024-01-10";

		try {
			vo.setPasswd(passwordEncoder.encode(vo.getPasswd()));
			vo.setBirth(java.sql.Date.valueOf(birthdate));
			memberDAO.join(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "member/login";
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
