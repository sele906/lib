package egovframework.example.admin.loan.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ALoanVO {

	private String fileName;
	private int loanId;
	private int bookId;
	private String title;
	private String author;
	private String publisher;
	private String cheonggu;
	private String userid;
	private Date loanDate;
	private Date returnDate;
	private String loanDateStr;
	private String returnDateStr;
	private int dueDate;
	private String loanState;
	private String overdueState;
}
