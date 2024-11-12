package egovframework.example.service.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.service.model.MultiVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("MultiDAO")
public class MultiDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public void seatInsert(MultiVO vo) throws Exception {
		sqlSession.insert("seat.seat_insert", vo);
	}

	public List<EgovMap> seatSelect() throws Exception {
		List<EgovMap> list = sqlSession.selectList("seat.seat_select");
		return list;
	}

}
