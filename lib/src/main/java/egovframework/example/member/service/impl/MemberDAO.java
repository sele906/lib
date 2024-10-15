package egovframework.example.member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("MemberDAO")
public class MemberDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public List<String> getUserid() {
		List<String> list = sqlSession.selectList("member.list");
		System.out.println(list);
		return list;
	}

}
