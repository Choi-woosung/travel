package com.trip.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	 
	@RequestMapping("/main.kit")
	public void getMain() {
		/* System.out.println("### 여기는 메인 ###"); */
	}
}
