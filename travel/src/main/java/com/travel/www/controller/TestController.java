package com.travel.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
	@RequestMapping("/crawler.kit")
	public ModelAndView crawler(ModelAndView mv) {
		
		mv.setViewName("test/crawler");
		
		return mv;
	}
	
}
