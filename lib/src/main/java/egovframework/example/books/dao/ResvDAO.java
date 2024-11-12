package egovframework.example.books.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("ResvDAO")
public class ResvDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//예약
	public void resvInsert(Map<String, Object> map) throws Exception {

		try {
			sqlSession.insert("resv.resv_insert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<EgovMap> resvList(Map<String, Object> map) throws Exception {

		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("resv.resv_list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int resvCount(Map<String, Object> map) {
		int count = 0;
		try {
			count = sqlSession.selectOne("resv.resv_count", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	//체크
	public EgovMap resvChkLoan(Map<String, Object> map) {
		EgovMap emap = null;
		try {
			emap = sqlSession.selectOne("resv.resv_chk_loan", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emap;
	}

	public int resvChkResv(Map<String, Object> map) {
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne("resv.resv_chk_resv", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int resvChkResvCnt(int bookId) {
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne("resv.resv_chk_resv_cnt", bookId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public EgovMap resvUserSelect(EgovMap param) {
		EgovMap emap = null;
		try {
			emap = sqlSession.selectOne("resv.resv_user_select", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emap;
	}

	public void resvDelete(Map<String, Object> map) {
		try {
			sqlSession.delete("resv.resv_delete", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
