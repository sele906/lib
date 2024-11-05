package egovframework.example.admin.faq;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.example.Pagination;
import egovframework.example.admin.faq.service.impl.AFaqDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin/faq/*")
public class AFaqController {

	@Resource(name = "AFaqDAO")
	private AFaqDAO AfaqDao;

	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String list() throws Exception {
		return "/admin/faq/faqList";
	}

	// 회원 데이터
	@ResponseBody
	@RequestMapping(value = "faqData.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String memData(@RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "kwd", defaultValue = "") String kwdData) throws Exception {

		try {
			// 키워드와 페이지 전달
			Pagination pinfo = new Pagination();
			pinfo.setsKey(kwdData);
			pinfo.setPage(pageNum);

			int count = AfaqDao.faqCount(pinfo);

			// 페이징처리
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(pinfo.getPage());
			paginationInfo.setRecordCountPerPage(pinfo.getPageUnit());
			paginationInfo.setPageSize(pinfo.getPageSize());

			paginationInfo.setTotalRecordCount(count);
			pinfo.setFirstIndex(paginationInfo.getFirstRecordIndex());
			pinfo.setLastIndex(paginationInfo.getLastRecordIndex());
			pinfo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			List<EgovMap> list = AfaqDao.faqlist(pinfo);

			// param
			JSONObject paramData = new JSONObject();
			paramData.put("total", count);
			paramData.put("pageSize", pinfo.getRecordCountPerPage());
			paramData.put("page", pinfo.getFirstIndex());

			// items
			ObjectMapper objectMapper = new ObjectMapper();
			objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
			String items = objectMapper.writeValueAsString(list);

			// item param 합치기
			JSONArray RArray = new JSONArray();
			RArray.put(paramData);

			JSONArray jarray = new JSONArray(items);
			JSONObject itemData = new JSONObject();
			itemData.put("items", jarray);
			RArray.put(itemData);

			return RArray.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "error";

	}

	// DB에 삽입
	@ResponseBody
	@RequestMapping(value = "insertFaq.do", method = RequestMethod.POST)
	public String insertFaq(@RequestParam(name = "faqId") String faqId, @RequestParam(name = "title") String title, @RequestParam(name = "cnt") String cnt, HttpSession session) throws Exception {

		String userid = (String) session.getAttribute("userid");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("faqId", faqId);
		map.put("title", title);
		map.put("cnt", cnt);

		try {
			AfaqDao.insertFaq(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "updateFaq.do", method = RequestMethod.POST)
	public String updateFaq(@RequestParam(name = "faqId") int faqId, @RequestParam(name = "title") String title, @RequestParam(name = "cnt") String cnt, HttpSession session) throws Exception {

		String userid = (String) session.getAttribute("userid");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("faqId", faqId);
		map.put("title", title);
		map.put("cnt", cnt);

		try {
			AfaqDao.updateFaq(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "faqDelete.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String faqDelete(@RequestBody String param) throws Exception {

		ObjectMapper objectMapper = new ObjectMapper();
		List<Map<String, Object>> idList = objectMapper.readValue(param, new TypeReference<List<Map<String, Object>>>() {});

		try {
			for (Map<String, Object> map : idList) {
				int faqId = Integer.parseInt((String) map.get("id"));
				AfaqDao.deleteFaq(faqId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}
}
