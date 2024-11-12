package egovframework.example.admin.statics.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import egovframework.example.admin.statics.service.StatService;

@WebListener
public class LoginUserCounter implements HttpSessionAttributeListener {

	private StatService StatService;

	//세션 등록시
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {

		//아이디 속성 가진 세션 가져오기
		if ("userid".equals(event.getName())) {

			String userid = (String) event.getSession().getAttribute("userid");
			String level = (String) event.getSession().getAttribute("level");
			Long loginTime = (Long) event.getSession().getAttribute("loginTime");
			Timestamp loginTimestamp = new Timestamp(loginTime);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userid", userid);
			map.put("level", level);
			map.put("loginTime", loginTimestamp);

			//통계 서비스 빈 가져오기
			if (StatService == null) {

				WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(event.getSession().getServletContext());
				StatService = (StatService) context.getBean("StatService");

			}

			//db에 저장
			try {
				StatService.statInsert(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	//세션 삭제시
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
	}

	//세션 변경사항 있을경우
	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
	}
}
