package egovframework.example.books.service;

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

	/**
	 * @loanId@ getter
	 * @return	loanId
	 */
	public int getLoanId() {
		return loanId;
	}

	/**
	 * @loanId@ setter
	 * @param	loanId
	 */
	public void setLoanId(int loanId) {
		this.loanId = loanId;
	}

	/**
	 * @bookId@ getter
	 * @return	bookId
	 */
	public int getBookId() {
		return bookId;
	}

	/**
	 * @bookId@ setter
	 * @param	bookId
	 */
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	/**
	 * @userid@ getter
	 * @return	userid
	 */
	public String getUserid() {
		return userid;
	}

	/**
	 * @userid@ setter
	 * @param	userid
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}

	/**
	 * @loanDate@ getter
	 * @return	loanDate
	 */
	public Date getLoanDate() {
		return loanDate;
	}

	/**
	 * @loanDate@ setter
	 * @param	loanDate
	 */
	public void setLoanDate(Date loanDate) {
		this.loanDate = loanDate;
	}

	/**
	 * @dueDate@ getter
	 * @return	dueDate
	 */
	public int getDueDate() {
		return dueDate;
	}

	/**
	 * @dueDate@ setter
	 * @param	dueDate
	 */
	public void setDueDate(int dueDate) {
		this.dueDate = dueDate;
	}

	/**
	 * @returnDate@ getter
	 * @return	returnDate
	 */
	public Date getReturnDate() {
		return returnDate;
	}

	/**
	 * @returnDate@ setter
	 * @param	returnDate
	 */
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	/**
	 * @loanNum@ getter
	 * @return	loanNum
	 */
	public int getLoanNum() {
		return loanNum;
	}

	/**
	 * @loanNum@ setter
	 * @param	loanNum
	 */
	public void setLoanNum(int loanNum) {
		this.loanNum = loanNum;
	}

	public String getLoanState() {
		return loanState;
	}

	public void setLoanState(String loanState) {
		this.loanState = loanState;
	}

	/** 
	 *
	 * @return
	 *
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */

	@Override
	public String toString() {
		return "LoanVO [loanId=" + loanId + ", bookId=" + bookId + ", userid=" + userid + ", loanDate=" + loanDate + ", dueDate=" + dueDate + ", returnDate=" + returnDate + ", loanNum=" + loanNum + ", loanState=" + loanState + "]";
	}

}
