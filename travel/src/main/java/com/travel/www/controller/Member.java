package com.travel.www.controller;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.travel.www.dao.MemberDAO;
import com.travel.www.vo.MemberVO;

import sun.nio.cs.ext.MacHebrew;

@Controller
@RequestMapping("/member/")
public class Member {
	@Autowired
	MemberDAO mDAO;
	

	

	@RequestMapping("login.kit")
	public ModelAndView loginForm(ModelAndView mv) {
		
		mv.setViewName("/member/login");
		
		return mv;
	}
	
	@RequestMapping("loginProc.kit")
	public ModelAndView loginProc(HttpSession session, ModelAndView mv, RedirectView rv, MemberVO vo) {
		int cnt = mDAO.loginProc(vo);
		if(cnt != 1) {
			// 실패한 경우
			rv.setUrl("/member/login.kit");
		} else {
			// 성공한 경우
			session.setAttribute("SID", vo.getmId());
			rv.setUrl("/main.kit");
		
		}
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("logout.kit")
	public ModelAndView logout(ModelAndView mv, HttpSession session, RedirectView rv) {
		session.invalidate();
		rv.setUrl("/main.kit");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("logoutProc.kit")
	public ModelAndView logout(ModelAndView mv, RedirectView rv, HttpSession session) {
		System.out.println("##########");
		// 세션에 지정한 데이터를 지운다
		session.setAttribute("SID", "");
		
		// 메인페이지로 강제로 요청을 만든다
		rv.setUrl("/main.kit");
		mv.setView(rv);
		
		return mv;
		
	}
	
	@RequestMapping("joinProc.kit")
	public ModelAndView joinProc(ModelAndView mv, RedirectView rv, 
									HttpSession session, MemberVO mVO) {
		
		// 할일
		// 1. 회원정보 입력하고
		int cnt = mDAO.insertMemb(mVO);
		if(cnt != 1) {
			rv.setUrl("/member/main.kit");
		} else {
			rv.setUrl("/member/join.kit");
		}
		mv.setView(rv);
		return mv;
	}
	
	
	@RequestMapping(value="idCheck.kit")
	@ResponseBody
	public int idCheck(@RequestParam String id) {
		int cnt = 0;
		cnt = mDAO.idCheck(id);
		return cnt;
	}
	
/*	

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
*/	
	
	@RequestMapping("join.kit")
	public ModelAndView joinForm(ModelAndView mv) {
		mv.setViewName("member/join");
		
		return mv;
	}
	
	@RequestMapping("join2.kit")
	public ModelAndView joinForm2(ModelAndView mv) {
		mv.setViewName("member/join2");
		
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
	

	
	@RequestMapping("memberCheck.kit")
	public ModelAndView memEditForm(ModelAndView mv, MemberVO vo, HttpSession session, RedirectView rv) {
		String mId = (String) session.getAttribute("SID");
		System.out.println(mId);
		if(vo.getmPw() == null) {
			rv.setUrl("/main.kit");
			mv.setView(rv);
			return mv;
		}
		vo.setmId(mId);
		int cnt = mDAO.membercheck(vo);
		if(cnt == 1) {
			System.out.println("성공");
			vo = mDAO.member(vo);
			mv.addObject("DATA", vo);
			mv.setViewName("member/memberEdit");
		} else {
			mv.setViewName("member/memberCheck");
			
		}
		
		return mv;
	}
	@RequestMapping("memberForm.kit")
	public ModelAndView memEditForm(ModelAndView mv) {
		
		
		mv.setViewName("member/memberCheck");
		 
		return mv;
	}
	@RequestMapping("memberEditProc.kit")
	@ResponseBody
	public int memEditForm(ModelAndView mv, MemberVO vo) {
		int cnt = 0;
		String pwex = "^(?=.*[0-9])(?=.*[a-z])(?=\\S+$).{8,20}$";
		Matcher matcher = Pattern.compile(pwex).matcher(vo.getmPw());
		System.out.println(vo.getmPw());
		System.out.println(matcher.matches());
		if(vo.getmPw().equals(vo.getmPw2()) && matcher.matches()) {
			
				cnt = mDAO.memberEdit(vo);
				System.out.println("수정완료");
				vo = mDAO.member(vo);
				mv.addObject("DATA", vo);					
			
			
		}else {
			System.out.println("수정 실패");
		}
		
		return cnt;
	}
	

	
	
}
