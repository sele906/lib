package egovframework.example;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class MainController {

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(@RequestParam(name = "msg", required = false) String msg, Model model) throws Exception {
		model.addAttribute("msg", msg);
		return "main/main";
	}

	@RequestMapping(value = "view.do", method = RequestMethod.GET)
	public String view() throws Exception {
		return "main/view";
	}
}
