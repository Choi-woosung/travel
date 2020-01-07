package com.travel.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.travel.www.vo.QnABoardVO;

@Controller
@RequestMapping("/board/")
public class QnABoard {

	@RequestMapping("qnaboard.kit")
	public ModelAndView qnaBoard(ModelAndView mv) {
		mv.setViewName("board/qnaboard");
		return mv;
	}
	
	@RequestMapping("qnawriting.kit")
	public int qnawriting(QnABoardVO vo) {
		
		System.out.println(vo.getSq_no());
		System.out.println(vo.getSq_qst());
		System.out.println(vo.getSq_sno());
		System.out.println(vo.getSq_writer());

		return 1;
	}
	
}
