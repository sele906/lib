package egovframework.example.service.model;

public class WishVO {
	private int wishId;
	private String title;
	private String author;
	private String ctgId;
	private String publisher;
	private String cheonggu;
	private String isbn;
	private String userid;

	/**
	 * @wishId@ getter
	 * @return	wishId
	 */
	public int getWishId() {
		return wishId;
	}

	/**
	 * @wishId@ setter
	 * @param	wishId
	 */
	public void setWishId(int wishId) {
		this.wishId = wishId;
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
	 *
	 * @return
	 *
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */

	@Override
	public String toString() {
		return "WishVO [wishId=" + wishId + ", title=" + title + ", author=" + author + ", ctgId=" + ctgId + ", publisher=" + publisher + ", cheonggu=" + cheonggu + ", isbn=" + isbn + ", userid=" + userid + "]";
	}

}
