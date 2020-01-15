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
import com.travel.www.vo.ScheduleImgVO;
import com.travel.www.vo.ScheduleOrderVO;

@Controller
@RequestMapping("/scheduleMaker")
public class ScheduleMakerController {
	
	@Autowired
	ScheduleMakerDAO smDAO;
	
	@RequestMapping("/test.kit")
	public void ScheduleListing(ModelAndView mv, ScheduleOrderVO sovo, ScheduleImgVO siVO, HttpSession session) throws IOException {		
		File file = null;
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		String name = "";
		String rename = "";
		int sno = smDAO.makeSchedule(sovo);
		
		if (sovo.getScheduleImg() != null) {
			Iterator<MultipartFile> itor = sovo.getScheduleImg().iterator();
			
			while (itor.hasNext()) {
				String path = session.getServletContext().getRealPath("/");
				String path1 = "resources\\img\\scheduleImg\\";
				path = path + path1;
				
				System.out.println("path : " + path);
				
				MultipartFile part = itor.next();
				path += part.getOriginalFilename();
				
				name = part.getOriginalFilename();
				
				file = new File(path);
				
				while (file.exists()) {
					int n = 0;
					String first = path.substring(0, path.lastIndexOf("\\"));
					String last = path.substring(path.lastIndexOf('.'), path.length());
					name = part.getOriginalFilename().substring(0, part.getOriginalFilename().lastIndexOf('.')); // 원래이름
					rename = name + '_' + n + last; // 저장이름
					
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
				
				siVO.setSno(sno);
				siVO.setOriname(name);
				siVO.setSavename(rename);
				
				smDAO.insertScheduleImg(siVO);
			}
		}
		
		smDAO.ScheduleListing(sovo, sno);
	}
	
}
