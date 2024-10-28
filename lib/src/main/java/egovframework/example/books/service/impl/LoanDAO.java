package egovframework.example.books.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.books.service.LoanVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("LoanDAO")
public class LoanDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/** ID Generation */
	@Resource(name = "loanIds")
	private EgovIdGnrService loanIds;

	//대출 신청
	public int loanInsert(LoanVO vo) throws Exception {
		int idx = loanIds.getNextIntegerId();
		vo.setLoanId(idx);

		try {
			sqlSession.insert("loan.loan_insert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return idx;
	}

	public List<EgovMap> loanList(Map<String, Object> map) throws Exception {

		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("loan_list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int loanCount() {
		int count = 0;
		try {
			count = sqlSession.selectOne("loan_count");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public EgovMap loanDateInfo(int loanId) {
		EgovMap map = null;
		try {
			map = sqlSession.selectOne("loan_date_info", loanId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public void extendsDate(int loanId) {
		try {
			sqlSession.update("loan_extends", loanId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void returnState(int loanId) {
		try {
			sqlSession.update("loan_return", loanId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void loanDuedateUpdate(Map<String, Object> map) {
		try {
			sqlSession.update("loan_duedate_update", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void returndateUpdate(Map<String, Object> map) {
		try {
			sqlSession.update("loan_returndate_update", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
