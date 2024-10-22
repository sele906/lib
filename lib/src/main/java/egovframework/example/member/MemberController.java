package egovframework.example.member;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		// This method can be left empty as Spring Security handles authentication
		// Alternatively, you can check if user is already authenticated
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.isAuthenticated()) {
			// Redirect to the default target URL or main page if already authenticated
			return "redirect:/main.do";
		}
		// If not authenticated, let Spring Security handle it via form-login
		return "redirect:/member/login.do"; // Redirect to login page
	}

	/*@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(MemberVO vo) throws Exception {
		try {
			MemberVO rvo = memberDAO.login(vo);
			boolean chk = passwordEncoder.matches(vo.getPasswd(), rvo.getPasswd());
			System.out.println(chk);
			if (chk) {
				return "redirect:/main.do";
			} else {
				return "redirect:/member/login.do";
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/member/login.do";
	}*/

	@RequestMapping(value = "join.do", method = RequestMethod.GET)
	public String join() throws Exception {
		return "member/join";
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
