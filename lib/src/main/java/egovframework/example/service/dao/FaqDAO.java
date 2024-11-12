package egovframework.example.service.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.Pagination;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("FaqDAO")
public class FaqDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//리스트
	public List<EgovMap> faqlist(Pagination pinfo) throws Exception {
		List<EgovMap> list = sqlSession.selectList("faq.faq_list", pinfo);
		return list;
	}

	//리스트개수
	public int faqCount(Pagination pinfo) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("faq.faq_count", pinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	//리스트
	public List<EgovMap> faqFileList(int faqId) throws Exception {
		List<EgovMap> list = sqlSession.selectList("faq.faq_file_list", faqId);
		return list;
	}
}
