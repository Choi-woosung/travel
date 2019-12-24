package com.travel.www.dao;

import java.util.*;
import java.io.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import com.travel.www.vo.*;



public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인 전담 처리함수
	public int loginProc(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.Login", mVO);
	}


	
	
}
