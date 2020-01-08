package com.travel.www.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.travel.www.dao.ScheduleDAO;
import com.travel.www.vo.ScheduleVO;

@Controller
@RequestMapping("/schedule")
public class Schedule {
   
   @Autowired
   ScheduleDAO sDAO;
   
   @RequestMapping("/scheduleList.kit")
   public ModelAndView scheduleListForm(ModelAndView mv, ScheduleVO sVO, HttpServletRequest req, RedirectView rv) {
      String people = req.getParameter("people");
      String address = req.getParameter("address");
      String sarea = req.getParameter("sarea");
      List<ScheduleVO> list = sDAO.scheduleList(sarea);
      
      for(int i = 0; i < list.size(); i++) {
		   String date = list.get(i).getsWdate();
		   System.out.println(date);
		   date = date.substring(0, date.indexOf(' '));
		   
		   list.get(i).setsWdate(date);
		   
		   System.out.println(list.get(i).getsWdate());
	   }
       
      mv.addObject("ADDRESS", address);
      mv.addObject("PEOPLE", people);
      mv.addObject("LIST", list);
      mv.addObject("SVO", sVO);
      
      mv.setViewName("/schedule/scheduleList");
//      rv.setUrl("/schedule/scheduleList.kit");
//      mv.setView(rv);
      
      return mv;
   }
   
   @RequestMapping("/recentlist.kit")
   @ResponseBody
   public List<ScheduleVO> recentlist(HttpServletRequest req) {
//	   System.out.println("recent 입성");
	   String tmp = req.getParameter("sarea");
	   String sarea = tmp.substring(tmp.indexOf('=') + 1);
//	   System.out.println(sarea);
	   List<ScheduleVO> list = sDAO.recentList(sarea);
	   
	   for(int i = 0; i < list.size(); i++) {
		   String date = list.get(i).getsWdate();
		   System.out.println(date);
		   date = date.substring(0, date.indexOf(' '));
		   
		   list.get(i).setsWdate(date);
		   
		   System.out.println(list.get(i).getsWdate());
	   }
	   
	   return list;
   }
   
   @RequestMapping("/scheduleUp.kit")
   public ModelAndView scheduleUpForm(ModelAndView mv, ScheduleVO vo) {
      if (vo.getsSdate() != null && vo.getsEdate() != null) {
         long d1 = new Date(vo.getsSdate()).getTime();
         long d2 = new Date(vo.getsEdate()).getTime(); 
      
         int sDay = ((int) Math.abs((d1 - d2) / ( 24 * 60 * 60 * 1000)));
         
         vo.setsDay(sDay);
         
         mv.addObject("LIST", vo);
      }
      mv.setViewName("/schedule/scheduleUp3");

      return mv;
   }
   
   @RequestMapping("/scheduleMaker.kit")
   public ModelAndView shceduleMaker(ModelAndView mv) {
      mv.setViewName("/schedule/scheduleMaker");
      return mv;
   }
   @RequestMapping("/scheduleDetail.kit")
   public ModelAndView shceduleDetail(ModelAndView mv) {
      mv.setViewName("/schedule/scheduledetail");
      return mv;
   }

}