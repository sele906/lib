package egovframework.example;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class MainController {

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(HttpServletRequest request, @RequestParam(name = "msg", required = false) String msg, Model model) throws Exception {

		// Get the Authentication object from SecurityContextHolder
		//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		//
		//		// Retrieve the username from the Authentication object
		//		String username = authentication.getName(); // This returns the username
		//		String authority = authentication.getAuthorities().toString(); // This returns the authorities as a string
		//
		//		System.out.println(username + " " + authority);

		model.addAttribute("msg", msg);
		return "main/main";
	}
}
