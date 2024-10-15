package egovframework.example.admin.seats;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/seat/*")
public class ASeatsController {

	@RequestMapping(value = "seatList.do", method = RequestMethod.GET)
	public String seatList() throws Exception {
		return "/admin/seat/seatList";
	}

}
