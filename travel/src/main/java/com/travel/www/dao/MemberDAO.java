package com.travel.www.dao;

import java.util.*;
import java.io.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.www.vo.*;
import com.travel.www.vo.MemberVO;



public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인 전담 처리함수
	public int loginProc(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.Login", mVO);
	}

	// 중복확인
	public int idCheck(String id) {
		return sqlSession.selectOne("mSQL.idCount", id);
	}
	
	// 회원가입 추가
	public int insertMemb(MemberVO mVO) {
		System.out.println("************************* DAO");
		System.out.println(mVO);
		return sqlSession.insert("mSQL.addMember", mVO);		
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
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberVO mVO) throws Exception{
		return sqlSession.update("member.update_pw", mVO);
	}
	

	
}
