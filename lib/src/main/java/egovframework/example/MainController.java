package egovframework.example;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import egovframework.example.books.dao.BooksDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping("/")
public class MainController {

	@Resource(name = "BooksDAO")
	private BooksDAO booksDao;

	@Value("${kakao-map.KEY}")
	private String mapApiKey;

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(@RequestParam(name = "msg", required = false) String msg, Model model) throws Exception {
		List<EgovMap> list = booksDao.sampleBestlist();

		model.addAttribute("list", list);
		model.addAttribute("msg", msg);
		return "main/main";
	}

	@RequestMapping(value = "view.do", method = RequestMethod.GET)
	public String view() throws Exception {
		return "main/view";
	}

	@RequestMapping(value = "test.do", method = RequestMethod.GET)
	public String test() throws Exception {
		return "error/404";
	}

	@RequestMapping(value = "map.do", method = RequestMethod.GET)
	public String map(Model model) throws Exception {
		model.addAttribute("mapApiKey", mapApiKey);
		return "test/map";
	}
}
