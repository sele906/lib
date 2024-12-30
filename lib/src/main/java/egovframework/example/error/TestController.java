package egovframework.example.error;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/test/*")
public class TestController {

	@RequestMapping(value = "badRequest.do", method = RequestMethod.GET)
	public void badRequest() {
		System.out.println("hello");
		throw new BadRequestException("Bad Request Example");
	}

	@RequestMapping(value = "unauthenticated.do", method = RequestMethod.GET)
	public void unauthenticated() {
		throw new UnauthenticatedException("Unauthenticated Example");
	}

	@RequestMapping(value = "forbidden.do", method = RequestMethod.GET)
	public void forbidden() {
		throw new ForbiddenException("Forbidden Example");
	}

	@ResponseBody
	@RequestMapping(value = "notFound.do", method = RequestMethod.GET)
	public void notFound() {
		throw new NotFoundException("Not Found Example");
	}

	@RequestMapping(value = "serverError.do", method = RequestMethod.GET)
	public void serverError() {
		throw new RuntimeException("Server Error Example");
	}

	@ExceptionHandler
	public ResponseEntity handleException(NotFoundException e) {
		System.out.println("hello");
		return new ResponseEntity<>(new ErrorResponse(e.getMessage()), HttpStatus.NOT_FOUND); // 404 
	}

	static class ErrorResponse {
		String message;

		ErrorResponse(String message) {
			this.message = message;
		}

		public String getMessage() {
			return message;
		}
	}
}
