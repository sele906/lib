package egovframework.example.service.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.service.model.WishVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Repository("WishDAO")
public class WishDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/** ID Generation */
	@Resource(name = "wishIds")
	private EgovIdGnrService wishIds;

	public int wishInsert(WishVO vo) throws Exception {

		/** ID Generation */
		int id = wishIds.getNextIntegerId();
		vo.setWishId(id);

		sqlSession.insert("wish.wish_insert", vo);

		return id;
	}

	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("wish.wish_file_insert", map);
	}

	public String getFilePath(int wishId) throws Exception {
		String path = sqlSession.selectOne("wish.get_file_path", wishId);
		return path;
	}

	public void deleteFile(int wishId) throws Exception {
		sqlSession.delete("wish.wish_file_delete", wishId);
	}

}
