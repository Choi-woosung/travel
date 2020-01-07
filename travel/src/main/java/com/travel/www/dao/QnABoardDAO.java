package com.travel.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.QnABoardVO;

public class QnABoardDAO {
	@Autowired
	SqlSessionTemplate sqlSession; 
	
	public int qnawriting(QnABoardVO vo) {
		sqlSession.insert("");
		 
		return 1;
	}
	
}
