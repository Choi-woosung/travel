package com.travel.www.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.MemberVO;



public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int login(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.login", mVO);
	}
	
	
}
