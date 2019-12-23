package com.travel.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.travel.www.dao.MemberDAO;
import com.travel.www.vo.JoinVO;
import com.travel.www.vo.MemberVO;

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
	public ModelAndView loginProc(HttpSession session ,ModelAndView mv, RedirectView rv, MemberVO mVO) {
		int cnt = mDAO.login(mVO);
		
		if(cnt == 1) {
			rv.setUrl("/main.kit");
			
			session.setAttribute("SID", mVO.getmId());
		} else {
			rv.setUrl("/member/login.kit");
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
	
	@RequestMapping("memberEdit.kit")
	public ModelAndView memEditForm(ModelAndView mv, MemberVO vo, HttpSession session, String SID) {
		SID = (String) session.getAttribute("SID");
		System.out.println(SID);
		vo = mDAO.member(SID);
		mv.addObject("DATA", vo);
		mv.setViewName("member/memberEdit");
		
		return mv;
	}
}
