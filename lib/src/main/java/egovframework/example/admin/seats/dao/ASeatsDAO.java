package egovframework.example.admin.seats.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.Pagination;
import egovframework.example.admin.seats.model.ASeatsVO;

@Repository("ASeatsDAO")
public class ASeatsDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//리스트
	public List<ASeatsVO> seatlist(Pagination pinfo) throws Exception {
		List<ASeatsVO> list = sqlSession.selectList("Aseat.seat_list", pinfo);
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
