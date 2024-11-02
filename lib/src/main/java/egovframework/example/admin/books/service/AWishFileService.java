package egovframework.example.admin.books.service;

import org.springframework.web.multipart.MultipartFile;

public interface AWishFileService {
	
	public void updateWishImage(int id, String ctgId, MultipartFile multifile) throws Exception;

	public void deleteWishFile(int id);

}
