package egovframework.example.admin.programs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/program/*")
public class AProgramsController {

	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String list() throws Exception {
		return "/admin/program/programList";
	}

}
