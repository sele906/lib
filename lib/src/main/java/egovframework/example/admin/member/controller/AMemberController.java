package egovframework.example.admin.member.controller;

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
import egovframework.example.admin.member.dao.AMemDAO;
import egovframework.example.admin.member.model.MemberVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin/member/*")
public class AMemberController {

	@Resource(name = "AMemDAO")
	private AMemDAO AMemDao;

	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String list() throws Exception {
		return "/admin/member/memberList";
	}

	// 회원 데이터
	@ResponseBody
	@RequestMapping(value = "memData.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String memData(@RequestParam(name = "page", defaultValue = "1") int pageNum, @RequestParam(name = "kwd", defaultValue = "") String kwdData) throws Exception {
		System.out.println(kwdData);

		try {
			// 키워드와 페이지 전달
			Pagination pinfo = new Pagination();
			pinfo.setsKey(kwdData);
			pinfo.setPage(pageNum);

			int count = AMemDao.memCount(pinfo);

			// 페이징처리
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(pinfo.getPage());
			paginationInfo.setRecordCountPerPage(pinfo.getPageUnit());
			paginationInfo.setPageSize(pinfo.getPageSize());

			paginationInfo.setTotalRecordCount(count);
			pinfo.setFirstIndex(paginationInfo.getFirstRecordIndex());
			pinfo.setLastIndex(paginationInfo.getLastRecordIndex());
			pinfo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			List<EgovMap> list = AMemDao.memlist(pinfo);

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
	@RequestMapping(value = "memUpdateData.do", method = RequestMethod.POST)
	public String memUpdateData(MemberVO vo) throws Exception {

		vo.setBirth(java.sql.Date.valueOf(vo.getBirthdate()));
		System.out.println(vo);

		try {
			AMemDao.updateMem(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "memDelete.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String memDelete(@RequestBody String param) throws Exception {

		ObjectMapper objectMapper = new ObjectMapper();
		List<Map<String, Object>> idList = objectMapper.readValue(param, new TypeReference<List<Map<String, Object>>>() {});

		try {
			for (Map<String, Object> map : idList) {
				String userid = (String) map.get("id");
				AMemDao.deleteMem(userid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

}
