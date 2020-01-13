package com.travel.www.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.travel.www.dao.ScheduleMakerDAO;
import com.travel.www.vo.ScheduleOrderVO;

@Controller
@RequestMapping("/scheduleMaker")
public class ScheduleMakerController {
	
	@Autowired
	ScheduleMakerDAO smDAO;
	
	@RequestMapping("/test.kit")
	public void ScheduleListing(ModelAndView mv, ScheduleOrderVO sovo, HttpSession session) throws IOException {
		String path = "";
		ArrayList<ScheduleOrderVO> list = sovo.getSchedules();
		System.out.println(list.size());
		int i = 0;
		for(ScheduleOrderVO li : list) {
			System.out.println(i + " 번째 데이터 값은 : ");
			System.out.println(li.getPlaceAddress());
			System.out.println(li.getBody());
			System.out.println(li.getDayCount());
			System.out.println(li.getPid());
			System.out.println(li.getLiCnt());
			System.out.println(li.getType());
			System.out.println(li.getPlaceName());
			System.out.println(li.getPlaceLat());
			System.out.println(li.getPlaceLng());
			i++;
		}
		System.out.println(sovo.getScheduleName());
		System.out.println(sovo.getScheduleBody());
		
		File file = null;
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		if (sovo.getScheduleImg() != null) {
			Iterator<MultipartFile> itor = sovo.getScheduleImg().iterator();
			
			while (itor.hasNext()) {
				path = session.getServletContext().getRealPath("/");
				
				String rePath = path.substring(0, path.indexOf("source"));
				String path2 = "git\\travel\\travel\\src\\main\\webapp\\resources\\img\\scheduleImg\\";
				rePath = rePath + path2;
				
				System.out.println("path : " + path);
//				System.out.println("path2 : " + path2);
				System.out.println("rePath : " + rePath);
				
				MultipartFile part = itor.next();
				rePath += part.getOriginalFilename();
				file = new File(rePath);
				
				while (file.exists()) {
					int n = 0;
					String first = rePath.substring(0, rePath.length() - part.getOriginalFilename().length());
					String last = rePath.substring(rePath.lastIndexOf('.'), rePath.length());
					String name = part.getOriginalFilename().substring(0, part.getOriginalFilename().lastIndexOf('.'));
					rePath = first + name + '_' + n + last;
					
					System.out.println(first);
					System.out.println(last);
					System.out.println(name);
					
					file = new File(rePath);
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
		
//		int result = smDAO.ScheduleListing(sovo);
//		System.out.println("insert 결과 : " + result);
	}
}
