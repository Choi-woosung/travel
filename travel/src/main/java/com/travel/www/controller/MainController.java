package com.travel.www.controller;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.travel.www.dao.ScheduleDAO;
import com.travel.www.dao.ScheduleDetailDAO;
import com.travel.www.util.PageUtil;
import com.travel.www.vo.ScheduleVO;
import com.travel.www.vo.TestVO;

@Controller
public class MainController {
	@Autowired
	ScheduleDAO sDAO;
	@Autowired
	ScheduleDetailDAO sdDAO;
	 
	@RequestMapping("/main.kit")
	public ModelAndView getMain(ModelAndView mv, ScheduleVO sVO) {
		double like = 0;
		double likeCount = 0;
     	double likeAvg = 0;
		
		List<ScheduleVO> list = sDAO.mainList();
		PageUtil PageUtil = new PageUtil();
		
		PageUtil.setPage(0, 99, 1, 1);
		
		for(int i = 0; i < list.size(); i++) {
			int sno = list.get(i).getsNo();
			
			sVO.setsNo(sno);
			
			like = sdDAO.LikeBoardLikeTotal(sVO);
			likeCount = sdDAO.LikeBoardLikeCheckTotal(sVO);
			likeAvg = like / likeCount;
    	  
			DecimalFormat form = new DecimalFormat("#.#");
			String likeAvg1 = form.format(likeAvg);
			likeAvg = Double.parseDouble(likeAvg1);
    	  
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
		mv.setViewName("test/test");
		return mv;
	}
	
	@RequestMapping("/testResponse.kit")
	public ModelAndView getTestResponse(ModelAndView mv, TestVO vo) {
		System.out.println(vo.getDat());
		mv.setViewName("/testview.kit");	
		return mv;
		
	}
}
