package egovframework.example.admin.loan.model;

import java.sql.Date;

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
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getCheonggu() {
		return cheonggu;
	}
	public void setCheonggu(String cheonggu) {
		this.cheonggu = cheonggu;
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
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public String getLoanDateStr() {
		return loanDateStr;
	}
	public void setLoanDateStr(String loanDateStr) {
		this.loanDateStr = loanDateStr;
	}
	public String getReturnDateStr() {
		return returnDateStr;
	}
	public void setReturnDateStr(String returnDateStr) {
		this.returnDateStr = returnDateStr;
	}
	public int getDueDate() {
		return dueDate;
	}
	public void setDueDate(int dueDate) {
		this.dueDate = dueDate;
	}
	public String getLoanState() {
		return loanState;
	}
	public void setLoanState(String loanState) {
		this.loanState = loanState;
	}
	public String getOverdueState() {
		return overdueState;
	}
	public void setOverdueState(String overdueState) {
		this.overdueState = overdueState;
	}
	
	@Override
	public String toString() {
		return "ALoanVO [fileName=" + fileName + ", loanId=" + loanId + ", bookId=" + bookId + ", title=" + title
				+ ", author=" + author + ", publisher=" + publisher + ", cheonggu=" + cheonggu + ", userid=" + userid
				+ ", loanDate=" + loanDate + ", returnDate=" + returnDate + ", loanDateStr=" + loanDateStr
				+ ", returnDateStr=" + returnDateStr + ", dueDate=" + dueDate + ", loanState=" + loanState
				+ ", overdueState=" + overdueState + "]";
	}
	
	
}
