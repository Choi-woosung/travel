package com.travel.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.travel.www.vo.ScheduleVO;

public class ScheduleDetailDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ScheduleVO scheduleDetail(ScheduleVO sVO) {
		return sqlSession.selectOne("sdSQL.scheduleDetail", sVO);
	}
	public int scheduleStar(ScheduleVO sVO) {
		return sqlSession.update("sdSQL.scheduleStar", sVO);
	}
	public int scheduleLikeBoard(ScheduleVO sVO) {
		return sqlSession.update("sdSQL.LikeBoard", sVO);
	}
	public int LikeBoardLikeCheckTotal(ScheduleVO sVO) {
		return sqlSession.selectOne("sdSQL.LikeCheckTotal", sVO);
	} 
	public int LikeBoardLikeCheck(ScheduleVO sVO) {
		return sqlSession.selectOne("sdSQL.LikeCheck", sVO);
	}
	public double LikeBoardLikeTotal(ScheduleVO sVO) {
		return sqlSession.selectOne("sdSQL.LikeTotal", sVO);
	}
}
