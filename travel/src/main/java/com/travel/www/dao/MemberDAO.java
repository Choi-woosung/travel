package com.travel.www.dao;

import java.util.*;
import java.io.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

<<<<<<< HEAD
import com.travel.www.vo.JoinVO;
=======
import com.travel.www.vo.MemberVO;
>>>>>>> branch 'working' of https://github.com/Choi-woosung/travel.git



public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
<<<<<<< HEAD
	// 로그인 전담 처리함수
	public int loginProc(JoinVO oc) {
		int cnt = sqlSession.selectOne("mSQL.Login", oc);
		return cnt;
=======
	public int login(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.login", mVO);
>>>>>>> branch 'working' of https://github.com/Choi-woosung/travel.git
	}
	
	
}
