package egovframework.example.admin.books.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
}
