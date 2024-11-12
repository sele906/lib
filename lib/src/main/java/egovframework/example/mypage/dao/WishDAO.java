package egovframework.example.mypage.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("WishDAO")
public class WishDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/** ID Generation */
	@Resource(name = "wishIds")
	private EgovIdGnrService wishIds;

	public List<EgovMap> wishList(Map<String, Object> map) {
		List<EgovMap> list = sqlSession.selectList("wish.wish_list", map);
		return list;
	}

	public int wishCount(Map<String, Object> map) {
		int count = sqlSession.selectOne("wish.wish_count", map);
		return count;
	}

	public void wishDelete(Map<String, Object> map) {
		sqlSession.delete("wish.wish_delete", map);
	}

}
