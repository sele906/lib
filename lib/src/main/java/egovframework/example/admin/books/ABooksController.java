package egovframework.example.admin.books;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/books/*")
public class ABooksController {

	//서지정보 api 불러오기
	@Value("${nl.KEY}")
	private String nlApiKey;

	@RequestMapping(value = "wishList.do", method = RequestMethod.GET)
	public String wishList() throws Exception {
		return "/admin/books/wishList";
	}

	@RequestMapping(value = "addBook.do")
	public String addBook() throws Exception {
		return "/admin/books/addBook";
	}

	@ResponseBody
	@RequestMapping(value = "apiData.do", method = RequestMethod.GET, produces = "application/xml; charset=utf-8")
	public String apiData() throws Exception {

		String key = URLEncoder.encode(nlApiKey, "UTF-8");
		String kwd = URLEncoder.encode("토지", "UTF-8");
		String apiURL = "https://www.nl.go.kr/NL/search/openApi/search.do?key=" + key + "&kwd=" + kwd;

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

		JSONObject jsonRawData = XML.toJSONObject(sb.toString());

		JSONObject jsonObjList = jsonRawData.getJSONObject("root").getJSONObject("result");

		JSONArray jarray = jsonObjList.getJSONArray("item");

		return jarray.toString();
	}

	@RequestMapping(value = "bookList.do", method = RequestMethod.GET)
	public String bookList() throws Exception {
		return "/admin/books/bookList";
	}

}
