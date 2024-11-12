package egovframework.example.service.service.impl;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.service.dao.WishDAO;
import egovframework.example.service.service.WishFileService;

@Service("WishFileService")
public class WishFileServiceImpl implements WishFileService {

	@Resource(name = "WishDAO")
	private WishDAO wishDao;

	private static String path = "C:\\fileupload\\lib\\wish";

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

			wishDao.insertFile(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteFile(int id) throws Exception {
		String path = wishDao.getFilePath(id);
		if (path != null) {
			new File(path).delete();
			wishDao.deleteFile(id);
		}
	}

}
