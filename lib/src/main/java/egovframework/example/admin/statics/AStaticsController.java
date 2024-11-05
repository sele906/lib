package egovframework.example.admin.statics;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.admin.statics.service.StatService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping("/admin/statics/*")
public class AStaticsController {

	@Resource(name = "StatService")
	StatService statService;

	@RequestMapping(value = "statics.do", method = RequestMethod.GET)
	public String statics() throws Exception {
		return "/admin/statics/statics";
	}

	@ResponseBody
	@RequestMapping(value = "statData.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String statData() throws Exception {

		try {
			List<EgovMap> loanStats = statService.loanStat();
			List<EgovMap> returnStats = statService.returnStat();
			List<EgovMap> userStats = statService.userStat();
			List<EgovMap> adminStats = statService.adminStat();
			List<EgovMap> bookStats = statService.bookStat();

			List<String> labels = new ArrayList<>();
			List<Integer> loanData = new ArrayList<>();
			List<Integer> returnData = new ArrayList<>();
			List<Integer> userData = new ArrayList<>();
			List<Integer> adminData = new ArrayList<>();
			List<String> booklabels = new ArrayList<>();
			List<BigDecimal> bookData = new ArrayList<>();

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			for (int i = 0; i < loanStats.size(); i++) {

				EgovMap loanStat = loanStats.get(i);
				EgovMap returnStat = returnStats.get(i);
				EgovMap userStat = userStats.get(i);
				EgovMap adminStat = adminStats.get(i);

				Date loanDate = (Date) loanStat.get("loanDate");
				labels.add(dateFormat.format(loanDate));

				Long loanCount = (Long) loanStat.get("count");
				loanData.add(loanCount != null ? loanCount.intValue() : 0);

				Long returnCount = (Long) returnStat.get("count");
				returnData.add(returnCount != null ? returnCount.intValue() : 0);

				Long userCount = (Long) userStat.get("count");
				userData.add(userCount != null ? userCount.intValue() : 0);

				Long adminCount = (Long) adminStat.get("count");
				adminData.add(adminCount != null ? adminCount.intValue() : 0);

			}

			for (int i = 0; i < bookStats.size(); i++) {

				EgovMap bookStat = bookStats.get(i);

				String ctgNm = (String) bookStat.get("ctgNm");
				booklabels.add(ctgNm);

				BigDecimal percent = (BigDecimal) bookStat.get("percent");
				bookData.add(percent);

			}

			// Create an array of the results to return
			JSONArray jsonArray = new JSONArray();
			jsonArray.put(labels);
			jsonArray.put(loanData);
			jsonArray.put(returnData);
			jsonArray.put(userData);
			jsonArray.put(adminData);
			jsonArray.put(booklabels);
			jsonArray.put(bookData);

			return jsonArray.toString();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "error";

	}
}
