package egovframework.example.member.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	private String userid;
	private String passwd;
	private String level;
	private String name;
	private Date birth;
	private String birthdate;
	private String phone;
	private String email;
	private String addr1;
	private String addr2;
}
