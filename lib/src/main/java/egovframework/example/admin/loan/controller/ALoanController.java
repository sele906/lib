package egovframework.example.admin.loan.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
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
import egovframework.example.admin.loan.dao.ALoanDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin/loan/*")
public class ALoanController {

	@Resource(name = "ALoanDAO")
	private ALoanDAO AloanDao;

	@RequestMapping(value = "loanList.do", method = RequestMethod.GET)
	public String loanList() throws Exception {
		return "/admin/loan/loanList";
	}

	// 도서 데이터
	@ResponseBody
	@RequestMapping(value = "loanData.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String loanData(@RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "kwd", defaultValue = "") String kwdData) throws Exception {

		try {
			// 키워드와 페이지 전달
			Pagination pinfo = new Pagination();
			pinfo.setsKey(kwdData);
			pinfo.setPage(pageNum);

			int count = AloanDao.loanCount(pinfo);

			// 페이징처리
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(pinfo.getPage());
			paginationInfo.setRecordCountPerPage(pinfo.getPageUnit());
			paginationInfo.setPageSize(pinfo.getPageSize());

			paginationInfo.setTotalRecordCount(count);
			pinfo.setFirstIndex(paginationInfo.getFirstRecordIndex());
			pinfo.setLastIndex(paginationInfo.getLastRecordIndex());
			pinfo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			List<EgovMap> list = AloanDao.loanlist(pinfo);

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
	@RequestMapping(value = "loanUpdateData.do", method = RequestMethod.POST)
	public String loanUpdateData(@RequestParam(name = "loanId") int loanId, @RequestParam(name = "userid") String userid, @RequestParam(name = "loanDate") String loanDate, @RequestParam(name = "returnDate") String returnDate, @RequestParam(name = "loanState") String loanState) throws Exception {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Map<String, Object> map = new HashMap();
		map.put("loanId", loanId);
		map.put("userid", userid);
		map.put("loanDate", dateFormat.parse(loanDate));
		map.put("returnDate", dateFormat.parse(returnDate));
		map.put("loanState", loanState);

		try {
			AloanDao.updateLoan(map);
			AloanDao.loanStateUpdate(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "loanDelete.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String loanDelete(@RequestBody String param) throws Exception {

		ObjectMapper objectMapper = new ObjectMapper();
		List<Map<String, Object>> idList = objectMapper.readValue(param, new TypeReference<List<Map<String, Object>>>() {});
		try {
			for (Map<String, Object> map : idList) {
				int id = Integer.parseInt((String) map.get("id"));
				AloanDao.deleteLoan(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "overdueUndoData.do", method = RequestMethod.POST)
	public String overdueUndoData(@RequestParam(name = "loanId") int loanId) throws Exception {

		try {
			AloanDao.overdueRedoUpdate(loanId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

}
