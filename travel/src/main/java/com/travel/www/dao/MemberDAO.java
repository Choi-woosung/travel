package com.travel.www.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import com.travel.www.vo.*;



public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	// 비밀번호 변경
	public int update_pw(MemberVO mVO) {
		return sqlSession.update("mSQL.update_pw", mVO);
	}	
	

	// 로그인 전담 처리함수
	public int loginProc(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.Login", mVO);
	}
	
	// 비밀번호찾기에서 중복확인
	public int findpw(String id) {
		return sqlSession.update("mSQL.Check", id);
	}

	// 회원가입에서 중복확인
	public int idCheck(String id) {
		return sqlSession.selectOne("mSQL.idCount", id);
	}
	
	// 회원가입 추가
	public int insertMemb(MemberVO mVO) {
//		System.out.println("************************* DAO");
//		System.out.println(mVO);
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
	
	// 회원체크
	public int membercheck(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.MemberCheck", mVO);
	}
	
	// myProfile
	public MemberVO getMyProfile(MemberVO mvo) {
		return sqlSession.selectOne("mSQL.getMyProfile", mvo);
	}

}
