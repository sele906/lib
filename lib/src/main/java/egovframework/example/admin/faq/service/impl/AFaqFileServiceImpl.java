package egovframework.example.admin.faq.service.impl;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.admin.faq.dao.AFaqDAO;
import egovframework.example.admin.faq.service.AFaqFileService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("AFaqFileService")
public class AFaqFileServiceImpl implements AFaqFileService {

	@Resource(name = "AFaqDAO")
	private AFaqDAO AfaqDao;
	
	@Value("${faqPath}")
	private String faqPath;

	public void insertFile(int id, List<MultipartFile> multifile) throws Exception {

		List<Map<String, String>> tmp = new ArrayList<>();

		if (multifile.size() > 0 && !multifile.get(0).getOriginalFilename().equals("")) {

			try {

				for (int i = 0; i < multifile.size(); i++) {

					//파일명 지정
					String originFile = multifile.get(i).getOriginalFilename();
					String originFileName = originFile.substring(0, originFile.lastIndexOf("."));
					String ext = FilenameUtils.getExtension(originFile);
					String newFileNm = originFileName + "_" + UUID.randomUUID() + "." + ext;

					//파일 로컬에 올리기
					File uploadFile = new File(faqPath + newFileNm);
					multifile.get(i).transferTo(uploadFile);

					//파일정보 DB에 저장
					Map<String, Object> map = new HashMap();
					map.put("faqId", id);
					map.put("faqFileName", originFile);
					map.put("faqFileOriName", newFileNm);
					map.put("faqFilePath", (String) faqPath + newFileNm);

					//db에 파일정보 저장
					try {
						AfaqDao.insertFile(map);
					} catch (Exception e) {
						e.printStackTrace();
					}

					//리스트에 정보 저장
					Map<String, String> m = new HashMap();
					m.put("newFileNm", newFileNm);
					tmp.add(m);
				}

			} catch (Exception e) {

				//성공 못했을 경우
				//파일 삭제
				for (int i = 0; i < multifile.size(); i++) {
					new File(faqPath + tmp.get(i).get("newFileNm")).delete();
				}

				//db 정보 삭제
				AfaqDao.deleteFile(id);

				e.printStackTrace();
			}
		}
	}

	@Override
	public void downloadFile(HttpServletResponse response, String fileName) throws Exception {
		
		try {
			File file = new File(faqPath + fileName);
			
			byte fileByte[] = FileUtils.readFileToByteArray(file);

			response.setContentType("application/octet-stream");
			response.setContentLengthLong(fileByte.length);

			response.setHeader("Content-Disposition", "attachment;filename=\"" + URLEncoder.encode(fileName, "UTF-8") + "\";");
			response.setHeader("Content-TransferEncoding", "binary");

			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}

	//특정 게시물의 파일들 삭제
	@Override
	public void deleteFaqFile(int faqId) throws Exception {

		List<EgovMap> tmp = AfaqDao.selectFile(faqId);

		//파일 삭제
		for (EgovMap e : tmp) {
			String faqPathNm = faqPath + e.get("faqFileOriName");
			File file = new File(faqPathNm);
			file.delete();
		}

		//파일 db 삭제
		AfaqDao.deleteFile(faqId);

	}

	@Override
	public void fileDeleteOne(String fileName) {

		try {
			String faqPathNm = faqPath + fileName;
			File file = new File(faqPathNm);
			file.delete();

			int faqFileId = AfaqDao.selectFileId(fileName);
			//파일 db 삭제
			AfaqDao.deleteFileOne(faqFileId);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
