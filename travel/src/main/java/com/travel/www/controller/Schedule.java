package com.travel.www.controller;

import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
	public ModelAndView scheduleListForm(ModelAndView mv, HttpSession session, ScheduleVO vo) {

		mv.setViewName("/schedule/scheduleList");
		
		String sid = (String) session.getAttribute("SID");
		List<ScheduleVO> list = sDAO.scheduleList(sid);
		
		mv.addObject("LIST", list);
		
		return mv;
	}
	
	@RequestMapping("/scheduleUp.kit")
	public ModelAndView scheduleUpForm(ModelAndView mv, HttpServletRequest req, ScheduleVO vo) {

		mv.setViewName("/schedule/scheduleUp");
		
		return mv;
	}
	

}
