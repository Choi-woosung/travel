package com.travel.www.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.travel.www.dao.ScheduleDAO;
import com.travel.www.dao.ScheduleDetailDAO;
import com.travel.www.util.PageUtil;
import com.travel.www.vo.ScheduleImgVO;
import com.travel.www.vo.ScheduleVO;
import com.travel.www.vo.TestVO;

@Controller
public class MainController {
	@Autowired
	ScheduleDAO sDAO;
	@Autowired
	ScheduleDetailDAO sdDAO;
	 
	@RequestMapping("/main.kit")
	public ModelAndView getMain(ModelAndView mv, ScheduleVO sVO, HttpSession session) {
		double like = 0;
		double likeCount = 0;
     	double likeAvg = 0;
		
		List<ScheduleVO> list = sDAO.mainList();
		ArrayList<ScheduleImgVO> photoList = sDAO.mainPhotos(list);
		PageUtil PageUtil = new PageUtil();
		
		String path = "/img/scheduleImg/";
		PageUtil.setPage(0, 99, 1, 1);
		for(int i = 0; i < list.size(); i++) {
			int sno = list.get(i).getsNo();
			if(photoList.get(i).getOriname() != null) {
				list.get(i).setImgname(path + photoList.get(i).getOriname());
				if(photoList.get(i).getSavename() != null) {
					list.get(i).setImgname(path + photoList.get(i).getSavename());
				}
			} else {
				list.get(i).setImgname(path + "default.jpg");
			}
			sVO.setsNo(sno);
			
			like = sdDAO.LikeBoardLikeTotal(sVO); //토탈
			likeCount = sdDAO.LikeBoardLikeCheckTotal(sVO); //해당 게시판 누른 사람수
			likeAvg = like / likeCount; //평균점
			
			if(like == 0) {
				likeAvg = 0;
			}
			
			list.get(i).setLikeAvg(likeAvg);
		}
		
		mv.addObject("TCount", PageUtil);
		mv.addObject("LIST", list);
		
		return mv;
	}

	@RequestMapping("/footer.kit")
	public ModelAndView getFooter(ModelAndView mv) {
		mv.setViewName("temp/footer");
		return mv;		
	}
	
	@RequestMapping("/navigationBar.kit")
	public ModelAndView getNav(ModelAndView mv) {
		mv.setViewName("temp/navigationBar");
		return mv;
	}

	@RequestMapping("/testview.kit")
	public ModelAndView getTest(ModelAndView mv) {
		mv.setViewName("schedule/scheduleList2");
		return mv;
	}
	
}
