package egovframework.example.error;

public class UnauthenticatedException extends RuntimeException {
	public UnauthenticatedException(String message) {
		super(message);
	}

	public UnauthenticatedException() {
		this("로그인이 필요합니다.");
	}
}
