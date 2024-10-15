package egovframework.example;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main/*")
public class MainController {

	//서지정보 api 불러오기
	@Value("${nl.KEY}")
	private String nlApiKey;

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main() throws Exception {
		return "main/main";
	}

}
