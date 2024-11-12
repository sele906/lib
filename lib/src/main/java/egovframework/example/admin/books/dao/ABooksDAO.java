package egovframework.example.admin.books.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.Pagination;
import egovframework.example.admin.books.model.ABookVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("ABooksDAO")
public class ABooksDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/** ID Generation */
	@Resource(name = "bookIds")
	private EgovIdGnrService bookIds;

	//코드
	public List<EgovMap> dataCtg() {
		return sqlSession.selectList("Abooks.data_ctg");
	}

	public String codeChange(String ctgNm) throws Exception {

		String result = sqlSession.selectOne("Abooks.code_change", ctgNm);
		return result;
	}

	//삽입
	public int booksInsert(ABookVO vo) throws Exception {

		/** ID Generation */
		int id = bookIds.getNextIntegerId();
		vo.setBookId(id);

		sqlSession.insert("Abooks.books_insert", vo);

		return id;
	}

	public void insertFile(Map<String, Object> map) {
		sqlSession.insert("Abooks.book_file_insert", map);
	}

	//리스트
	public List<ABookVO> booklist(Pagination pinfo) throws Exception {
		List<ABookVO> list = sqlSession.selectList("Abooks.books_list", pinfo);
		return list;
	}

	//리스트개수
	public int bookCount(Pagination pinfo) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("Abooks.books_count", pinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	//수정
	public void updateBook(ABookVO vo) {
		sqlSession.update("Abooks.books_update", vo);
	}

	public String selectFile(int id) {
		String path = null;
		path = sqlSession.selectOne("Abooks.book_file_select", id);
		return path;
	}

	public void deleteFile(int id) {
		sqlSession.delete("Abooks.book_file_delete", id);
	}

	//삭제
	public void deleteBook(int id) {
		sqlSession.delete("Abooks.book_delete", id);
	}

}
