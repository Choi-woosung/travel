package com.travel.www.dao;

import java.util.*;
import java.io.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.MemberVO;



public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인 전담 처리함수
	public int login(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.login", mVO);
	}
	// 회원정보보기 함수
	public MemberVO member(MemberVO vo) {
		return sqlSession.selectOne("mSQL.Member", vo);
	}
	// 회원정보 수정처리함수
	public int memberEdit(MemberVO mVO) {
		return sqlSession.update("mSQL.MemberEdit", mVO);
	}
	public int membercheck(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.MemberCheck", mVO);
	}
	
	
}
