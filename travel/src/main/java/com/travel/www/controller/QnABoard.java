package com.travel.www.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView qnaBoard(ModelAndView mv, RedirectView rv, QnABoardVO vo, HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		String url =  "/main.kit";
		int no = vo.getNo();
		vo.setM_id(sid);
		
		if (qDAO.getGrade(vo).getM_grade().equals("admin")) {
			if (no != 0) {
				mv.addObject("list", qDAO.a_writlist(vo));
			}
			
			mv.addObject("LIST", qDAO.qnaboardall(vo));
			mv.setViewName("board/qnaboard2");
			return mv;
		} else {
			if (sid == null) {
				rv.setUrl(url);
				mv.setView(rv);
				return mv;
			}
			
			if (no != 0) {
				mv.addObject("list", qDAO.qnaBoardList(vo));
			}
			
			List<QnABoardVO> list = qDAO.qnaboard(vo);

			mv.addObject("LIST", list);
			mv.setViewName("board/qnaboard");
			
			return mv; 
		}
	}
	
	@RequestMapping("qnaWriting.kit")
	@ResponseBody
	public void qnawriting(QnABoardVO vo, HttpSession session) throws IOException {
		String path = "";
		File file = null;
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		String fileName = "";
		String fileSave = "";
		vo.setM_id((String) session.getAttribute("SID"));
		
		qDAO.qnawriting(vo);
		
		if (vo.getFiles() != null) {
			Iterator<MultipartFile> itor = vo.getFiles().iterator();
			
			while (itor.hasNext()) {
				path = "D:\\project\\git\\travel\\travel\\src\\main\\webapp\\resources\\img\\board";
				MultipartFile part = itor.next();
				
				fileName += part.getOriginalFilename() + "/";
				
				path += "\\" + part.getOriginalFilename();
				file = new File(path);
				
				while (file.exists()) {
					int n = 0;
					String first = path.substring(0, path.length() - part.getOriginalFilename().length());
					String last = path.substring(path.lastIndexOf('.'), path.length());
					String name = part.getOriginalFilename().substring(0, part.getOriginalFilename().lastIndexOf('.'));
					path = first + name + '_' + n + last;
					file = new File(path);
					fileSave += name + '_' + n + last + "/";
					n++;
				}
				
				fos = new FileOutputStream(file);
				bos = new BufferedOutputStream(fos);
				
				bos.write(part.getBytes());
				bos.flush();
				
				fos.close();
				bos.close();
			}
			
			vo.setF_file_name(fileName);
			vo.setF_save_name(fileSave);
			
			qDAO.qnafile(vo);
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
	
	@RequestMapping("a_writ.kit")
	public void a_writ(QnABoardVO vo) {
		if (vo.getQ_answer().equals("")) {
			vo.setQ_status("N");
		} else {
			vo.setQ_status("Y");
		}
		qDAO.a_writ(vo);
	}
}
