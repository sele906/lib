package egovframework.example.admin.books.service;

import java.io.IOException;

public interface AFileService {

	public void insertImage(int id, String imgURL, String path) throws IOException;

}
