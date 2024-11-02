package egovframework.example.admin.books.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.admin.books.service.AWishFileService;

@Service("AWishFileService")
public class AWishFileServiceImpl implements AWishFileService {

	@Resource(name = "AWishDAO")
	private AWishDAO AWishDao;
	
	private static String path = "C:\\fileupload\\lib\\wish";
	
	@Override
	public void updateWishImage(int id, String ctgId, MultipartFile multifile) throws Exception {
		
		if (multifile.getSize() > 0 && !multifile.getOriginalFilename().equals("")) {
			
			String fileNm = multifile.getOriginalFilename();
			String Fname = fileNm.substring(0, fileNm.lastIndexOf("."));
			String ext = FilenameUtils.getExtension(fileNm);
			String fileOriNm = ctgId + "_" + Fname + "_" + UUID.randomUUID() + "." + ext;
			String filePath = path + "\\" + fileOriNm;

			try {

				//기존 파일 삭제
				String path = AWishDao.selectWishFile(id);

				if (path != null) {
					new File(path).delete();
					AWishDao.deleteWishFile(id);
				}

				//파일저장
				File uploadFile = new File(filePath);
				multifile.transferTo(uploadFile);

				Map<String, Object> map = new HashMap();
				map.put("id", id);
				map.put("fileNm", fileNm);
				map.put("fileOriNm", fileOriNm);
				map.put("filePath", filePath);

				AWishDao.insertWishFile(map);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void deleteWishFile(int id) {
		String path = AWishDao.selectWishFile(id);
		if (path != null) {
			new File(path).delete();
			AWishDao.deleteWishFile(id);
		}
	}
}
