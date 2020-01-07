package com.travel.www.controller;


import java.io.IOException;
import java.io.PrintWriter;
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
	
	@Inject
	JavaMailSender mailSender;
	
	@Autowired
	MemberDAO mDAO;
	
/*
	// 이메일 발송
	public void send_mail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "이메일 입력";
		String hostSMTPpwd = "비밀번호 입력";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "rudrms854@gmail.com";
		String fromName = "Spring Homepage";
		String subject = "";
		String msg = "";
		
		if(div.equals("join")) {
			// 회원가입 메일 내용
			subject = "Spring Homepage 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getmId() + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<input type='hidden' name='email' value='" + vo.getmMail() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
		}else if(div.equals("find_pw")) {
			subject = "Spring Homepage 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getmId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getmPw() + "</p></div>";
		}
		
		// 받는 사람 E-Mail 주소
		String mail = vo.getmMail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	
	public void find_pw(HttpServletResponse response, MemberVO vo) {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if(manager.check_id(vo.getmId()) == 0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!vo.getmMail().equals(manager.login(vo.getmId()).getmMail())) {
			out.print("잘못된 이메일 입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setmPw(pw);
			
			// 비밀번호 변경
			manager.update_pw(vo);			
			
			// 비밀번호 변경 메일 발송
			send_mail(vo, "find_pw");
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}	
	
*/
	
	// 비밀번호 찾기
	@RequestMapping("find_pw_form.kit")
	public ModelAndView find_pw(ModelAndView mv){
		mv.setViewName("member/find_pw_form");
		
		return mv;
	}
	
	// 비밀번호
	@RequestMapping("password.kit")
	public ModelAndView password(ModelAndView mv) {
		mv.setViewName("/member/password");
		
		return mv;
	}	
	
	// 임시 비밀번호
	@RequestMapping(value = "password.kit" , method=RequestMethod.POST )
	public ModelAndView newpassword(ModelAndView mv, HttpServletRequest req, String email, HttpServletResponse resp) {
		mv.setViewName("/member/new_password");
		
		Random r = new Random();
		int pass = r.nextInt(4589362) + 49311;
		
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
			out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
			out_email.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return mv;
	}	
	
	// 임시 비밀번호
	@RequestMapping(value = "new_pass{pass}.kit", method = RequestMethod.POST)
	public ModelAndView new_pass(ModelAndView mv, String email_injeung, @PathVariable String pass, HttpServletResponse response_equals, RedirectView rv) {
		System.out.println("인정 : " + email_injeung);
		System.out.println("패스워드 : " + pass);
		
		if (email_injeung.equals(pass)) {
			System.out.println("일치");
			mv.setViewName("/main.kit");
			mv.addObject("EMAIL",email_injeung);
			response_equals.setContentType("text/html; charset=UTF-8");
			
			try {
				PrintWriter out_equals = response_equals.getWriter();
				out_equals.println("<script>alert('인증번호가 일치하였습니다. 메인창으로 이동합니다.');</script>");
				out_equals.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if(email_injeung != pass) {
	
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
				out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
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
		System.out.println("dd");
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
		
		System.out.println("### cont mail : " + mVO.getmMail());
		
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
	
	
	@RequestMapping("idCheck.kit")
	@ResponseBody
	public int idCheck(String id) {
		System.out.println("ㅇㅇ");
		int cnt = 0;
		cnt = mDAO.idCheck(id);
		return cnt;	
	}

/*	
	// 비밀번호 찾기 폼
	@RequestMapping(value = "find.kit")
	public String findform() throws Exception{
		return "/member/find";
	}	
*/
	
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
