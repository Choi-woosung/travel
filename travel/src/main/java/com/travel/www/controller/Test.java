package com.travel.www.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Test {
	
	@RequestMapping("/test.kit")
	public ModelAndView test(ModelAndView mv) {
		
		mv.setViewName("test/main2");
		
		return mv;
	}
	
	@RequestMapping("/search.kit")
	public void search(String search) {
		int limit = 5;
		String languageCode = "KO";
		String countryCode = "KR";
		boolean NoSort = true;
		String v = "a1";
		
		URL url;
		BufferedReader br = null;
		
		try {
			url = new URL(
					"https://www.hotelscombined.co.kr/AutoUniversal.ashx?" + 
					"search="+ search + 
					"&limit=" + limit + 
					"&languageCode=" + languageCode + 
					"&countryCode=" + countryCode + 
					"&NoSort=" + NoSort + 
					"&v=" + v
			);
			
			br = new BufferedReader(new InputStreamReader(url.openStream(), StandardCharsets.UTF_8));
			
			System.out.println(br.readLine());
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
					br.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} 

	}
	
}
