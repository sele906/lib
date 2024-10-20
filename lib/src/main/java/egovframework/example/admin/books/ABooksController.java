package egovframework.example.admin.books;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.example.Pagination;
import egovframework.example.admin.books.service.AFileService;
import egovframework.example.admin.books.service.impl.ABooksDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin/books/*")
public class ABooksController {

	@Resource(name = "AFileService")
	private AFileService AFileService;

	//임시
	@Resource(name = "ABooksDAO")
	private ABooksDAO AbooksDao;

	//서지정보 api 불러오기
	@Value("${nl.KEY}")
	private String nlApiKey;

	@RequestMapping(value = "addBook.do")
	public String addBook() throws Exception {

		return "/admin/books/addBook";
	}

	//api 데이터 불러오기
	@ResponseBody
	@RequestMapping(value = "apiData.do", method = RequestMethod.GET, produces = "application/xml; charset=utf-8")
	public String apiData(@RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "kwd", defaultValue = "토지") String kwdData) throws Exception {

		String key = URLEncoder.encode(nlApiKey, "UTF-8");
		String kwd = URLEncoder.encode(kwdData, "UTF-8");
		String apiURL = "https://www.nl.go.kr/NL/search/openApi/search.do?key=" + key + "&kwd=" + kwd + "&pageNum=" + pageNum;

		URL url = new URL(apiURL);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

		// 요청 방식을 GET으로 설정
		conn.setRequestMethod("GET");

		// 요청의 Accept 헤더 설정
		conn.setRequestProperty("Accept", "application/xml");

		// 입력 스트림으로 conn 요청에 대한 응답 반환
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		StringBuilder sb = new StringBuilder();

		String line;

		while ((line = br.readLine()) != null) {
			sb.append(line);
			sb.append("\n");
		}

		br.close();
		conn.disconnect();

		//item
		JSONObject jsonRawData = XML.toJSONObject(sb.toString());
		JSONObject jsonObjList = jsonRawData.getJSONObject("root").getJSONObject("result");
		JSONObject jsonObjparam = jsonRawData.getJSONObject("root").getJSONObject("paramData");
		JSONArray jarray = jsonObjList.getJSONArray("item");

		//param
		JSONObject paramData = new JSONObject();
		paramData.put("total", jsonObjparam.getInt("total"));
		paramData.put("pageSize", jsonObjparam.getInt("pageSize"));
		paramData.put("pageNum", jsonObjparam.getInt("pageNum"));

		//item param 합치기
		JSONArray RArray = new JSONArray();
		RArray.put(paramData);

		JSONObject itemData = new JSONObject();
		itemData.put("items", jarray);
		RArray.put(itemData);

		return RArray.toString();
	}

	//DB에 삽입
	@ResponseBody
	@RequestMapping(value = "insertBook.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String insertBook(@RequestBody String param) throws Exception {
		String result = "";

		ObjectMapper objectMapper = new ObjectMapper();
		List<Map<String, Object>> bookList = objectMapper.readValue(param, new TypeReference<List<Map<String, Object>>>() {});

		for (Map<String, Object> bookMap : bookList) {

			//카테고리 이름 > 코드 변환
			String ctg = (String) bookMap.get("ctg");
			Map<String, Object> ctgNm = new HashMap();
			ctgNm.put("sclsNm", ctg);
			ctgNm.put("sclsCd", "");

			EgovMap ctgMap = AbooksDao.codeChange(ctgNm);
			bookMap.put("ctgId", ctgMap.get("sclsCd"));
			bookMap.remove("ctg");

			//데이터 삽입
			int id = AbooksDao.booksInsert(bookMap);

			//이미지 처리
			String imgURL = (String) bookMap.get("img");
			String fileExtension = imgURL.contains(".png") ? ".png" : imgURL.contains(".jpg") ? ".jpg" : null;

			if (fileExtension != null) {
				String fileOriNm = ctgMap.get("sclsCd") + "_" + UUID.randomUUID() + fileExtension;
				AFileService.insertImage(id, imgURL, fileOriNm);
			}

		}

		result = "success";

		if (result.equals("success")) {
			return "success";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "wishList.do", method = RequestMethod.GET)
	public String wishList() throws Exception {
		return "/admin/books/wishList";
	}

	@RequestMapping(value = "bookList.do", method = RequestMethod.GET)
	public String bookList() throws Exception {

		return "/admin/books/bookList";
	}

	//도서 데이터
	@ResponseBody
	@RequestMapping(value = "bookData.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String bookData(@RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "kwd", defaultValue = "") String kwdData) throws Exception {

		//키워드와 페이지 전달
		Pagination pinfo = new Pagination();
		pinfo.setsKey(kwdData);
		pinfo.setPage(pageNum);

		int count = AbooksDao.bookCount(pinfo);

		//페이징처리
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pinfo.getPage());
		paginationInfo.setRecordCountPerPage(pinfo.getPageUnit());
		paginationInfo.setPageSize(pinfo.getPageSize());

		paginationInfo.setTotalRecordCount(count);
		pinfo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pinfo.setLastIndex(paginationInfo.getLastRecordIndex());
		pinfo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<EgovMap> list = AbooksDao.booklist(pinfo);

		//param
		JSONObject paramData = new JSONObject();
		paramData.put("total", count);
		paramData.put("pageSize", pinfo.getRecordCountPerPage());
		paramData.put("page", pinfo.getFirstIndex());

		//items
		ObjectMapper objectMapper = new ObjectMapper();
		String items = objectMapper.writeValueAsString(list);

		//item param 합치기
		JSONArray RArray = new JSONArray();
		RArray.put(paramData);

		JSONArray jarray = new JSONArray(items);
		JSONObject itemData = new JSONObject();
		itemData.put("items", jarray);
		RArray.put(itemData);

		return RArray.toString();
	}

}
