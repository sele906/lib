package egovframework.example.member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.member.service.MemberVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("MemberDAO")
public class MemberDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public List<String> getUserid() throws Exception {
		List<String> list = sqlSession.selectList("member.list");
		System.out.println(list);
		return list;
	}

	public MemberVO login(MemberVO vo) {
		MemberVO rvo = sqlSession.selectOne("member.mem_login", vo);
		return rvo;
	}

	public void join(MemberVO vo) throws Exception {
		sqlSession.insert("member.mem_insert", vo);
	}

	public String checkUserid(MemberVO vo) {
		String result = "";
		int check = (int) sqlSession.selectOne("member.mem_countUserid", vo);
		if (check > 0) {
			result = "unusable";
		} else if (check == 0) {
			result = "usable";
		}
		return result;
	}

	//아이디 찾기
	public MemberVO findId(MemberVO vo) throws Exception {
		return (MemberVO) sqlSession.selectOne("member.mem_findId", vo);
	}

	//이메일 찾기
	public MemberVO findEmail(MemberVO vo) throws Exception {
		return (MemberVO) sqlSession.selectOne("member.mem_findEmail", vo);
	}

	//비밀번호 세팅
	public void setPwd(MemberVO vo) throws Exception {
		sqlSession.update("mem_setPwd", vo);
	}

	public EgovMap getInfo(String userid) throws Exception {
		return (EgovMap) sqlSession.selectOne("member.get_info", userid);
	}

}
