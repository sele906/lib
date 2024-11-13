package egovframework.example.admin.loan.controller;

import java.text.SimpleDateFormat;
import java.util.List;

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
import egovframework.example.admin.loan.model.ALoanVO;
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

			List<ALoanVO> list = AloanDao.loanlist(pinfo);

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
	public String loanUpdateData(ALoanVO vo) throws Exception {

		vo.setLoanDate(java.sql.Date.valueOf(vo.getLoanDateStr()));
		vo.setReturnDate(java.sql.Date.valueOf(vo.getReturnDateStr()));

		try {
			AloanDao.updateLoan(vo);
			AloanDao.loanStateUpdate(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "loanDelete.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String loanDelete(@RequestBody String param) throws Exception {

		ObjectMapper mapper = new ObjectMapper();
		List<ALoanVO> loanVO = mapper.readValue(param, new TypeReference<List<ALoanVO>>() {});

		try {
			for (ALoanVO vo : loanVO) {
				int id = vo.getLoanId();
				AloanDao.deleteLoan(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "overdueUndoData.do", method = RequestMethod.POST)
	public String overdueUndoData(ALoanVO vo) throws Exception {

		try {
			AloanDao.overdueRedoUpdate(vo.getLoanId());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

}
