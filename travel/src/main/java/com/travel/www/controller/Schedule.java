package com.travel.www.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.travel.www.dao.ScheduleDetailDAO;
import com.travel.www.dao.ScheduleMakerDAO;
import com.travel.www.vo.ScheduleOrderVO;
import com.travel.www.vo.ScheduleVO;

@Controller
@RequestMapping("/schedule")
public class Schedule {
   
   @Autowired
   ScheduleDAO sDAO;
   
   @Autowired
   ScheduleDetailDAO sdDAO;
   
   @Autowired
   ScheduleMakerDAO smDAO;
   
   //리스트 가져오기
   @RequestMapping("/scheduleList.kit")
   public ModelAndView scheduleListForm(ModelAndView mv, ScheduleVO sVO, HttpServletRequest req) {
      String people = req.getParameter("people");
      String address = req.getParameter("address");
      String sarea = req.getParameter("sarea");
      
      double like = 0;
      double likeCount = 0;
      double likeAvg = 0;
      
      List<ScheduleVO> list = sDAO.scheduleList(sarea);
      
      for(int i = 0; i < list.size(); i++) {
    	  int sno = list.get(i).getsNo();
    	  String sdate = list.get(i).getsSdate();
    	  String wdate = list.get(i).getsWdate();
    	  
    	  sdate = sdate.substring(0, sdate.indexOf(' '));
    	  wdate = wdate.substring(0, wdate.indexOf(' '));
    	  
    	  sVO.setsNo(sno);
    	  list.get(i).setsSdate(sdate);
    	  list.get(i).setsWdate(wdate);
    	  
    	  like = sdDAO.LikeBoardLikeTotal(sVO);
    	  likeCount = sdDAO.LikeBoardLikeCheckTotal(sVO);
    	  likeAvg = like / likeCount;
    	  
    	  if(like == 0) {
				likeAvg = 0;
    	  }
    	  
//    	  DecimalFormat form = new DecimalFormat("#.#");
//    	  String likeAvg1 = form.format(likeAvg);
//    	  likeAvg = Double.parseDouble(likeAvg1);
    	  
    	  list.get(i).setLikeAvg(likeAvg);
      }
      
      
       
      mv.addObject("ADDRESS", address);
      mv.addObject("PEOPLE", people);
      mv.addObject("LIST", list);
      mv.addObject("SVO", sVO);
      
      mv.setViewName("/schedule/scheduleList");
      
      return mv;
   }
   
   //최신순 리스트 가져오기
   @RequestMapping("/recentlist.kit")
   @ResponseBody
   public List<ScheduleVO> recentlist(HttpServletRequest req, ScheduleVO sVO) {
	   String tmp = req.getParameter("sarea");
	   String sarea = tmp.substring(tmp.indexOf('=') + 1);
	   tmp = req.getParameter("month");
	   String month = tmp.substring(tmp.indexOf('=') + 1);
	   
	   double like = 0;
	   double likeCount = 0;
	   double likeAvg = 0;
	   
	   List<ScheduleVO> list = sDAO.recentList(sarea, month);
	   
	   for(int i = 0; i < list.size(); i++) {
		   int sno = list.get(i).getsNo();
		   String sdate = list.get(i).getsSdate();
		   String edate = list.get(i).getsEdate();
		   String wdate = list.get(i).getsWdate();
		   
		   sVO.setsNo(sno);
		  
		   sdate = sdate.substring(0, sdate.indexOf(' '));
		   edate = edate.substring(0, edate.indexOf(' '));
		   wdate = wdate.substring(0, wdate.indexOf(' '));
		   
		   list.get(i).setsNo(sno);
		   list.get(i).setsSdate(sdate);
		   list.get(i).setsEdate(edate);
		   list.get(i).setsWdate(wdate);
		   
		   like = sdDAO.LikeBoardLikeTotal(sVO);
		   likeCount = sdDAO.LikeBoardLikeCheckTotal(sVO);
		   likeAvg = like / likeCount;
		   
		   if(like == 0) {
				likeAvg = 0;
		   }
  
//		   DecimalFormat form = new DecimalFormat("#.#");
//		   String likeAvg1 = form.format(likeAvg);
//		   likeAvg = Double.parseDouble(likeAvg1);
  
		   list.get(i).setLikeAvg(likeAvg);
	   }
	   
	   return list;
   }
   
   //월별순 리스트 가져오기
   @RequestMapping("/sortmonth.kit")
   @ResponseBody
   public List<ScheduleVO> sortmonth(HttpServletRequest req, ScheduleVO sVO) {
	   String tmp = req.getParameter("sarea");
	   String sarea = tmp.substring(tmp.indexOf('=') + 1);
	   tmp = req.getParameter("month");
	   String month = tmp.substring(tmp.indexOf('=') + 1);
	   
	   double like = 0;
	   double likeCount = 0;
	   double likeAvg = 0;
	   
	   List<ScheduleVO> list = sDAO.scheduleList(sarea, month);
	   
	   for(int i = 0; i < list.size(); i++) {
		   int sno = list.get(i).getsNo();
		   String sdate = list.get(i).getsSdate();
		   String edate = list.get(i).getsEdate();
		   String wdate = list.get(i).getsWdate();
		   
		   sVO.setsNo(sno);
		  
		   sdate = sdate.substring(0, sdate.indexOf(' '));
		   edate = edate.substring(0, edate.indexOf(' '));
		   wdate = wdate.substring(0, wdate.indexOf(' '));
		   
		   list.get(i).setsNo(sno);
		   list.get(i).setsSdate(sdate);
		   list.get(i).setsEdate(edate);
		   list.get(i).setsWdate(wdate);
		   
		   like = sdDAO.LikeBoardLikeTotal(sVO);
		   likeCount = sdDAO.LikeBoardLikeCheckTotal(sVO);
		   likeAvg = like / likeCount;
		   
		   if(like == 0) {
				likeAvg = 0;
		   }
  
//		   DecimalFormat form = new DecimalFormat("#.#");
//		   String likeAvg1 = form.format(likeAvg);
//		   likeAvg = Double.parseDouble(likeAvg1);
  
		   list.get(i).setLikeAvg(likeAvg);
	   }
	   
	   return list;
   }
   
   //평점순 리스트 가져오기
   @RequestMapping("/sortrating.kit")
   @ResponseBody
   public List<ScheduleVO> sortrating(HttpServletRequest req, ScheduleVO sVO) {
	   String tmp = req.getParameter("sarea");
	   String sarea = tmp.substring(tmp.indexOf('=') + 1);
	   tmp = req.getParameter("month");
	   String month = tmp.substring(tmp.indexOf('=') + 1);
	   
	   double like = 0;
	   double likeCount = 0;
	   double likeAvg = 0;
	   
	   List<ScheduleVO> list = sDAO.ratingList(sarea, month);
	   
	   for(int i = 0; i < list.size(); i++) {
		   int sno = list.get(i).getsNo();
		   String sdate = list.get(i).getsSdate();
		   String edate = list.get(i).getsEdate();
		   String wdate = list.get(i).getsWdate();
		   
		   sVO.setsNo(sno);
		  
		   sdate = sdate.substring(0, sdate.indexOf(' '));
		   edate = edate.substring(0, edate.indexOf(' '));
		   wdate = wdate.substring(0, wdate.indexOf(' '));
		   
		   list.get(i).setsNo(sno);
		   list.get(i).setsSdate(sdate);
		   list.get(i).setsEdate(edate);
		   list.get(i).setsWdate(wdate);
		   
		   like = sdDAO.LikeBoardLikeTotal(sVO);
		   likeCount = sdDAO.LikeBoardLikeCheckTotal(sVO);
		   likeAvg = like / likeCount;
		   
		   if(like == 0) {
				likeAvg = 0;
		   }
  
//		   DecimalFormat form = new DecimalFormat("#.#");
//		   String likeAvg1 = form.format(likeAvg);
//		   likeAvg = Double.parseDouble(likeAvg1);
  
		   list.get(i).setLikeAvg(likeAvg);
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
   public ModelAndView shceduleDetail(ModelAndView mv, ScheduleOrderVO soVO, ScheduleVO sVO, RedirectView rv) {
	   if(sVO.getsNo() == 0 ) { 
		  rv.setUrl("/main.kit"); 
		  mv.setView(rv);
		  return mv; 
	    }
	   	double like = sdDAO.LikeBoardLikeTotal(sVO);
	   	double likeCount = sdDAO.LikeBoardLikeCheckTotal(sVO);
	   	double likeAvg = like/likeCount;
	   	
//	   	DecimalFormat form = new DecimalFormat("#.#");
//	   	String likeAvg1 = form.format(likeAvg);
//	   	likeAvg = Double.parseDouble(likeAvg1);
	   	
	   	if(like == 0) {
			likeAvg = 0;
		}
	   	
	   sVO = sdDAO.scheduleDetail(sVO);
	   List<ScheduleOrderVO> list = smDAO.callScheduleMaker(sVO.getsNo());
	   
	   mv.addObject("LIST", list);
	   mv.addObject("DATA", sVO);
	   mv.addObject("likeAvg", likeAvg);
	   mv.setViewName("/schedule/scheduleDetail");	   
      return mv;
   }
   
   @RequestMapping("/scheduleStar.kit")
   @ResponseBody
   public ScheduleVO shceduleGood(ScheduleVO sVO) {
	    
	    int idCheck = sdDAO.LikeBoardLikeCheck(sVO);
	   if(idCheck > 0) {
		   sVO.setIdCheck(idCheck);
		   return sVO;
	   }
	   	int cnt = sdDAO.scheduleStar(sVO);
	   	
	   	cnt += sdDAO.scheduleLikeBoard(sVO);
	   	
	   	double like = sdDAO.LikeBoardLikeTotal(sVO);
	   	
	   	double likeCount = sdDAO.LikeBoardLikeCheckTotal(sVO);
	   	
	   	double likeAvg = like/likeCount;
	   	
	   	if(like == 0) {
			likeAvg = 0;
		}

//	   	DecimalFormat form = new DecimalFormat("#.#");
//	   	String likeAvg1 = form.format(likeAvg);
//	   	likeAvg = Double.parseDouble(likeAvg1);
	   	
	   	sVO.setCnt(cnt);
	   	sVO.setLikeAvg(likeAvg);
	   
	   	return sVO;
   }
}