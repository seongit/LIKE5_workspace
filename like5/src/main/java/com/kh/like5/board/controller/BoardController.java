package com.kh.like5.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	/**
	 * [한솔] QnA 게시글 리스트 페이지 
	 */
	@RequestMapping("qList.bo")
	public String qList() {
		return "board/qna/qnaListView";
	}
	
	/**
	 * [한솔] QnA 게시글 작성 페이지
	 */
	
	@RequestMapping("qEnrollForm.bo")
	public String qEnrollForm() {
		
		return "board/qna/qnaEnrollForm";
	}
	
	/**
	 * [한솔] QnA 게시글 상세 페이지
	 * 		 → 별도 가공처리 아직 X, 페이지 확인용으로 연결만 해둠
	 */
	
	@RequestMapping("qDetail.bo")
	public String qDetail() {
		
		return "board/qna/qnaDetailView";
	}
	
	
	//-------------------------------------------------------------------
	
	
	/**
	 * 커뮤니티 전체 리스트
	 * @author seong 
	 */
	@RequestMapping("comList.bo")
	public ModelAndView comList(ModelAndView mv){
		mv.setViewName("board/community/comListView");
		return mv;
	}
	
	/**
	 * 커뮤니티 글 작성 페이지
	 * @author seong 
	 */
	@RequestMapping("comEnrollForm.bo")
	public ModelAndView comEnrollForm(ModelAndView mv) {
		mv.setViewName("board/community/comEnrollForm");
		return mv;
	}
	
	
}
