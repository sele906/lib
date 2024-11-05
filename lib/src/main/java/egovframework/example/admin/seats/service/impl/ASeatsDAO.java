package egovframework.example.admin.seats.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.Pagination;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("ASeatsDAO")
public class ASeatsDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//리스트
	public List<EgovMap> seatlist(Pagination pinfo) throws Exception {
		List<EgovMap> list = sqlSession.selectList("Aseat.seat_list", pinfo);
		return list;
	}

	//리스트개수
	public int seatCount(Pagination pinfo) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("Aseat.seat_count", pinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public void deleteSeat(int seatId) {
		sqlSession.delete("Aseat.seat_delete", seatId);

	}
}
