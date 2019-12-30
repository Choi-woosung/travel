package com.travel.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.travel.www.dao.ScheduleDAO;
import com.travel.www.util.PageUtil;
import com.travel.www.vo.ScheduleVO;

@Controller
public class MainController {
	@Autowired
	ScheduleDAO sDAO;
	 
	@RequestMapping("/main.kit")
	public ModelAndView getMain(ModelAndView mv) {
//		ScheduleVO vo = sDAO.schedule();
//		System.out.println(vo.getsArea());
//		mv.addObject("DATA", vo);
//		

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

}
