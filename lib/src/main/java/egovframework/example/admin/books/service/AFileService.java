package egovframework.example.admin.books.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface AFileService {

	public void insertImage(int id, String imgURL, String path) throws IOException;

	public void updateImage(int id, String ctgId, MultipartFile multiFile) throws IOException;

	public void deleteFile(int id) throws IOException;

	public void moveImage(int id, String imgNm, String fileOriNm);

}
