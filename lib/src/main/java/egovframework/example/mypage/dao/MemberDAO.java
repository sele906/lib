package egovframework.example.mypage.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.member.model.MemberVO;

@Repository("MMemberDAO")
public class MemberDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public String chkPasswd(String userid) throws Exception {
		return (String) sqlSession.selectOne("member.chk_passwd", userid);
	}

	public MemberVO getMemInfo(String userid) throws Exception {
		return (MemberVO) sqlSession.selectOne("member.get_mem_info", userid);
	}

	public void updateMem(MemberVO vo) throws Exception {
		sqlSession.update("member.update_mem", vo);
	}

	public void deleteMem(String userid) throws Exception {
		sqlSession.delete("member.delete_mem", userid);
	}

}
