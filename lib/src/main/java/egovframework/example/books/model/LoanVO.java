package egovframework.example.books.model;

import java.sql.Date;

public class LoanVO {

	private int loanId;
	private int bookId;
	private String userid;
	private Date loanDate;
	private int dueDate;
	private Date returnDate;
	private int loanNum;
	private String loanState;
	
	public int getLoanId() {
		return loanId;
	}
	public void setLoanId(int loanId) {
		this.loanId = loanId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getLoanDate() {
		return loanDate;
	}
	public void setLoanDate(Date loanDate) {
		this.loanDate = loanDate;
	}
	public int getDueDate() {
		return dueDate;
	}
	public void setDueDate(int dueDate) {
		this.dueDate = dueDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public int getLoanNum() {
		return loanNum;
	}
	public void setLoanNum(int loanNum) {
		this.loanNum = loanNum;
	}
	public String getLoanState() {
		return loanState;
	}
	public void setLoanState(String loanState) {
		this.loanState = loanState;
	}
	
	@Override
	public String toString() {
		return "LoanVO [loanId=" + loanId + ", bookId=" + bookId + ", userid=" + userid + ", loanDate=" + loanDate
				+ ", dueDate=" + dueDate + ", returnDate=" + returnDate + ", loanNum=" + loanNum + ", loanState="
				+ loanState + "]";
	}
	
	
}
