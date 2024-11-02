package egovframework.example.admin.books.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.Pagination;
import egovframework.example.admin.books.WishVO;
import egovframework.example.admin.books.service.BookVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("AWishDAO")
public class AWishDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/** ID Generation */
	@Resource(name = "bookIds")
	private EgovIdGnrService bookIds;

	// 리스트
	public List<EgovMap> wishlist(Pagination pinfo) throws Exception {
		List<EgovMap> list = sqlSession.selectList("Awish.wish_list", pinfo);
		return list;
	}

	// 리스트개수
	public int wishCount(Pagination pinfo) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("Awish.wish_count", pinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public void updateWishBook(WishVO vo) {
		sqlSession.update("Awish.wish_update", vo);
	}
	
	public String selectWishFile(int id) {
		String path = null;
		path = sqlSession.selectOne("Awish.wish_file_select", id);
		return path;
	}

	public void deleteWishFile(int id) {
		sqlSession.delete("Awish.wish_file_delete", id);
	}


	public void insertWishFile(Map<String, Object> map) {
		sqlSession.insert("Awish.wish_file_insert", map);
	}
	
	//삭제
	public void deleteWishBook(int id) {
		sqlSession.delete("Awish.wish_delete", id);
	}

}
