package egovframework.example.books;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/books/")
public class BooksController {

	@RequestMapping(value = "main.do")
	public String main() throws Exception {
		return "books/main";
	}

	@RequestMapping(value = "search.do")
	public String search() throws Exception {
		return "books/search";
	}

	@RequestMapping(value = "newBooks.do")
	public String newBooks() throws Exception {
		return "books/newBooks";
	}

	@RequestMapping(value = "bestBooks.do")
	public String bestBooks() throws Exception {
		return "books/bestBooks";
	}
}
