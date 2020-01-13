package com.travel.www.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.travel.www.vo.ScheduleOrderVO;

@Controller
@RequestMapping("/scheduleMaker")
public class ScheduleMakerController {
	
	@RequestMapping("/test.kit")
	public void ScheduleListing(ModelAndView mv, ScheduleOrderVO sovo) throws IOException {
		String path = "";
		ArrayList<ScheduleOrderVO> list = sovo.getSchedules();
		System.out.println(list.size());
		for(ScheduleOrderVO li : list) {
			System.out.println(li.getPlaceAddress().size());
			for(String li2 : li.getPlaceAddress()) {
				System.out.println(li2);
			}
		}
		System.out.println(sovo.getScheduleName());
		System.out.println(sovo.getScheduleBody());
		
		File file = null;
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		if (sovo.getScheduleImg() != null) {
			Iterator<MultipartFile> itor = sovo.getScheduleImg().iterator();
			
			while (itor.hasNext()) {
				path = "C:\\Users\\user\\git\\travel\\travel\\src\\main\\webapp\\resources\\img\\scheduleImg";
				MultipartFile part = itor.next();
				path += "\\" + part.getOriginalFilename();
				file = new File(path);
				
				while (file.exists()) {
					int n = 0;
					String first = path.substring(0, path.length() - part.getOriginalFilename().length());
					String last = path.substring(path.lastIndexOf('.'), path.length());
					String name = part.getOriginalFilename().substring(0, part.getOriginalFilename().lastIndexOf('.'));
					path = first + name + '_' + n + last;
					file = new File(path);
					n++;
				}
				
				fos = new FileOutputStream(file);
				bos = new BufferedOutputStream(fos);
				
				bos.write(part.getBytes());
				bos.flush();
				
				fos.close();
				bos.close();
			}
			
		}
	}
}
