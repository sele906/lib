package egovframework.example.error;

public class MemberNotFoundException extends NotFoundException {
	public MemberNotFoundException() {
		super("존재하지 않는 회원입니다.");
	}
}
