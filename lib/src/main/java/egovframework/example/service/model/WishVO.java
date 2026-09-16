package egovframework.example.service.model;

public class WishVO {

	private String url;
	private int wishId;
	private String title;
	private String author;
	private String ctgId;
	private String publisher;
	private String cheonggu;
	private String isbn;
	private String userid;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	
	@Override
	public String toString() {
		return "WishVO [url=" + url + ", wishId=" + wishId + ", title=" + title + ", author=" + author + ", ctgId="
				+ ctgId + ", publisher=" + publisher + ", cheonggu=" + cheonggu + ", isbn=" + isbn + ", userid="
				+ userid + "]";
	}
	
	
}
