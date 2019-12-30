package com.travel.www.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.travel.www.dao.ScheduleDAO;
import com.travel.www.vo.ScheduleVO;

@Controller
@RequestMapping("/schedule")
public class Schedule {
	
	@Autowired
	ScheduleDAO sDAO;
	
	@RequestMapping("/scheduleList.kit")
	public ModelAndView scheduleListForm(ModelAndView mv, ScheduleVO vo) {
		mv.setViewName("/schedule/scheduleList");
		List<ScheduleVO> list = sDAO.scheduleList();
		mv.addObject("VO", vo);
		mv.addObject("LIST", list);
		
		return mv;
	}
	
	@RequestMapping("/scheduleUp.kit")
	public ModelAndView scheduleUpForm(ModelAndView mv, ScheduleVO vo) {
		Date sdate = new Date(vo.getSdate());
		Date edate = new Date(vo.getEdate());
		long d1 = sdate.getTime(); /// 1111-12-30 
		long d2 = edate.getTime();
	
		int sDay = ((int) Math.abs((d1 - d2) / ( 24 * 60 * 60 * 1000)));
		
		vo.setsDay(sDay);
		
		mv.addObject("LIST", vo);
		mv.setViewName("/schedule/scheduleUp3");
		
		return mv;
	}
	

}
