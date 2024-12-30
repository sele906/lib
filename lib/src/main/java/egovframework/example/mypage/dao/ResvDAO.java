package egovframework.example.mypage.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("MResvDAO")
public class ResvDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//예약 리스트
	public List<EgovMap> resvList(Map<String, Object> map) throws Exception {

		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("resv.resv_list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//예약 리스트 개수
	public int resvCount(Map<String, Object> map) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("resv.resv_count", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	//예약 취소
	public void resvDelete(Map<String, Object> map) throws Exception {
		try {
			sqlSession.delete("resv.resv_delete", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
