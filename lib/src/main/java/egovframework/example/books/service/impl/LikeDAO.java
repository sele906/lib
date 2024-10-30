package egovframework.example.books.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("LikeDAO")
public class LikeDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//추가
	public void likeAdd(Map<String, Object> map) {
		try {
			sqlSession.insert("like.like_add", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//리스트
	public List<EgovMap> likeList(Map<String, Object> map) {
		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("like.like_list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int count(Map<String, Object> map) {
		int count = 0;
		try {
			count = sqlSession.selectOne("like.like_count", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public void likeDelete(Map<String, Object> map) {
		try {
			sqlSession.delete("like.like_delete", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
