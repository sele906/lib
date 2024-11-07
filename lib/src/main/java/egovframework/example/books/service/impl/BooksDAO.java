package egovframework.example.books.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("BooksDAO")
public class BooksDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/** ID Generation */
	@Resource(name = "bookIds")
	private EgovIdGnrService bookIds;

	//코드
	public List<EgovMap> dataCtg() {
		return sqlSession.selectList("books.data_ctg");
	}

	//리스트
	public List<EgovMap> booklist(Map<String, Object> map) throws Exception {
		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("books.books_list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//리스트개수
	public int bookCount(Map<String, Object> map) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("books.books_count", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	//인기리스트
	public List<EgovMap> bestlist() throws Exception {
		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("books.best_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<EgovMap> newlist() {
		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("books.new_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<EgovMap> sampleBestlist() {
		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("books.sample_best");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<EgovMap> sampleNewlist() {
		List<EgovMap> list = null;
		try {
			list = sqlSession.selectList("books.sample_new");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
