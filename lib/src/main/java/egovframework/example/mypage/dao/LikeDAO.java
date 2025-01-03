package egovframework.example.mypage.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("MLikeDAO")
public class LikeDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//리스트
	public List<EgovMap> likeList(Map<String, Object> map) throws Exception {
		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("like.like_list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//리스트 개수
	public int count(Map<String, Object> map) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("like.like_count", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	//관심 해제
	public void likeDelete(Map<String, Object> map) throws Exception {
		try {
			sqlSession.delete("like.like_delete", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
