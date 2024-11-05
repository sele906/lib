package egovframework.example.admin.statics.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("StatDAO")
public class StatDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public void statInsert(Map<String, Object> map) throws Exception {
		sqlSession.insert("stat.add_login", map);
	}

	public List<EgovMap> loanStat() throws Exception {
		List<EgovMap> list = sqlSession.selectList("stat.loan_stat");
		return list;
	}

	public List<EgovMap> returnStat() throws Exception {
		List<EgovMap> list = sqlSession.selectList("stat.return_stat");
		return list;
	}

	public List<EgovMap> userStat() throws Exception {
		List<EgovMap> list = sqlSession.selectList("stat.log_user_stat");
		return list;
	}

	public List<EgovMap> adminStat() throws Exception {
		List<EgovMap> list = sqlSession.selectList("stat.log_admin_stat");
		return list;
	}

	public List<EgovMap> bookStat() throws Exception {
		List<EgovMap> list = sqlSession.selectList("stat.book_stat");
		return list;
	}
}
