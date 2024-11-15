package egovframework.example.error;

public class ForbiddenException extends RuntimeException {
	public ForbiddenException(String message) {
		super(message);
	}

	public ForbiddenException() {
		this("권한이 없습니다.");
	}
}
