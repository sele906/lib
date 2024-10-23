package egovframework.example.member;

import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	public String login(@RequestParam(name = "msg", required = false) String msg, Model model) throws Exception {
		System.out.println(passwordEncoder.encode("1"));
		model.addAttribute("msg", msg);
		return "member/login";
	}

	@RequestMapping(value = "loginSuccess.do", method = RequestMethod.GET)
	public String loginSuccess(@RequestParam(name = "msg", required = false) String msg, HttpServletRequest request, HttpSession session, Model model) throws Exception {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		String username = authentication.getName();
		String authority = authentication.getAuthorities().toString();

		if (!(username.equals("anonymousUser") && authority.equals("[ROLE_ANONYMOUS]"))) {
			session.setAttribute("userid", username);
			session.setAttribute("level", authority.substring(6, authority.indexOf("]")));
			System.out.println(session.getAttribute("userid"));
			System.out.println(session.getAttribute("level"));
		}

		System.out.println(passwordEncoder.encode("1"));
		model.addAttribute("msg", msg);

		return "redirect:/main.do";
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
	public String join(MemberVO vo) throws Exception {

		try {
			vo.setPasswd(passwordEncoder.encode(vo.getPasswd()));
			vo.setBirth(java.sql.Date.valueOf(vo.getBirthdate()));
			memberDAO.join(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/member/login.do?msg=success";
	}

	//AJAX 이메일 값 가져오기
	@RequestMapping(value = "/infoFind.do", method = RequestMethod.POST)
	@ResponseBody
	public String infoFind(@RequestParam(name = "phone", required = false) String phone, @RequestParam(name = "userid", required = false) String userid, @RequestParam(name = "type") String type) throws Exception {

		MemberVO vo = new MemberVO();

		if (type.equals("findId")) { //아이디 찾기

			vo.setPhone(phone);
			vo = memberDAO.findId(vo);

			return vo.getUserid();

		} else if (type.equals("findEmail")) { //비밀번호 찾기

			vo.setUserid(userid);
			vo = memberDAO.findEmail(vo);

			return vo.getEmail();

		}

		JSONObject o = new JSONObject(vo);
		return o.toString();
	}

	//AJAX 메일
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/mailSend", method = RequestMethod.POST)
	@ResponseBody
	public String mailSend(MemberVO vo, @RequestParam(name = "msgType") String msgType, HttpServletRequest request) {

		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

			messageHelper.setFrom("seunga906@gmail.com");
			messageHelper.setTo(vo.getEmail());

			Random random = new Random();

			if (msgType.equals("emailChk")) { //메일 인증

				//랜덤 숫자 생성
				int randomNumber = 10000000 + random.nextInt(90000000);
				String val = String.valueOf(randomNumber);

				messageHelper.setSubject("[LIBLIO] 이메일 인증을 진행해주세요");
				messageHelper.setText("LIBLIO 도서관리 시스템 회원가입을 위해 인증코드를 화면에 입력해주세요. 인증코드: " + val);
				mailSender.send(mimeMessage);
				return val;

			} else if (msgType.equals("pwdChk")) { //임시 비밀번호

				//랜덤 비밀번호 생성
				String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@$%";
				StringBuilder randomString = new StringBuilder();

				for (int i = 0; i < 8; i++) {
					randomString.append(chars.charAt(random.nextInt(chars.length())));
				}

				//임시 비밀번호 설정
				String passwd = passwordEncoder.encode(String.valueOf(randomString));
				vo.setPasswd(passwd);
				memberDAO.setPwd(vo);

				messageHelper.setSubject("[LIBLIO] 비밀번호 초기화");
				messageHelper.setText("비밀번호 재설정을 위한 임시 코드를 발송했습니다. 임시코드: " + randomString);
				mailSender.send(mimeMessage);

				return "success";
			} else {
				return "error";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping(value = "findInfo.do", method = RequestMethod.GET)
	public String findInfo() throws Exception {
		return "member/findInfo";
	}

}
