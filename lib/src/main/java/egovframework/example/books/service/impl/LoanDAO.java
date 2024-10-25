package egovframework.example.books.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.books.service.LoanVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

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

}
