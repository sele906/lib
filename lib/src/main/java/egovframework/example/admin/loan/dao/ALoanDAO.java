package egovframework.example.admin.loan.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.Pagination;
import egovframework.example.admin.loan.model.ALoanVO;

@Repository("ALoanDAO")
public class ALoanDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//리스트
	public List<ALoanVO> loanlist(Pagination pinfo) throws Exception {
		List<ALoanVO> list = sqlSession.selectList("Aloan.loans_list", pinfo);
		return list;
	}

	//리스트개수
	public int loanCount(Pagination pinfo) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("Aloan.loans_count", pinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public void updateLoan(ALoanVO vo) {
		sqlSession.update("Aloan.loan_update", vo);
	}

	public void loanStateUpdate(ALoanVO vo) {
		sqlSession.update("Aloan.loan_state_update", vo);
	}

	public void overdueRedoUpdate(int loanId) {
		sqlSession.update("Aloan.overdue_redo_update", loanId);
	}

	public void deleteLoan(int id) {
		sqlSession.delete("Aloan.loan_delete", id);
	}

}
