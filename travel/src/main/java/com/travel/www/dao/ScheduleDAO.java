package com.travel.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.ScheduleVO;

public class ScheduleDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<ScheduleVO> scheduleList(String sid) {
		return sqlSession.selectList("sSQL.scheduleList", sid);
	}
	
//	public List<ScheduleVO> scheduleUp() {
//		return sqlSession.selectList("sSQL.scheduleUp");
//	}

}
