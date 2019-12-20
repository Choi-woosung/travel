package com.trip.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.trip.www.vo.ScheduleVO;

@Controller
@RequestMapping("/schedule")
public class Schedule {
	
	@RequestMapping("/scheduleList.kit")
	public ModelAndView scheduleListForm(ModelAndView mv) {
		mv.setViewName("/schedule/scheduleList");
		
		return mv;
	}
	
	@RequestMapping("/scheduleUp.kit")
	public ModelAndView scheduleUpForm(ModelAndView mv) {
		mv.setViewName("/schedule/scheduleUp");
		
		return mv;
	}
	
	@RequestMapping("/scheduleLi.kit")
	public ModelAndView scheduleLi(ModelAndView mv, ScheduleVO vo) {
		System.out.println("가고 싶은 도시는 ? " + vo.getsCountry());
		System.out.println("출발 날짜 : " + vo.getsSdate());
		System.out.println("도착 날짜 : " + vo.getsEdate());
		System.out.println("몇명 ? : " + vo.getsPtotal());
		return mv;
	}
	
}
