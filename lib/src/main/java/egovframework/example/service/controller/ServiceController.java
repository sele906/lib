package egovframework.example.service.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.example.Pagination;
import egovframework.example.admin.faq.service.AFaqFileService;
import egovframework.example.mypage.Pagination8;
import egovframework.example.service.dao.FaqDAO;
import egovframework.example.service.dao.MultiDAO;
import egovframework.example.service.dao.WishDAO;
import egovframework.example.service.service.WishFileService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/service/*")
public class ServiceController {

	//서지정보 api 불러오기
	@Value("${nl.KEY}")
	private String nlApiKey;

	@Resource(name = "WishDAO")
	private WishDAO wishDao;

	@Resource(name = "MultiDAO")
	private MultiDAO multiDao;

	@Resource(name = "FaqDAO")
	private FaqDAO faqDao;

	@Resource(name = "AFaqFileService")
	private AFaqFileService fileService;

	@Resource(name = "WishFileService")
	private WishFileService WishFileService;

	@RequestMapping(value = "wishBooks.do", method = RequestMethod.GET)
	public String wishBooks(@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "kwd", defaultValue = "토지") String kwdData, Model model) throws Exception {

		String key = URLEncoder.encode(nlApiKey, "UTF-8");
		String kwd = URLEncoder.encode(kwdData, "UTF-8");
		String apiURL = "https://www.nl.go.kr/NL/search/openApi/search.do?key=" + key + "&kwd=" + kwd + "&pageNum=" + page + "&pageSize=8";

		Pagination8 pinfo = new Pagination8();
		pinfo.setPage(page);
		pinfo.setsKey(kwdData);

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

		List<Map<String, Object>> list = new ArrayList<>();

		for (int i = 0; i < jarray.length(); i++) {
			JSONObject jsonObject = jarray.getJSONObject(i);
			Map<String, Object> map = new HashMap<>();

			for (String k : jsonObject.keySet()) {
				map.put(k, jsonObject.get(k));
			}

			list.add(map);
		}

		//param
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pinfo.getPage());
		paginationInfo.setRecordCountPerPage(pinfo.getPageUnit());
		paginationInfo.setPageSize(pinfo.getPageSize());

		paginationInfo.setTotalRecordCount(jsonObjparam.getInt("total"));
		pinfo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pinfo.setLastIndex(paginationInfo.getLastRecordIndex());
		pinfo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = new HashMap();
		map.put("page", jsonObjparam.getInt("pageNum"));
		map.put("kwd", kwdData);

		model.addAttribute("pinfo", pinfo);
		model.addAttribute("pageInfo", paginationInfo);
		model.addAttribute("map", map);
		model.addAttribute("list", list);

		return "service/wishBooks";
	}

	//api 데이터 불러오기
	@ResponseBody
	@RequestMapping(value = "addWishList.do", method = RequestMethod.POST)
	public String addWishList(@RequestBody String data, HttpSession session) throws Exception {

		String userid = (String) session.getAttribute("userid");

		ObjectMapper objectMapper = new ObjectMapper();
		TypeReference<Map<String, Object>> typeReference = new TypeReference<Map<String, Object>>() {};

		Map<String, Object> returnData = objectMapper.readValue(data, typeReference);
		returnData.put("userid", userid);

		try {
			int id = wishDao.wishInsert(returnData);

			//이미지 처리
			String imgURL = (String) returnData.get("url");
			String fileExtension = imgURL.contains(".png") ? ".png" : imgURL.contains(".jpg") ? ".jpg" : null;

			if (fileExtension != null) {
				String fileOriNm = UUID.randomUUID() + fileExtension;
				WishFileService.insertImage(id, imgURL, fileOriNm);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@RequestMapping(value = "multiSeats.do", method = RequestMethod.GET)
	public String multiSeats(@RequestParam(name = "msg", required = false) String msg, Model model) throws Exception {
		List<EgovMap> list = multiDao.seatSelect();
		model.addAttribute("list", list);
		model.addAttribute("msg", msg);
		return "service/seat";
	}

	@RequestMapping(value = "multiSeats.do", method = RequestMethod.POST)
	public String multiSeats(@RequestParam(name = "seatNum") String seatNum, HttpSession session) throws Exception {

		String userid = (String) session.getAttribute("userid");
		String[] seatArray = seatNum.split(",");

		try {
			for (String seat : seatArray) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("seatNum", Integer.parseInt(seat));
				map.put("status", "Y");
				map.put("userid", userid);

				multiDao.seatInsert(map);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/service/multiSeats.do?msg=success";
	}

	@RequestMapping(value = "faq.do", method = RequestMethod.GET)
	public String faq(@RequestParam(name = "page", defaultValue = "1") int page, Model model) throws Exception {

		Pagination pinfo = new Pagination();
		pinfo.setPage(page);

		int count = faqDao.faqCount(pinfo);

		//페이징처리
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pinfo.getPage());
		paginationInfo.setRecordCountPerPage(pinfo.getPageUnit());
		paginationInfo.setPageSize(pinfo.getPageSize());

		paginationInfo.setTotalRecordCount(count);
		pinfo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pinfo.setLastIndex(paginationInfo.getLastRecordIndex());
		pinfo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<EgovMap> list = faqDao.faqlist(pinfo);

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pinfo", pinfo);
		model.addAttribute("pageInfo", paginationInfo);
		return "service/faq";
	}

	@ResponseBody
	@RequestMapping(value = "faqFile.do", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public String faqFile(@RequestParam(name = "faqId") int faqId) throws Exception {

		List<EgovMap> list = null;
		try {
			list = faqDao.faqFileList(faqId);
			ObjectMapper objectMapper = new ObjectMapper();
			objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
			String result = objectMapper.writeValueAsString(list);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}

	//파일 다운로드
	@ResponseBody
	@RequestMapping(value = "/fileDownload.do", method = RequestMethod.POST)
	public void fileDownload(@RequestParam(name = "fileName") String fileName, HttpServletResponse response, Model model) throws Exception {

		//파일 다운로드
		try {
			fileService.downloadFile(response, fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
