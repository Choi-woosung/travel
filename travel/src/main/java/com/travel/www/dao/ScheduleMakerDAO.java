package com.travel.www.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.ScheduleImgVO;
import com.travel.www.vo.ScheduleOrderVO;

public class ScheduleMakerDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public void ScheduleListing(ScheduleOrderVO soVO, int sno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("SNO", sno);
		map.put("SOVO", soVO);
		for(int i = 0; i < soVO.getSchedules().size(); i++) {
			map.replace("SOVO", soVO.getSchedules().get(i));
			sqlSession.insert("soSQL.insertScheduleMaker", map);
			System.out.println(i + "번째 등록완료");
		}
	}
	
	//리스트 삽입
	public int makeSchedule(ScheduleOrderVO soVO) {
		sqlSession.insert("soSQL.insertSchedule", soVO);
		return sqlSession.selectOne("soSQL.selectSno");
	}
	
	//스케쥴 이미지 삽입
	public void insertScheduleImg(ScheduleImgVO siVO) {
		sqlSession.insert("soSQL.insertScheduleImg", siVO);
	}
	
	public List<ScheduleOrderVO> callScheduleMaker(int sno){
		return sqlSession.selectList("soSQL.selectScheduleMaker", sno);
	}
}
