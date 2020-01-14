package com.travel.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.ScheduleOrderVO;

public class ScheduleMakerDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public void ScheduleListing(ScheduleOrderVO soVO) {
		for(int i = 0; i < soVO.getSchedules().size(); i++) {
			sqlSession.insert("soSQL.insertScheduleMaker", soVO.getSchedules().get(i));
			System.out.println(i + "번째 등록완료");
		}
	}
	
	//리스트 삽입
	public void makeSchedule(ScheduleOrderVO soVO) {
		sqlSession.insert("soSQL.insertSchedule", soVO);
	}
}
