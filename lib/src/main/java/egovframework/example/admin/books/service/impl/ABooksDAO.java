package egovframework.example.admin.books.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.Pagination;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("ABooksDAO")
public class ABooksDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/** ID Generation */
	@Resource(name = "bookIds")
	private EgovIdGnrService bookIds;

	public EgovMap codeChange(Map<String, Object> map) throws Exception {

		EgovMap result = sqlSession.selectOne("books.code_change", map);
		return result;
	}

	public int booksInsert(Map<String, Object> map) throws Exception {

		/** ID Generation */
		int id = bookIds.getNextIntegerId();
		map.put("bookId", id);

		sqlSession.insert("books.books_insert", map);

		return id;
	}

	public List<EgovMap> booklist(Pagination pinfo) throws Exception {
		List<EgovMap> list = sqlSession.selectList("books.books_list", pinfo);
		return list;
	}

	public int bookCount(Pagination pinfo) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("books.books_count", pinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public void insertFile(Map<String, Object> map) {
		sqlSession.insert("book_file_insert", map);
	}

}
