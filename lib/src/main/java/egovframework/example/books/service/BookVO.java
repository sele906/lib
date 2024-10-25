package egovframework.example.books.service;

public class BookVO {
	private int bookId;
	private String title;
	private String author;
	private String ctgId;
	private String ctgNm;
	private String publisher;
	private String cheonggu;
	private String isbn;

	/**
	 * @bookID@ getter
	 * @return	bookID
	 */
	public int getBookId() {
		return bookId;
	}

	/**
	 * @bookID@ setter
	 * @param	bookID
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
	 * @ctgId@ getter
	 * @return	ctgId
	 */
	public String getCtgId() {
		return ctgId;
	}

	/**
	 * @ctgId@ setter
	 * @param	ctgId
	 */
	public void setCtgId(String ctgId) {
		this.ctgId = ctgId;
	}

	/**
	 * @ctgNm@ getter
	 * @return	ctgNm
	 */
	public String getCtgNm() {
		return ctgNm;
	}

	/**
	 * @ctgNm@ setter
	 * @param	ctgNm
	 */
	public void setCtgNm(String ctgNm) {
		this.ctgNm = ctgNm;
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
	 * @isbn@ getter
	 * @return	isbn
	 */
	public String getIsbn() {
		return isbn;
	}

	/**
	 * @isbn@ setter
	 * @param	isbn
	 */
	public void setIsbn(String isbn) {
		this.isbn = isbn;
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
		return "BookVO [bookId=" + bookId + ", title=" + title + ", author=" + author + ", ctgId=" + ctgId + ", ctgNm=" + ctgNm + ", publisher=" + publisher + ", cheonggu=" + cheonggu + ", isbn=" + isbn + "]";
	}

}
