package com.travel.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	 
	@RequestMapping("/main.kit")
	public void getMain() {
		/* System.out.println("### 여기는 메인 ###"); */
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
