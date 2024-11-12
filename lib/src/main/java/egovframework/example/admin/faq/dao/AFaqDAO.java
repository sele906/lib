package egovframework.example.admin.faq.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.Pagination;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("AFaqDAO")
public class AFaqDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/** ID Generation */
	@Resource(name = "faqIds")
	private EgovIdGnrService faqIds;

	//리스트
	public List<EgovMap> faqlist(Pagination pinfo) throws Exception {
		List<EgovMap> list = sqlSession.selectList("Afaq.faq_list", pinfo);
		return list;
	}

	//리스트개수
	public int faqCount(Pagination pinfo) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("Afaq.faq_count", pinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int insertFaq(Map<String, Object> map) throws Exception {

		/** ID Generation */
		int id = faqIds.getNextIntegerId();
		map.put("faqId", id);
		sqlSession.insert("Afaq.faq_insert", map);

		return id;
	}

	public void updateFaq(Map<String, Object> map) {
		sqlSession.update("Afaq.faq_update", map);
	}

	public void deleteFaq(int faqId) {
		sqlSession.delete("Afaq.faq_delete", faqId);
	}

	public void insertFile(Map<String, Object> map) {
		sqlSession.insert("Afaq.faq_file_insert", map);
	}

	public void deleteFile(int id) {
		sqlSession.delete("Afaq.faq_file_delete", id);
	}

	public List<EgovMap> selectFile(int faqId) {
		List<EgovMap> list = sqlSession.selectList("Afaq.faq_select_file", faqId);
		return list;
	}

	public int selectFileId(String fileName) {
		int faqFileId = sqlSession.selectOne("Afaq.select_file_id", fileName);
		return faqFileId;
	}

	public void deleteFileOne(int faqFileId) {
		sqlSession.delete("Afaq.faq_delete_one", faqFileId);
	}
}
