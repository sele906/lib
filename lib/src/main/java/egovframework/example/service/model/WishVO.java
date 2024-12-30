package egovframework.example.service.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
}
