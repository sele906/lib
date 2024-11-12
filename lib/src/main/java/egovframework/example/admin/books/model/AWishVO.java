package egovframework.example.admin.books.model;

public class AWishVO {
	private String fileName;
	private int wishId;
	private String title;
	private String author;
	private String ctgId;
	private String ctgNm;
	private String publisher;
	private String cheonggu;
	private String isbn;
	private String userid;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getWishId() {
		return wishId;
	}

	public void setWishId(int wishId) {
		this.wishId = wishId;
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

	public String getCtgId() {
		return ctgId;
	}

	public void setCtgId(String ctgId) {
		this.ctgId = ctgId;
	}

	public String getCtgNm() {
		return ctgNm;
	}

	public void setCtgNm(String ctgNm) {
		this.ctgNm = ctgNm;
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

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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
		return "WishVO [fileName=" + fileName + ", wishId=" + wishId + ", title=" + title + ", author=" + author + ", ctgId=" + ctgId + ", ctgNm=" + ctgNm + ", publisher=" + publisher + ", cheonggu=" + cheonggu + ", isbn=" + isbn + ", userid=" + userid + "]";
	}

}
