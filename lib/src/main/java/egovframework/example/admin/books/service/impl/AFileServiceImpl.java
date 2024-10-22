package egovframework.example.admin.books.service.impl;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.admin.books.service.AFileService;

@Service("AFileService")
public class AFileServiceImpl implements AFileService {

	@Resource(name = "ABooksDAO")
	private ABooksDAO AbooksDao;

	private static String path = "C:\\fileupload\\lib\\books";

	public void insertImage(int id, String imgURL, String fileOriNm) throws IOException {

		String filePath = path + "\\" + fileOriNm;

		URL url = new URL(imgURL);

		try {

			//파일 다운로드
			BufferedInputStream in = new BufferedInputStream(url.openStream());
			FileOutputStream out = new FileOutputStream(filePath);

			byte[] dataBuffer = new byte[1024];
			int bytesRead;

			while ((bytesRead = in.read(dataBuffer, 0, 1024)) != -1) {
				out.write(dataBuffer, 0, bytesRead);
			}

			//파일 DB에 저장
			String fileNm = fileOriNm.substring(0, 11) + fileOriNm.substring(fileOriNm.lastIndexOf("."));

			Map<String, Object> map = new HashMap();
			map.put("id", id);
			map.put("fileNm", fileNm);
			map.put("fileOriNm", fileOriNm);
			map.put("filePath", filePath);

			AbooksDao.insertFile(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void updateImage(int id, String ctgId, MultipartFile multiFile) throws IOException {

		if (multiFile.getSize() > 0 && !multiFile.getOriginalFilename().equals("")) {
			String fileNm = multiFile.getOriginalFilename();
			String Fname = fileNm.substring(0, fileNm.lastIndexOf("."));
			String ext = FilenameUtils.getExtension(fileNm);
			String fileOriNm = ctgId + "_" + Fname + "_" + UUID.randomUUID() + "." + ext;

			String filePath = path + "\\" + fileOriNm;

			try {

				//기존 파일 삭제
				String path = AbooksDao.selectFile(id);

				if (path != null) {
					new File(path).delete();
					AbooksDao.deleteFile(id);
				}

				//파일저장
				File uploadFile = new File(filePath);
				multiFile.transferTo(uploadFile);

				Map<String, Object> map = new HashMap();
				map.put("id", id);
				map.put("fileNm", fileNm);
				map.put("fileOriNm", fileOriNm);
				map.put("filePath", filePath);

				AbooksDao.insertFile(map);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public void deleteFile(int id) throws IOException {

		String path = AbooksDao.selectFile(id);
		if (path != null) {
			new File(path).delete();
			AbooksDao.deleteFile(id);
		}

	}

}
