package com.travel.www.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.ScheduleOrderVO;
import com.travel.www.vo.ScheduleVO;

public class ScheduleDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//메인리스트 가져오기
	public List<ScheduleVO> mainList() {
		return sqlSession.selectList("sSQL.mainList");
	}
	
	//리스트 가져오기
	public List<ScheduleVO> scheduleList(String sarea) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sarea", sarea);
		
		return sqlSession.selectList("sSQL.scheduleList", map);
	}
	
	//월별 리스트 가져오기
	public List<ScheduleVO> scheduleList(String sarea, String month) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sarea", sarea);
		map.put("month", month);
		
		return sqlSession.selectList("sSQL.scheduleList", map);
	}
	
	//리스트 최신순으로 가져오기
	public List<ScheduleVO> recentList(String sarea, String month) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sarea", sarea);
		map.put("month", month);
		
		return sqlSession.selectList("sSQL.recentList", map);
	}
	
	//리스트 평점순으로 가져오기
	public List<ScheduleVO> ratingList(String sarea, String month) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sarea", sarea);
		map.put("month", month);
		
		return sqlSession.selectList("sSQL.ratingList", map);
	}
	
}
