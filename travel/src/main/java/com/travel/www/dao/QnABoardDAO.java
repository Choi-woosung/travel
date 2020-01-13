package com.travel.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.QnABoardVO;

public class QnABoardDAO {
	@Autowired
	SqlSessionTemplate sqlSession; 
	
	public int qnawriting(QnABoardVO vo) {
		 
		return sqlSession.insert("QnABoardSQL.qnawriting", vo);
	}
	
	public String getprofile(QnABoardVO vo) {
		return sqlSession.selectOne("QnABoardSQL.getprofile", vo);
	}
	
	public String getname(QnABoardVO vo) {
		return sqlSession.selectOne("QnABoardSQL.getname", vo);
	}
	
}
