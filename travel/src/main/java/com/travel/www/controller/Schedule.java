package com.travel.www.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
		
		mv.addObject("LIST", list);
		
		return mv;
	}
	
	@RequestMapping("/scheduleUp.kit")
	public ModelAndView scheduleUpForm(ModelAndView mv, ScheduleVO vo) {
		if(vo.getsSdate() == null || vo.getsEdate() == null || vo.getsCountry() == null) {
			mv.setViewName("/main.kit");
		} else {
			long d1 = vo.getsSdate().getTime();
			long d2 = vo.getsEdate().getTime();
		
			int sDay = ((int) Math.abs((d1 - d2) / ( 24 * 60 * 60 * 1000)));
			
			vo.setsDay(sDay);
			
			mv.addObject("LIST", vo);
			mv.setViewName("/schedule/scheduleUp2");
		}
		
		return mv;
	}
	

}
