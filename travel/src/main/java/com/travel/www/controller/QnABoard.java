package com.travel.www.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.travel.www.dao.QnABoardDAO;
import com.travel.www.util.FileUtil;
import com.travel.www.vo.QnABoardVO;
import com.travel.www.util.*;

@Controller
@RequestMapping("/board/")
public class QnABoard {
	@Autowired
	QnABoardDAO qDAO;
	
	@RequestMapping("qnaBoard.kit")
	public ModelAndView qnaBoard(ModelAndView mv, HttpSession session, RedirectView rv) {
		String sid = (String) session.getAttribute("SID");
		String url =  "/main.kit";
		
		if (sid == null) {
			rv.setUrl(url);
			mv.setView(rv);
			return mv;
		}
		
		mv.setViewName("board/qnaboard");
		
		return mv; 
	}
	
	@RequestMapping("qnaWriting.kit")
	@ResponseBody
	public void qnawriting(QnABoardVO vo) throws IOException {
		String path = "D:\\project\\git\\travel\\travel\\src\\main\\webapp\\resources\\img\\board";
		File file = null;
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		System.out.println(vo.getQ_head());
		System.out.println(vo.getQ_body());
		
		if (vo.getFiles() != null) {
			Iterator<MultipartFile> itor = vo.getFiles().iterator();
			
			while (itor.hasNext()) {
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
	
	@RequestMapping("getprofile.kit")
	@ResponseBody
	public String getprofile(QnABoardVO vo, HttpSession session) {
		vo.setM_id((String) session.getAttribute("SID")); 

		return qDAO.getprofile(vo);
	}
	
	@RequestMapping(value = "getname.kit", produces = "application/text;charset=utf8")
	@ResponseBody
	public String getname(QnABoardVO vo, HttpSession session) {
		vo.setM_id((String) session.getAttribute("SID"));
		return qDAO.getname(vo);
		
	}
}
