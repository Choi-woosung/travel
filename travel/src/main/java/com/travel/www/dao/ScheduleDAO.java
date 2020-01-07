package com.travel.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.ScheduleVO;

public class ScheduleDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<ScheduleVO> scheduleList(ScheduleVO sVO) {
		return sqlSession.selectList("sSQL.scheduleList", sVO);
	}
	
	public ScheduleVO schedule() {
		return sqlSession.selectOne("sSQL.schedule");
	}
	
}
