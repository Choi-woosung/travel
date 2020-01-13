package com.travel.www.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.travel.www.vo.ScheduleOrderVO;

@Controller
@RequestMapping("/scheduleMaker")
public class ScheduleMakerController {
	
	@RequestMapping("/test.kit")
	public void ScheduleListing(ModelAndView mv, ScheduleOrderVO sovo) {
		System.out.println("load");
		ArrayList<ScheduleOrderVO> list = sovo.getSchedules();
		System.out.println(list.size());
		for(ScheduleOrderVO li : list) {
			System.out.println(li.getPlaceAddress().size());
			for(String li2 : li.getPlaceAddress()) {
				System.out.println(li2);
			}
		}
	}
}
