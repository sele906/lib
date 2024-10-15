package egovframework.example.admin.books;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/books/*")
public class ABooksController {

	@RequestMapping(value = "wishList.do", method = RequestMethod.GET)
	public String wishList() throws Exception {
		return "/admin/books/wishList";
	}

	@RequestMapping(value = "addBook.do", method = RequestMethod.GET)
	public String addBook() throws Exception {
		return "/admin/books/addBook";
	}

	@RequestMapping(value = "bookList.do", method = RequestMethod.GET)
	public String bookList() throws Exception {
		return "/admin/books/bookList";
	}

}
