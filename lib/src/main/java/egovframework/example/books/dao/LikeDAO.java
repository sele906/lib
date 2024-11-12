package egovframework.example.books.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("LikeDAO")
public class LikeDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//추가
	public void likeAdd(Map<String, Object> map) throws Exception {
		try {
			sqlSession.insert("like.like_add", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//관심해제
	public void likeDelete(Map<String, Object> map) throws Exception {
		try {
			sqlSession.delete("like.like_delete", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
