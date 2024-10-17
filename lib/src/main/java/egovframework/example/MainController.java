package egovframework.example;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main/*")
public class MainController {

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main() throws Exception {
		return "main/main";
	}

}
