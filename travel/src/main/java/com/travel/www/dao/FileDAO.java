package com.travel.www.dao;


import org.mybatis.spring.*;

import org.springframework.beans.factory.annotation.*;

import com.travel.www.vo.*;

public class FileDAO {
	@Autowired
	SqlSessionTemplate sqlSession; 
	
	// 파일 정보 입력 전담 처리 함수
//	public int insertPhoto(FileVO fVO) {
//		return sqlSession.insert("mSQL.addPic", fVO);
//	}
}