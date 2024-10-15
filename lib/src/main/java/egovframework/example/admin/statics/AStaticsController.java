package egovframework.example.admin.statics;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/statics/*")
public class AStaticsController {

	@RequestMapping(value = "statics.do", method = RequestMethod.GET)
	public String statics() throws Exception {
		return "/admin/statics/statics";
	}

}
