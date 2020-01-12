package com.travel.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.travel.www.vo.ScheduleOrderVO;

@Controller
@RequestMapping("/schedule")
public class ScheduleMakerController {
	
	@RequestMapping("/test.kit")
	public void ScheduleListing(ModelAndView mv, ScheduleOrderVO sovo) {
		String name = sovo.getPlaceName();
		String address = sovo.getPlaceAddress();
		String licnt = sovo.getLiCnt();
		String pid = sovo.getPid();
		String body = sovo.getBody();
		String price = sovo.getPrice();
		String type = sovo.getType();
		System.out.println("name : " + name + " address : " + address + " licnt : " + licnt + " pid : " + pid + " body : " + body + " price : " + price + " type : " + type);
	}
}
