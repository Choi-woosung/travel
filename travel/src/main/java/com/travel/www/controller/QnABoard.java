package com.travel.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public int qnawriting(QnABoardVO vo) {

		return 1;
	}
	
	@RequestMapping("getprofile.kit")
	@ResponseBody
	public String getprofile(QnABoardVO vo, HttpSession session) {
		vo.setSid((String) session.getAttribute("SID")); 

		return qDAO.getprofile(vo);
	}
	
	@RequestMapping(value = "getname.kit", produces = "application/text;charset=utf8")
	@ResponseBody
	public String getname(QnABoardVO vo, HttpSession session) {
		vo.setSid((String) session.getAttribute("SID"));
		return qDAO.getname(vo);
		
	}
}
