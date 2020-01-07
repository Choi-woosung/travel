package com.travel.www.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.ScheduleVO;

public class ScheduleDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<ScheduleVO> scheduleList(String sarea) {
//		System.out.println("### dao sarea : " + sarea);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sarea", sarea);
		return sqlSession.selectList("sSQL.scheduleList", map);
	}
	
	public ScheduleVO schedule() {
		return sqlSession.selectOne("sSQL.schedule");
	}
	
}
