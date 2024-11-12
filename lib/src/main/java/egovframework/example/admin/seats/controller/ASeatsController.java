package egovframework.example.admin.seats.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import egovframework.example.admin.seats.dao.ASeatsDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin/seat/*")
public class ASeatsController {

	@Resource(name = "ASeatsDAO")
	private ASeatsDAO AseatsDao;

	@RequestMapping(value = "seatList.do", method = RequestMethod.GET)
	public String seatList() throws Exception {
		return "/admin/seat/seatList";
	}

	// 회원 데이터
	@ResponseBody
	@RequestMapping(value = "seatData.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String seatData(@RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "kwd", defaultValue = "") String kwdData) throws Exception {
		System.out.println(kwdData);

		try {
			// 키워드와 페이지 전달
			Pagination pinfo = new Pagination();
			pinfo.setsKey(kwdData);
			pinfo.setPage(pageNum);

			int count = AseatsDao.seatCount(pinfo);

			// 페이징처리
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(pinfo.getPage());
			paginationInfo.setRecordCountPerPage(pinfo.getPageUnit());
			paginationInfo.setPageSize(pinfo.getPageSize());

			paginationInfo.setTotalRecordCount(count);
			pinfo.setFirstIndex(paginationInfo.getFirstRecordIndex());
			pinfo.setLastIndex(paginationInfo.getLastRecordIndex());
			pinfo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			List<EgovMap> list = AseatsDao.seatlist(pinfo);

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

	@ResponseBody
	@RequestMapping(value = "seatDelete.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String seatDelete(@RequestBody String param) throws Exception {

		ObjectMapper objectMapper = new ObjectMapper();
		List<Map<String, Object>> idList = objectMapper.readValue(param, new TypeReference<List<Map<String, Object>>>() {});

		try {
			for (Map<String, Object> map : idList) {
				int seatId = Integer.parseInt(map.get("id").toString());
				AseatsDao.deleteSeat(seatId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

}
