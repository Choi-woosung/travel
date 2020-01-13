package com.travel.www.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.travel.www.dao.QnABoardDAO;
import com.travel.www.vo.QnABoardVO;

@Controller
@RequestMapping("/board/")
public class QnABoard {
	@Autowired
	QnABoardDAO qDAO;
	
	@RequestMapping("qnaBoard.kit")
	public ModelAndView qnaBoard(ModelAndView mv, HttpSession session, RedirectView rv, QnABoardVO vo) {
		String sid = (String) session.getAttribute("SID");
		String url =  "/main.kit";
		
		if (sid == null) {
			rv.setUrl(url);
			mv.setView(rv);
			return mv;
		}
		
		vo.setM_id(sid);
		
		List<QnABoardVO> list = qDAO.qnaboard(vo);

		mv.addObject("LIST", list);
		mv.setViewName("board/qnaboard");
		
		return mv; 
	}
	
	@RequestMapping("qnaWriting.kit")
	@ResponseBody
	public void qnawriting(QnABoardVO vo, HttpSession session) throws IOException {
		String path = "";
		File file = null;
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		vo.setM_id((String) session.getAttribute("SID"));
		
		int writing = qDAO.qnawriting(vo);
		
//		System.out.println(vo.getQ_head());
//		System.out.println(vo.getQ_body());
		
		if (vo.getFiles() != null) {
			Iterator<MultipartFile> itor = vo.getFiles().iterator();
			
			while (itor.hasNext()) {
				path = "D:\\project\\git\\travel\\travel\\src\\main\\webapp\\resources\\img\\board";
				MultipartFile part = itor.next();
				path += "\\" + part.getOriginalFilename();
				file = new File(path);
				
				System.out.println(part.getOriginalFilename());
				
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
