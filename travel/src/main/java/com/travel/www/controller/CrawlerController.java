package com.travel.www.controller;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CrawlerController {
	
	@RequestMapping("/hotelSearch.kit")
	public ModelAndView getSearch(ModelAndView mv) {
		System.out.println("들어오고있니?");
		Elements elem = getHotel();
		mv.addObject("data", elem);
		mv.setViewName("schedule/hotelSearch");
		return mv;
	}
	
	public Elements getHotel() {
		Elements elem = null;
		String url = "https://kr.hotels.com/search.do?resolved-location=CITY%3A728660%3AUNKNOWN%3AUNKNOWN&destination-id=728660&q-destination=%EC%98%A4%EC%82%AC%EC%B9%B4,%20%EC%9D%BC%EB%B3%B8&q-check-in=2020-01-06&q-check-out=2020-01-07&q-rooms=1&q-room-0-adults=2&q-room-0-children=0";
		try {
			Document doc = Jsoup.connect(url).get();
			elem = doc.select(".h-listing");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return elem;
		
	}

}
