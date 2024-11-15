package egovframework.example.error;

public class BadRequestException extends RuntimeException {
	public BadRequestException(String message) {
		super(message);
		System.out.println("helds");
	}

	public BadRequestException() {
		this("잘못된 요청입니다.");
	}
}
