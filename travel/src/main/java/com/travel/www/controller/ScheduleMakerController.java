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

import com.travel.www.dao.ScheduleDAO;
import com.travel.www.dao.ScheduleMakerDAO;
import com.travel.www.vo.ScheduleOrderVO;

@Controller
@RequestMapping("/scheduleMaker")
public class ScheduleMakerController {
	
	@Autowired
	ScheduleMakerDAO smDAO;
	
	@RequestMapping("/test.kit")
	public void ScheduleListing(ModelAndView mv, ScheduleOrderVO sovo, HttpSession session) throws IOException {		
		File file = null;
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		if (sovo.getScheduleImg() != null) {
			Iterator<MultipartFile> itor = sovo.getScheduleImg().iterator();
			
			while (itor.hasNext()) {
				String path = session.getServletContext().getRealPath("/");
				String path1 = "resources\\img\\scheduleImg\\";
				path = path + path1;
				
//				String rePath = path.substring(0, path.indexOf("source"));
//				String path2 = "git\\travel\\travel\\src\\main\\webapp\\resources\\img\\scheduleImg\\";
//				rePath = rePath + path2;
				
				System.out.println("path : " + path);
//				System.out.println("rePath : " + rePath);
				
				MultipartFile part = itor.next();
				path += part.getOriginalFilename();
//				rePath += part.getOriginalFilename();
				
				file = new File(path);
//				file = new File(rePath);
				
				while (file.exists()) {
					int n = 0;
					String first = path.substring(0, path.lastIndexOf("\\"));
					String last = path.substring(path.lastIndexOf('.'), path.length());
					String name = part.getOriginalFilename().substring(0, part.getOriginalFilename().lastIndexOf('.'));
					String rename = name + '_' + n + last;
					
					path = first + rename;
					
					System.out.println(first);
					System.out.println(last);
					System.out.println(name);
					
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

		
		int sno = smDAO.makeSchedule(sovo);
		smDAO.ScheduleListing(sovo, sno);
	}
	
}
