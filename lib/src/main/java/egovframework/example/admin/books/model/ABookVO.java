package egovframework.example.admin.books.model;

public class ABookVO {
	
	private String url;
	private String fileName;
	private int bookId;
	private String title;
	private String author;
	private String ctgId;
	private String ctgNm;
	private String publisher;
	private String cheonggu;
	private String isbn;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	
	@Override
	public String toString() {
		return "ABookVO [url=" + url + ", fileName=" + fileName + ", bookId=" + bookId + ", title=" + title
				+ ", author=" + author + ", ctgId=" + ctgId + ", ctgNm=" + ctgNm + ", publisher=" + publisher
				+ ", cheonggu=" + cheonggu + ", isbn=" + isbn + "]";
	}
	
	
}
