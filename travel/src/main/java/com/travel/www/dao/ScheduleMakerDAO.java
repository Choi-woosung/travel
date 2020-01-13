package com.travel.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.ScheduleOrderVO;

public class ScheduleMakerDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int ScheduleListing(ScheduleOrderVO soVO) {
		return sqlSession.insert("soSQL.insertSchedule", soVO);
	}

}
