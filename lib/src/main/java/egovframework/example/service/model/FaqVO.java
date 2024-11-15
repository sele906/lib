package egovframework.example.service.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FaqVO {
	private int faqId;
	private String userid;
	private String title;
	private String cnt;
	private Date writeDate;
}
