package com.travel.www.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class Test {
	private WebCrawler crawler = new WebCrawler();
	
	@RequestMapping("/crawling.kit")
	@ResponseBody
	public String Crawler(String query) throws InterruptedException {
		
		String url = "https://www.google.com/";
		
		crawler.setUrl(url);
		
		crawler.crawlerStart(query);
		
		return query;
	}
	
}
