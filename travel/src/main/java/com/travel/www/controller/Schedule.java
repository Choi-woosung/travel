package com.travel.www.controller;

import java.util.Calendar;
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
	public ModelAndView scheduleListForm(ModelAndView mv, HttpSession session, ScheduleVO vo) {
		
		mv.setViewName("/schedule/scheduleList");
		
		String sid = (String) session.getAttribute("SID");
		List<ScheduleVO> list = sDAO.scheduleList(sid);
		
		mv.addObject("LIST", list);
		
		return mv;
	}
	
	@RequestMapping("/scheduleUp.kit")
	public ModelAndView scheduleUpForm(ModelAndView mv, ScheduleVO vo) {
		if(vo.getsSdate() == null || vo.getsEdate() == null || vo.getsCountry() == null) {
			mv.setViewName("/main.kit");
		} else {
			Calendar cale1 = Calendar.getInstance();
			Calendar cale2 = Calendar.getInstance();
			int sDate = Integer.parseInt(vo.getsStrdate());
			int eDate = Integer.parseInt(vo.getsEtrdate());
			
			cale1.set(Calendar.DATE, sDate);
			cale2.set(Calendar.DATE, eDate);
			
			System.out.println(cale1);
			System.out.println(cale2);
			
			mv.addObject("LIST", vo);
			mv.setViewName("/schedule/scheduleUp");
		}
		
		return mv;
	}
	

}
