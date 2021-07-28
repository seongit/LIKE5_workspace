package com.kh.like5.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.like5.member.model.service.MemberService;
import com.kh.like5.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("login.me")
	public ModelAndView login(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) { // 로그인 실패 => 에러페이지
			mv.addObject("errorMsg", "로그인 실패!");
			mv.setViewName("common/errorPage");
		}else { // 로그인 성공 => 메인페이지
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("inquiry.me")
	public String inquiry() {
		
		return "member/inquiry";
		
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		
		return "member/myPage";
		
	}
	
	@RequestMapping("reservation.me")
	public String reservation() {
		
		return "member/reservation";
		
	}
	
	@RequestMapping("donate.me")
	public String donate() {
		
		return "member/donate";
		
	}
	
}
