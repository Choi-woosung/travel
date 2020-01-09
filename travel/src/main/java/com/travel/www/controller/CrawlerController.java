package com.travel.www.controller;

import java.io.*;
import java.net.*;
import java.nio.charset.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;


@Controller
public class CrawlerController {
	
	@RequestMapping("/hotelSearch.kit")
	public ModelAndView getSearch(ModelAndView mv) {
		
		String str = getHotel();
		
		mv.addObject("data", str);
		mv.setViewName("schedule/hotelSearch");
		
		return mv;
		
	}
	
	public String getHotel() {
		String str = "https://www.google.com/maps";
//		Document doc = null;
//		
//		try {
//			doc = Jsoup.connect(url).get();	
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		URL url;
		BufferedReader br = null;
		StringBuffer line = new StringBuffer();
		
		try {
			url = new URL(str);
			br = new BufferedReader(new InputStreamReader(url.openStream(), StandardCharsets.UTF_8));

			while(br.readLine() != null) {
				line.append(br.readLine() + "\n\r");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
			} catch (IOException e2) {
				e2.printStackTrace();
			}
		}	
		
		return line.toString();
		
	}

}
