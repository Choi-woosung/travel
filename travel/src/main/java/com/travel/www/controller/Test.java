package com.travel.www.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Test {
	private WebCrawler crawler = new WebCrawler();
	
	@RequestMapping("/crawling.kit")
	@ResponseBody
	public ModelAndView Crawler(String query, ModelAndView mv) throws InterruptedException {
		
		String url = "https://www.google.com/";
		
		crawler.setUrl(url);
		
		String crawling = crawler.crawlerStart(query);
		
		crawler.crawlerStop();
		
		mv.addObject("CRAWLING", crawling);
		
		mv.setViewName("test/crawling");
		
		return mv;
	}
	
}
