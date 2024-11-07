package egovframework.example;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.books.service.impl.BooksDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping("/")
public class MainController {

	@Resource(name = "BooksDAO")
	private BooksDAO booksDao;

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
}
