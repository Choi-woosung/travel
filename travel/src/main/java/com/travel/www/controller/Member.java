package com.travel.www.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
// import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.travel.www.dao.MemberDAO;
import com.travel.www.vo.MemberVO;

import sun.nio.cs.ext.MacHebrew;


@Controller
@RequestMapping("/member/")
public class Member {
	
	@Inject
	JavaMailSender mailSender;
	
	@Autowired
	MemberDAO mDAO;
	


	// 비밀번호 찾기
	@RequestMapping("find_pw.kit")
	public ModelAndView find_pw(ModelAndView mv){
		mv.setViewName("member/find_pw");
		
		return mv;
	}
	
	// 비밀번호
	@RequestMapping("pw_email.kit")
	public ModelAndView password(ModelAndView mv) {
		mv.setViewName("member/pw_email");
		
		return mv;
	}	
	
	// 임시 비밀번호
	@RequestMapping(value = "new_pw.kit" , method=RequestMethod.POST )
	public ModelAndView path(ModelAndView mv, HttpServletRequest req, MemberVO mVO, String email, HttpServletResponse resp, RedirectView rv) {
	
		Random r = new Random();
		int pass = r.nextInt(4589372) + 49311;
		
		
		
		String setfrom = "test@naver.com";
		String tomail = req.getParameter("email");
		String title = "임시 비밀번호 입니다.";
		
		String content = 
				System.getProperty("line.separator") +
				System.getProperty("line.separator") +
				" 회원님의 " +
				System.getProperty("line.separator") +
				System.getProperty("line.separator") +
				" 임시 비밀번호는 " + pass + " 입니다. " ;
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			mVO.setnPw2(pass);
			mVO.setmMail(email);
			int cnt = mDAO.update_pw(mVO);
			if(cnt > 0) {
				System.out.println("변경완료");
			}
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		mv.addObject("pass", pass);
		
		resp.setContentType("text/html; charset=UTF-8");
		rv.setUrl("/main.kit");
		mv.setView(rv);
//		try {
//			PrintWriter out_email = resp.getWriter();
//			out_email.println("<script>alert('이메일로 발송되었습니다. 인증번호를 입력해주세요.');</script>");
//			out_email.flush();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		return mv;
	}		
	
		
	
/*	
	// 임시 비밀번호
	@RequestMapping(value = "passwordProc.kit" , method=RequestMethod.POST )
	public ModelAndView newpassword(ModelAndView mv, HttpServletRequest req, String email, HttpServletResponse resp) {
		mv.setViewName("/member/new_pw");
		
		Random r = new Random();
		int pass = r.nextInt(4589372) + 49311;

		
		String setfrom = "test@naver.com";
		String tomail = req.getParameter("email");
		String title = "임시 비밀번호 입니다.";
		
		System.out.println(tomail);
		
		String content = 
				System.getProperty("line.separator") +
				System.getProperty("line.separator") +
				" 회원님의 " +
				System.getProperty("line.separator") +
				System.getProperty("li	ne.separator") +
				" 임시 비밀번호는 " + pass + " 입니다. " ;
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		mv.addObject("pass", pass);
		
		resp.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out_email = resp.getWriter();
			out_email.println("<script>alert('이메일로 발송되었습니다. 인증번호를 입력해주세요.');</script>");
			out_email.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return mv;
	}	
*/
	
	@RequestMapping(value = "new_pass{pass}.kit", method = RequestMethod.POST)
	public ModelAndView new_pass(ModelAndView mv, String email_injeung2, @PathVariable String pass, HttpServletResponse response_equals, RedirectView rv) {
		System.out.println("인정 : " + email_injeung2);
		System.out.println("새로운 비밀번호 : " + pass);
		
		if (email_injeung2.equals(pass)) {
			System.out.println("일치");
			mv.setViewName("member/join");
			mv.addObject("EMAIL",email_injeung2);
			response_equals.setContentType("text/html; charset=UTF-8");
			
			try {
				PrintWriter out_equals = response_equals.getWriter();
				out_equals.println("<script>alert('인증번호가 일치하였습니다. 비번찾기창으로 이동합니다.'); history.go(-3);</script>");
				out_equals.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if(email_injeung2 != pass) {
	
			System.out.println("불일치");
			mv.setViewName("member/email");
			response_equals.setContentType("text/html; charset=UTF-8");
		
			
			try {
				PrintWriter out_equals = response_equals.getWriter();
				out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.');</script>");
				out_equals.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
	
	
	
	@RequestMapping("email.kit")
	public ModelAndView email(ModelAndView mv) {
		mv.setViewName("/member/email");
		
		return mv;
	}
	

	// 이메일 인증	
	@RequestMapping(value = "auth.kit" , method=RequestMethod.POST )
	public ModelAndView certification(ModelAndView mv, HttpServletRequest req, String email, HttpServletResponse resp) {
		mv.setViewName("/member/email_certification");
		
		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311;
		
		String setfrom = "test@naver.com";
		String tomail = req.getParameter("email");
		String title = "회원가입 인증 이메일 입니다.";
		System.out.println(tomail);
		
		String content = 
				System.getProperty("line.separator") +
				System.getProperty("line.separator") +
				"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다." +
				System.getProperty("line.separator") +
				System.getProperty("line.separator") +
				" 인증번호는 " + dice + " 입니다. " +
				System.getProperty("line.separator") +
				System.getProperty("line.separator") +
				" 받으신 인증번호를 홈페이지에 입력해 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		mv.addObject("dice", dice);
		
		resp.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out_email = resp.getWriter();
			out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
			out_email.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value = "join_injeung{dice}.kit", method = RequestMethod.POST)
	public ModelAndView join_injeung(ModelAndView mv, String email_injeung, @PathVariable String dice, HttpServletResponse response_equals, RedirectView rv) {
		System.out.println("인정 : " + email_injeung);
		System.out.println("다이스 : " + dice);
		
		if (email_injeung.equals(dice)) {
			System.out.println("일치");
			mv.setViewName("member/join");
			mv.addObject("EMAIL",email_injeung);
			response_equals.setContentType("text/html; charset=UTF-8");
			
			try {
				PrintWriter out_equals = response_equals.getWriter();
				out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.'); history.go(-3);</script>");
				out_equals.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if(email_injeung != dice) {
	
			System.out.println("불일치");
			mv.setViewName("member/email");
			response_equals.setContentType("text/html; charset=UTF-8");
		
			
			try {
				PrintWriter out_equals = response_equals.getWriter();
				out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.');</script>");
				out_equals.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
	@RequestMapping("login.kit")
	public ModelAndView loginForm(ModelAndView mv) {
		
		mv.setViewName("/member/login");
		
		return mv;
	}
	
	@RequestMapping("loginProc.kit")
	public ModelAndView loginProc(HttpSession session, ModelAndView mv, RedirectView rv, MemberVO vo) {
		int cnt = mDAO.loginProc(vo);
		System.out.println("로그인 성공 : " + cnt);
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
		
//		System.out.println("### cont mail : " + mVO.getmMail());
		
		// 할일
		// 1. 회원정보 입력하고
		int cnt = mDAO.insertMemb(mVO);
		if(cnt == 1) {
			rv.setUrl("/main.kit");
		} else {
			rv.setUrl("/member/join.kit");
		}
		mv.setView(rv);
		return mv;
	}
	
	
	@RequestMapping("idCheck.kit")
	@ResponseBody
	public int idCheck(String id) {
		int cnt = 0;
		cnt = mDAO.idCheck(id);
		return cnt;	
	}

	
	
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
	 

//	myProfile.jsp 매핑
	@RequestMapping("myProfile.kit")
	public ModelAndView myProfile(ModelAndView mv, MemberVO mvo, HttpSession session, RedirectView rv) {
		String sid = (String) session.getAttribute("SID");
		String url =  "/main.kit";
		
		if (sid == null) {
			rv.setUrl(url);
			mv.setView(rv);
			return mv;
		}
		
		mvo.setmId(sid);
		mvo = mDAO.getMyProfile(mvo);
		
		mv.addObject("LIST", mvo);
		url = "member/myProfile";
		
		mv.setViewName(url);
		
		return mv;
	}
}
