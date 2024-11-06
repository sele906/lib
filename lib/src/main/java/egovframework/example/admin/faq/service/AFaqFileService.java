package egovframework.example.admin.faq.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface AFaqFileService {

	public void insertFile(int id, List<MultipartFile> multifile) throws Exception;

	void downloadFile(HttpServletResponse response, String fileName) throws Exception;

	public void deleteFaqFile(int faqId) throws Exception;

	public void fileDeleteOne(String fileName);

}
