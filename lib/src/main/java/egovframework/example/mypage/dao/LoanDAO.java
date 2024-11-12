package egovframework.example.mypage.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("LoanDAO")
public class LoanDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/** ID Generation */
	@Resource(name = "loanIds")
	private EgovIdGnrService loanIds;

	public List<EgovMap> loanList(Map<String, Object> map) throws Exception {

		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("loan.loan_list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int loanCount(Map<String, Object> map) {
		int count = 0;
		try {
			count = sqlSession.selectOne("loan.loan_count", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public EgovMap loanDateInfo(int loanId) {
		EgovMap map = null;
		try {
			map = sqlSession.selectOne("loan.loan_date_info", loanId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public void extendsDate(int loanId) {
		try {
			sqlSession.update("loan.loan_extends", loanId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public EgovMap loanChkOverdue(Map<String, Object> map) {
		EgovMap overdue = null;
		try {
			overdue = sqlSession.selectOne("loan.loan_chk_overdue", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return overdue;
	}

	public void loanNotStateUpdate(Map<String, Object> map) {
		try {
			sqlSession.update("loan.loan_notState_update", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void loanUpdate(Map<String, Object> map) {
		try {
			sqlSession.update("loan.loan_update", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void loanOverdueUpdate(Map<String, Object> map) {
		try {
			sqlSession.update("loan.loan_overdue_update", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//	대출 기록
	public List<EgovMap> loanHistoryList(Map<String, Object> map) throws Exception {

		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("loan.loan_history", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int loanHistoryCount(Map<String, Object> map) throws Exception {

		int count = 0;
		try {
			count = sqlSession.selectOne("loan.loan_history_count", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public EgovMap loanChkResv(int loanId) {
		EgovMap emap = null;
		try {
			emap = sqlSession.selectOne("loan.loan_chk_resv", loanId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emap;
	}

}
