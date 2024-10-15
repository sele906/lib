package egovframework.example.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/info/*")
public class InfoController {

	@RequestMapping(value = "about.do", method = RequestMethod.GET)
	public String about() throws Exception {
		return "info/about";
	}

	@RequestMapping(value = "guidlines.do", method = RequestMethod.GET)
	public String guidlines() throws Exception {
		return "info/guidelines";
	}
}
