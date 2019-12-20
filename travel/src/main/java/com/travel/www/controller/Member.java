package com.travel.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.travel.www.dao.MemberDAO;
import com.travel.www.vo.JoinVO;

@Controller
@RequestMapping("/member/")

public class Member {
	@Autowired
	MemberDAO mDAO;
	
	@RequestMapping("login.kit")
	public ModelAndView loginForm(ModelAndView mv) {
		
		mv.setViewName("member/login");
		
		return mv;
	}
	
	@RequestMapping("loginProc.kit")
	public ModelAndView loginProc(HttpSession session, ModelAndView mv, RedirectView rv, JoinVO vo) {
		int cnt = mDAO.loginProc(vo);
		if(cnt != 1) {
			// 실패한 경우
			rv.setUrl("/member/login.kit");
		} else {
			// 성공한 경우
			session.setAttribute("SID", vo.getjId());
			rv.setUrl("/member/main.kit");
		}
		
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("join.kit")
	public ModelAndView joinForm(ModelAndView mv) {
		mv.setViewName("member/join");
		
		return mv;
	}
	
	@RequestMapping("find.kit")
	public ModelAndView findForm(ModelAndView mv) {
		mv.setViewName("member/find");
		return mv;
	}
	
	@RequestMapping("main2.kit")
	public ModelAndView mainForm(ModelAndView mv) {
		mv.setViewName("member/main");
		
		return mv;
	}
	

}
