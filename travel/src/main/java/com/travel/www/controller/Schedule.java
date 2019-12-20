package com.travel.www.controller;

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
	public ModelAndView scheduleListForm(ModelAndView mv, HttpSession session) {
		mv.setViewName("/schedule/scheduleList");
		
		String sid = (String) session.getAttribute("SID");
		List<ScheduleVO> list = sDAO.scheduleList(sid);
		
		mv.addObject("LIST", list);
		
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
