package egovframework.example.error;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ControllerExceptionAdvice {

	@ExceptionHandler(BadRequestException.class)
	public ResponseEntity<ErrorResponse> handleBadRequestException(BadRequestException e) {
		System.out.println("!11111111");
		return new ResponseEntity<>(new ErrorResponse(e.getMessage()), HttpStatus.BAD_REQUEST); // 400
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
