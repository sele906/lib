package egovframework.example.books.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("ResvDAO")
public class ResvDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//예약 등록
	public void resvInsert(Map<String, Object> map) throws Exception {

		try {
			sqlSession.insert("resv.resv_insert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//예약 체크
	public EgovMap resvChkLoan(Map<String, Object> map) throws Exception {
		EgovMap emap = null;
		try {
			emap = sqlSession.selectOne("resv.resv_chk_loan", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emap;
	}

	public int resvChkResv(Map<String, Object> map) throws Exception {
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne("resv.resv_chk_resv", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int resvChkResvCnt(int bookId) throws Exception {
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne("resv.resv_chk_resv_cnt", bookId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public EgovMap resvUserSelect(EgovMap param) throws Exception {
		EgovMap emap = null;
		try {
			emap = sqlSession.selectOne("resv.resv_user_select", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emap;
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
