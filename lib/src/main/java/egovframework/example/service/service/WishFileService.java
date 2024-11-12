package egovframework.example.service.service;

import java.io.IOException;

public interface WishFileService {

	public void insertImage(int id, String imgURL, String fileOriNm) throws IOException;

	public void deleteFile(int id) throws Exception;

}
