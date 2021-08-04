package com.kh.like5.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.like5.board.model.service.BoardService;
import com.kh.like5.board.model.vo.Board;
import com.kh.like5.board.model.vo.Reply;
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


		mv.addObject("listCount",listCount)
		   .addObject("comList",comList)
		   .addObject("pi",pi)
		   .setViewName("board/community/comListView");
		
		return mv;
	}
	
	/**
	 * [커뮤니티] - 키워드 검색 결과 조회 
	 * @author seong
	 */
	
	@RequestMapping("comSearch.bo")
	public ModelAndView comSearchList(ModelAndView mv,@RequestParam(value="currentPage",defaultValue="1")
										int currentPage	,String condition,String keyword) {
		
		HashMap<String,String>map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = bService.comSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Board>comList = bService.comSearchList(pi,map);
		
		
		mv.addObject("pi",pi)
		  .addObject("comList",comList)
		  .addObject("condition",condition)
		  .addObject("keyword",keyword)
		  .addObject("listCount",listCount)
		  .setViewName("board/community/comListView");
		return mv;
	}
	
	/**
	 * [커뮤니티] - 전체 | 일상 | 스터디 모집 | 카테고리별 조회
	 * @author seong
	 */
	
	@RequestMapping("comOrderByCategory.bo")
	public ModelAndView comOrderByCategory(ModelAndView mv,@RequestParam(value="currentPage",defaultValue="1")
		int currentPage	,String condition) {
	
	int listCount = bService.comOrderByListCount(condition);
	
	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
	ArrayList<Board>comList = bService.comOrderByCategory(pi,condition);
	
	
	mv.addObject("pi",pi)
	.addObject("comList",comList)
	.addObject("condition",condition)
	.addObject("listCount",listCount)
	.setViewName("board/community/comListView");
	return mv;
	}
	
	
	/**
	 * [커뮤니티]최신 | 조회수 | 댓글수 기준으로 조회
	 * @author seong
	 */
	@RequestMapping("comOrderByCount.bo")
	public ModelAndView comOrderByCount(ModelAndView mv,@RequestParam(value="currentPage",defaultValue="1")
										int currentPage, String condition) {
		
	int listCount = bService.comListCount();
	
	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
	ArrayList<Board>comList = bService.comOrderByCount(pi, condition);
	
	mv.addObject("pi",pi)
	.addObject("comList",comList)
	.addObject("condition",condition)
	.addObject("listCount",listCount)
	.setViewName("board/community/comListView");
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
	 */
	
	@RequestMapping("comDetail.bo")
	public ModelAndView comDetail(ModelAndView mv,int bno) {
		
		// 클릭시 조회수 증가
		int result = bService.increaseCount(bno);
		
		// 상세보기
		if(result>0) {
			Board b = bService.comDetail(bno);
			mv.addObject("b",b)
			  .setViewName("board/community/comDetailView");
		}else {
			mv.addObject("errorMsg", "조회 실패!")
				.setViewName("common/errorPage");
		}
	
		return mv;
	}
	
	/**
	 * Ajax
	 * 댓글 | 대댓글 전체 조회
	 * @author seong
	 */
	@ResponseBody
	@RequestMapping(value="rlist.bo",produces="application/json; charset=utf-8")
	public String selectReplyList(int bno) {
		ArrayList<Reply>list = bService.selectReplyList(bno);
		return new Gson().toJson(list);
	}
	
	/**
	 * 댓글 작성하기
	 * @author seong
	 */
	@ResponseBody
	@RequestMapping("insertReply.bo")
	public String insertReply(Reply r,Model model) {
		int result = bService.insertReply(r);
		return result>0? "success" : "fail";		
	}
	
	/**
	 * 대댓글 작성하기
	 * @author seong
	 */
	@ResponseBody
	@RequestMapping("insertReplies.bo")
	public String insertReplies(Reply r,Model model) {
		int result = bService.insertReplies(r);
		
		return result>0?"success":"fail";
	}
	
	/**
	 * [커뮤니티] 게시글 작성하기
	 * @author seong
	 */
	@RequestMapping("insertCom.bo")
	public ModelAndView insertCommunity(Board b,ModelAndView mv,MultipartFile upfile,HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(session,upfile); // "2021070217013023152.jpg"
			b.setImgPath("resources/images/board/" + changeName); // resource/uploadFiles/2021070217013023152.jpg
		}
		
		int result = bService.insertCommunity(b);
		if(result>0) {
			
			session.setAttribute("alertMsg", "성공적으로 등록 되었어요 😀 ");
			mv.setViewName("redirect:comList.bo");
		}
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
	 * [커뮤니티] 게시글 삭제하기
	 * @author seong
	 */
	
	@RequestMapping("comDelete.bo")
	public String deleteCommunity(int bno,HttpSession session){
		
		int result = bService.deleteCommunity(bno);
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다!");
		}
		return "redirect:comList.bo";
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
	
	
	
	//-----------------------------------------------------------
	
	public String saveFile(HttpSession session,MultipartFile file) {
		
		String savePath = session.getServletContext().getRealPath("resources/images/board/");
		
		String originName = file.getOriginalFilename();
		//20210702(년월일) + 23432(랜덤값) + .jpg(원본파일확장자) 
		String currentTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));//.다음 인덱스부터의 문자열 추출
		
		String changeName = currentTime + "_" + ranNum + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	

	
	
}
