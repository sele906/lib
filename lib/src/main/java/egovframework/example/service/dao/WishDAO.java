package egovframework.example.service.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Repository("WishDAO")
public class WishDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/** ID Generation */
	@Resource(name = "wishIds")
	private EgovIdGnrService wishIds;

	public int wishInsert(Map<String, Object> map) throws Exception {

		/** ID Generation */
		int id = wishIds.getNextIntegerId();
		map.put("wishId", id);

		sqlSession.insert("wish.wish_insert", map);

		return id;
	}

	public void insertFile(Map<String, Object> map) {
		sqlSession.insert("wish.wish_file_insert", map);
	}

	public String getFilePath(int wishId) {
		String path = sqlSession.selectOne("wish.get_file_path", wishId);
		return path;
	}

	public void deleteFile(int wishId) {
		sqlSession.delete("wish.wish_file_delete", wishId);
	}

}
