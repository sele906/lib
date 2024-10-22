package egovframework.example.member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.example.member.service.MemberVO;

@Repository("MemberDAO")
public class MemberDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public List<String> getUserid() throws Exception {
		List<String> list = sqlSession.selectList("member.list");
		System.out.println(list);
		return list;
	}

	public void join(MemberVO vo) throws Exception {
		sqlSession.insert("member.mem_insert", vo);
	}

	public MemberVO login(MemberVO vo) {
		MemberVO rvo = sqlSession.selectOne("member.mem_login", vo);
		return rvo;
	}

}
