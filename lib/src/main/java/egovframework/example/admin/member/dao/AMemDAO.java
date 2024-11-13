package egovframework.example.admin.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.Pagination;
import egovframework.example.admin.member.model.AMemVO;

@Repository("AMemDAO")
public class AMemDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//리스트
	public List<AMemVO> memlist(Pagination pinfo) throws Exception {
		List<AMemVO> list = sqlSession.selectList("Amember.mem_list", pinfo);
		return list;
	}

	//리스트개수
	public int memCount(Pagination pinfo) throws Exception {
		int count = 0;
		try {
			count = sqlSession.selectOne("Amember.mem_count", pinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public void updateMem(AMemVO vo) {
		sqlSession.update("Amember.mem_update", vo);
	}

	public void deleteMem(String userid) {
		sqlSession.delete("Amember.mem_delete", userid);
	}

}
