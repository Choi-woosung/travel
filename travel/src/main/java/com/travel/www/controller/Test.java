package com.travel.www.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class Test {
	WebCrawler crawler = new WebCrawler();
	
	@RequestMapping("/crawling.kit")
	@ResponseBody
	public String Crawler(String query) {
		
		String url = "https://www.hotelscombined.co.kr/";
		
		crawler.setUrl(url);
		
		crawler.crawlerStart(query);
//		
		return query;
	}
	
}
