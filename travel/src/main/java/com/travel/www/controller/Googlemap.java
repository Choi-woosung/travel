package com.travel.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Googlemap {

	@RequestMapping("/test/googlemap.kit")
	public ModelAndView googlemap(ModelAndView mv) {
		mv.setViewName("test/googlemap");
		
		return mv;
	}
	
	@RequestMapping("/test/nearbysearch")
	public ModelAndView nearbysearch(ModelAndView mv) {
		mv.setViewName("test/nearbysearch");
		
		return mv;
	}
	
}
