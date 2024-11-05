package egovframework.example.admin.loan.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.Pagination;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("ALoanDAO")
public class ALoanDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//리스트
	public List<EgovMap> loanlist(Pagination pinfo) throws Exception {
		List<EgovMap> list = sqlSession.selectList("Aloan.loans_list", pinfo);
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

	public void updateLoan(Map<String, Object> map) {
		sqlSession.update("Aloan.loan_update", map);
	}

	public void deleteLoan(int id) {
		sqlSession.delete("Aloan.loan_delete", id);
	}

}
