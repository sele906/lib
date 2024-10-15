package egovframework.example.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/main/*")
public class AMainController {

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main() throws Exception {
		return "admin/main/main";
	}

}
