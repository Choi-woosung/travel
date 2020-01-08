package com.travel.www.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.ScheduleVO;

public class ScheduleDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//리스트 가져오기
	public List<ScheduleVO> scheduleList(String sarea) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sarea", sarea);
		
		return sqlSession.selectList("sSQL.scheduleList", map);
	}
	
	//리스트 최신순으로 가져오기
	public List<ScheduleVO> recentList(String sarea) {
		return sqlSession.selectList("sSQL.recentList", sarea);
	}
	
	public ScheduleVO schedule() {
		return sqlSession.selectOne("sSQL.schedule");
	}
	
}
