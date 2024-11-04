package egovframework.example.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("MultiDAO")
public class MultiDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public void seatInsert(Map<String, Object> map) throws Exception {
		sqlSession.insert("seat.seat_insert", map);
	}
	
	public List<EgovMap> seatSelect() throws Exception {
		List<EgovMap> list = sqlSession.selectList("seat.seat_select");
		return list;
	}
	
	public List<EgovMap> seatUserSelect(String userid) throws Exception {
		List<EgovMap> list = sqlSession.selectList("seat.seat_user_select", userid);
		return list;
	}

}
