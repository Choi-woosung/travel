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
import com.travel.www.dao.ScheduleDetailDAO;
import com.travel.www.vo.ScheduleVO;

@Controller
@RequestMapping("/schedule")
public class Schedule {
   
   @Autowired
   ScheduleDAO sDAO;
   @Autowired
   ScheduleDetailDAO sdDAO;
   
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
	   String tmp = req.getParameter("sarea");
	   String sarea = tmp.substring(tmp.indexOf('=') + 1);
	   List<ScheduleVO> list = sDAO.recentList(sarea);
	   
	   for(int i = 0; i < list.size(); i++) {
		   String date = list.get(i).getsWdate();
		   date = date.substring(0, date.indexOf(' '));
		   
		   list.get(i).setsWdate(date);
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
   public ModelAndView shceduleDetail(ModelAndView mv, ScheduleVO sVO, RedirectView rv) {
	   if(sVO.getsNo() == 0 ) {
		   rv.setUrl("/main.kit"); 
		   mv.setView(rv);
		   return mv;
	   }
	   // 게시물 좋아요 총 평점
	   	double like = sdDAO.LikeBoardLikeTotal(sVO);
	   	System.out.println(like);
	   // 게시물 좋아요 총 사람 수
	   	double likeCount = sdDAO.LikeBoardLikeCheckTotal(sVO);
	   	System.out.println(likeCount);
	   // 평균값
	   	double likeAvg = like/likeCount;
	   System.out.println(sVO.getsNo());
	   sVO = sdDAO.scheduleDetail(sVO);
	   System.out.println(sVO.getsArea());
	   mv.addObject("DATA", sVO);
	   mv.addObject("likeAvg", likeAvg);
	   mv.setViewName("/schedule/scheduleDetail");
      return mv;
   }
   
   @RequestMapping("/scheduleStar.kit")
   @ResponseBody
   public int shceduleGood(ScheduleVO sVO) {
	   System.out.println("여기오긴하니 ?");
	   System.out.println(sVO.getsRate());
	   System.out.println(sVO.getmId());
	   System.out.println(sVO.getsNo());
	   // 한 아이디 좋아요 체크 처리
	   int idCheck = sdDAO.LikeBoardLikeCheck(sVO);
	  
	   System.out.println(idCheck + "아이디 체크 하니 ?");
	   if(idCheck > 0) {
		   return idCheck;
	   }
	   // 게시판 좋아요 점수 업데이트
	   	int cnt = sdDAO.scheduleStar(sVO);
	   	System.out.println(cnt);
	  // 좋아요 테이블 업데이트
	   	cnt += sdDAO.scheduleLikeBoard(sVO);
	   	System.out.println(cnt);
	   // 게시물 좋아요 총 평점
	   	double like = sdDAO.LikeBoardLikeTotal(sVO);
	   	System.out.println(like);
	   // 게시물 좋아요 총 사람 수
	   	double likeCount = sdDAO.LikeBoardLikeCheckTotal(sVO);
	   	System.out.println(likeCount);
	   // 평균값
	   	double likeAvg = like/likeCount;
	   	System.out.println(likeAvg);
	   if(cnt == 2) {
		   System.out.println("등록완료");
	   }
	   return cnt;
   }
}