package egovframework.example.books.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoanVO {

	private int loanId;
	private int bookId;
	private String userid;
	private Date loanDate;
	private int dueDate;
	private Date returnDate;
	private int loanNum;
	private String loanState;
}
