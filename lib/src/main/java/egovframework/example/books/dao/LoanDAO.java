package egovframework.example.books.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.books.model.LoanVO;
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

	public EgovMap overdueCount(String userid) {
		EgovMap emap = null;
		try {
			emap = sqlSession.selectOne("loan.overdue_count", userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emap;
	}

	public EgovMap loanBookCount(String userid) {
		EgovMap emap = null;
		try {
			emap = sqlSession.selectOne("loan.loan_book_count", userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emap;
	}

}
