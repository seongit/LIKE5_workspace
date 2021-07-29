package com.kh.like5.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.like5.board.model.service.BoardService;
import com.kh.like5.board.model.vo.Board;
import com.kh.like5.common.model.vo.PageInfo;
import com.kh.like5.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	//------------------ 한솔-------------------------
	
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
	
	
	//-------------------동규-------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//-------------------성은-------------------------
	
	
	/**
	 * [커뮤니티] - 전체 목록 리스트 조회
	 * @author seong 
	 */
	@RequestMapping("comList.bo")
	public ModelAndView comList(@RequestParam(value="currentPage",defaultValue="1")int currentPage,ModelAndView mv){
		
		int listCount = bService.comListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount,currentPage,5,5);
		
		ArrayList<Board>comList = bService.comList(pi);

		mv.addObject("comList",comList);
		mv.addObject("pi",pi);
		mv.setViewName("board/community/comListView");
		
		return mv;
	}
	
	/**
	 * [커뮤니티] - 글 작성 Form
	 * @author seong 
	 */
	@RequestMapping("comEnrollForm.bo")
	public ModelAndView comEnrollForm(ModelAndView mv) {
		mv.setViewName("board/community/comEnrollForm");
		return mv;
	}
	
	/**
	 * [커뮤니티] - 글 상세보기
	 * @author seong
	 * 			
	 * 			->int bno 받아오기
	 */
	
	@RequestMapping("comDetail.bo")
	public ModelAndView comDetail(ModelAndView mv) {
		mv.setViewName("board/community/comDetailView");
		return mv;
	}
	
	
	/**
	 * [커뮤니티] - 글 수정 Form
	 * @author seong
	 */
	
	@RequestMapping("comUpdateForm.bo")
	public ModelAndView comUpdateForm(ModelAndView mv) {
		mv.setViewName("board/community/comUpdateForm");
		return mv;
	}
	
	/**
	 * [칼럼] - 전체 목록 리스트 조회
	 * @author seong
	 */
	
	@RequestMapping("colList.bo")
	public ModelAndView colList(ModelAndView mv) {
		mv.setViewName("board/column/colListView");
		return mv;
	}
	
	/**
	 * [칼럼] - 글 작성 Form
	 * @author seong
	 */
	
	@RequestMapping("colEnrollForm.bo")
	public ModelAndView colEnrollForm(ModelAndView mv) {
		mv.setViewName("board/column/colEnrollForm");
		return mv;
	}
	
	/**
	 * [칼럼] - 글 상세보기
	 * @author seong
	 */

	@RequestMapping("colDetail.bo")
	public ModelAndView colDetail(ModelAndView mv) {
		mv.setViewName("board/column/colDetailView");
		return mv;
	}
	
	
	
}
