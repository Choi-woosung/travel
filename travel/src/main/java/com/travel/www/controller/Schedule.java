package com.travel.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.travel.www.vo.ScheduleVO;

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
		System.out.println("���� ���� ���ô� ? " + vo.getsCountry());
		System.out.println("��� ��¥ : " + vo.getsSdate());
		System.out.println("���� ��¥ : " + vo.getsEdate());
		System.out.println("��� ? : " + vo.getsPtotal());
		return mv;
	}
	
}
