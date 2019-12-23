package com.travel.www.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.NativeWebRequest;
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
	
	@RequestMapping("logout.kit")
	public ModelAndView logout(ModelAndView mv, HttpSession session, RedirectView rv) {
		session.invalidate();
		rv.setUrl("/main.kit");
		mv.setView(rv);
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
	
//	@RequestMapping("memberEdit.kit")
//	public ModelAndView memEditForm(ModelAndView mv, MemberVO vo) {
//		
//		mv.addObject("DATA", vo);
//		mv.setViewName("member/memberEdit");
//		
//		return mv;
//	}
	
	@RequestMapping("memberCheck.kit")

	public ModelAndView memEditForm(ModelAndView mv, MemberVO vo, HttpSession session) {
		String mId = (String) session.getAttribute("SID");
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
	public ModelAndView memEditForm(ModelAndView mv, MemberVO vo, HttpServletResponse response, RedirectView rv) throws Exception  {
		String url = "";
		System.out.println(vo.getmPw());
		System.out.println(vo.getmPw2());
		if(vo.getmPw().equals(vo.getmPw2())) {
			mDAO.memberEdit(vo);
			System.out.println("등록성공");			
				response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('수정 완료'); </script>");
	            out.flush();
	            out.close();
	            url = "/main.kit";
	            rv.setUrl(url);
	            mv.setView(rv);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			url = "/member/memberEdit";
			 out.println("<script>alert('수정 실패'); </script>");
			 out.flush();
			 out.close();
		}
		
		return mv;
	}
}
