//package com.travel.www.controller;
//
//import java.util.Map;
//
//import javax.mail.MessagingException;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//
//import org.apache.log4j.Logger;
//import org.poom.sap.common.util.EmailSender;
//import org.poom.sap.file.model.service.FileService;
//import org.poom.sap.member.model.service.MemberService;
//import org.poom.sap.member.model.vo.Email;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//@RequestMapping("member")
//public class MemberController {
//	Logger log = Logger.getLogger(this.getClass());
//
//	@Autowired
//	private MemberService memberService;
//
//	@Autowired
//	private EmailSender emailSender;
//
//	@Autowired
//	private Email email;
//	
//	@Autowired
//	private FileService fileService;
//
//	
//	@RequestMapping(value="/searchPwForm.do", method=RequestMethod.GET)
//	public String searchIdForm(){
//		return "member/find";
//	}
//
//	@Autowired
//	private JavaMailSender mailSender;
//	
//	@RequestMapping(value="find.kit", method=RequestMethod.GET)
//	public ModelAndView sendEmailAction (@RequestParam Map>String, Object< paramMap, ModelMap model, ModelAndView mv) throws Exception {
//
//		String USERNAME = (String) paramMap.get("username");
//		String EMAIL = (String) paramMap.get("email");
//		String PASSWORD = memberService.getPw(paramMap);
//
//		if(PASSWORD!=null) {
//			email.setContent("비밀번호는 "+PASSWORD+" 입니다."); // 이메일로 보낼 메시지
//			email.setReceiver(EMAIL); // 받는이의 이메일 주소
//			email.setSubject(USERNAME+"님 비밀번호 찾기 메일입니다."); // 이메일로 보낼 제목
//			
//			try {
//				MimeMessage msg = mailSender.createMimeMessage();
//				MimeMessageHelper messageHelper 
//				= new MimeMessageHelper(msg, true, "UTF-8");
//				
//				messageHelper.setSubject(email.getSubject());
//				messageHelper.setText(email.getContent());
//				messageHelper.setTo(email.getReceiver());
//				messageHelper.setFrom("구글이메일@gmail.com"); // 보내는 이의 주소(root-context.xml 에서 선언했지만 적어줬음)
//				msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
//				mailSender.send(msg);
//				
//			}catch(MessagingException e) {
//				System.out.println("MessagingException");
//				e.printStackTrace();
//			}
//			mv.setViewName("redirect:/noriter/noriterList.do");
//			return mv;
//		}else {
//			mv.setViewName("redirect:/noriter/noriterList.do");
//			return mv;
//		}
//	}
//
