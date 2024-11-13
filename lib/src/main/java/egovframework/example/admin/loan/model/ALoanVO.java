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

	/**
	 * @fileName@ getter
	 * @return	fileName
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * @fileName@ setter
	 * @param	fileName
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

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
	 * @title@ getter
	 * @return	title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @title@ setter
	 * @param	title
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @author@ getter
	 * @return	author
	 */
	public String getAuthor() {
		return author;
	}

	/**
	 * @author@ setter
	 * @param	author
	 */
	public void setAuthor(String author) {
		this.author = author;
	}

	/**
	 * @publisher@ getter
	 * @return	publisher
	 */
	public String getPublisher() {
		return publisher;
	}

	/**
	 * @publisher@ setter
	 * @param	publisher
	 */
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	/**
	 * @cheonggu@ getter
	 * @return	cheonggu
	 */
	public String getCheonggu() {
		return cheonggu;
	}

	/**
	 * @cheonggu@ setter
	 * @param	cheonggu
	 */
	public void setCheonggu(String cheonggu) {
		this.cheonggu = cheonggu;
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
	 * @loanDateStr@ getter
	 * @return	loanDateStr
	 */
	public String getLoanDateStr() {
		return loanDateStr;
	}

	/**
	 * @loanDateStr@ setter
	 * @param	loanDateStr
	 */
	public void setLoanDateStr(String loanDateStr) {
		this.loanDateStr = loanDateStr;
	}

	/**
	 * @returnDateStr@ getter
	 * @return	returnDateStr
	 */
	public String getReturnDateStr() {
		return returnDateStr;
	}

	/**
	 * @returnDateStr@ setter
	 * @param	returnDateStr
	 */
	public void setReturnDateStr(String returnDateStr) {
		this.returnDateStr = returnDateStr;
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
	 * @loanState@ getter
	 * @return	loanState
	 */
	public String getLoanState() {
		return loanState;
	}

	/**
	 * @loanState@ setter
	 * @param	loanState
	 */
	public void setLoanState(String loanState) {
		this.loanState = loanState;
	}

	/**
	 * @overdueState@ getter
	 * @return	overdueState
	 */
	public String getOverdueState() {
		return overdueState;
	}

	/**
	 * @overdueState@ setter
	 * @param	overdueState
	 */
	public void setOverdueState(String overdueState) {
		this.overdueState = overdueState;
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
		return "ALoanVO [fileName=" + fileName + ", loanId=" + loanId + ", bookId=" + bookId + ", title=" + title + ", author=" + author + ", publisher=" + publisher + ", cheonggu=" + cheonggu + ", userid=" + userid + ", loanDate=" + loanDate + ", returnDate=" + returnDate + ", loanDateStr=" + loanDateStr + ", returnDateStr=" + returnDateStr + ", dueDate=" + dueDate + ", loanState=" + loanState + ", overdueState=" + overdueState + "]";
	}

}
