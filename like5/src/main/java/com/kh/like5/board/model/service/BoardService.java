package com.kh.like5.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.like5.board.model.vo.Board;
import com.kh.like5.board.model.vo.Reply;
import com.kh.like5.board.model.vo.Report;
import com.kh.like5.board.model.vo.Tag;
import com.kh.like5.common.model.vo.PageInfo;

public interface BoardService {
	
	//------------------ 한솔 -------------------------
	
	// [QnA]
	
	// 1. 게시글 리스트 페이지 조회
	// 총 게시글 개수 조회
	int qnaListCount();
	// 사용자가 요청한 페이지에 뿌려줄 리스트
	ArrayList<Board> qnaList(PageInfo pi);
	
	// 2. 게시글 작성
	int qnaInsert(Board b);
	
	// 3. 게시글 상세조회
	// 상세조회 요청 시 조회수 증가 (중복이어서 주석처리 / 추후 삭제 예정)
	// int increaseCount(int bno);
	// 실제 게시글 조회
	Board qnaDetail(int bno);
	
	// 4. 게시글 삭제(status값 변경)
	int qnaDelete(int bno);
	
	// 5. 게시글 수정
	int qnaUpdate(Board b);
	
	// 6. 키워드 검색
	// 키워드 검색 총 게시글 개수 조회
	int qnaSearchListCount(HashMap<String, String> map);
	// 키워드 검색 결과 조희
	ArrayList<Board>qnaSearchListCount(PageInfo pi, HashMap<String, String> map);
	
	// 7. 정렬 기준별 조회
	// 정렬 기준별 총 게시글 개수 조회
	int qnaOrderByListCount(String condition);
	// 정렬 기준별 결과 조회
	ArrayList<Board>qnaOrderByCount(PageInfo pi, String condition);
	
	// 8. 댓글, 대댓글 관련 (중복이어서 작성 X)
	
	// 9. 태그 리스트
	ArrayList<Tag> tagList();
	
	// 10. 게시글 임시저장
	int qnaStorageInsert(Board b);

	
	
	//-------------------성은-------------------------

	//[커뮤니티]
	
	// 전체 목록 리스트 페이징 처리시 필요한 게시글 전체 count
	int comListCount();
	
	// 전체 목록 리스트 조회
	ArrayList<Board>comList(PageInfo pi);
	
	// 키워드 검색 결과 list count
	int comSearchListCount(HashMap<String,String>map);
	
	// 키워드 검색 결과 조회
	ArrayList<Board>comSearchList(PageInfo pi,HashMap<String,String>map);

	// 카테고리별 게시글 list count
	int comOrderByListCount(String condition);
	
	// 전체 | 일상 | 스터디 모집 | 카테고리별 조회
	ArrayList<Board>comOrderByCategory(PageInfo pi,String condition);
	
	// 최신 | 조회수 | 댓글 순 조회
	ArrayList<Board>comOrderByCount(PageInfo pi,String condition);
	
	// 게시글 상세보기시 조회수 증가
	int increaseCount(int bno);
	
	// 게시글 상세보기
	Board boardDetail(int bno);
	
	// 댓글 | 대댓글 전체 조회
	ArrayList<Reply>selectReplyList(int bno);
	
	// 댓글 작성
	int insertReply(Reply r);
	
	// 대댓글 작성
	int insertReplies(Reply r);
	
	// [커뮤니티 | 칼럼] 게시글 작성하기
	int insertComAndCol(Board b);
	
	//[커뮤니티] - 글 수정하기
	int updateCommunity(Board b);
	
	//[커뮤니티] - 삭제하기
	int deleteCommunity(int bno);
	
	//[커뮤니티] - 게시글 신고하기
	int reportCommunity(Report b);
	
	//-----------------------------------------------------
	
	// 전체 목록 리스트 페이징 처리시 필요한 게시글 전체 count
	int colListCount();
	
	// 최신 | 조회수 | 좋아요 순 조회
	ArrayList<Board>colOrderByCount(PageInfo pi,String condition);
		
	// [칼럼] - 전체 목록 리스트 조회
	ArrayList<Board>colList(PageInfo pi);
	
	// [좋아요] - 게시글 상세 조회 시 로그인한 회원의  좋아요 여부
	int likesCount(Board b);
	
	// [스크랩] - 게시글 상세 조회 시 로그인한 회원의  스크랩 여부
	int scrapCount(Board b);
	
	//  [ 스크랩 | 좋아요 ]  등록
	int likeAndScrap(HashMap<String,Object>map);
	
	//  [ 스크랩 | 좋아요 ]  해제
	int UnlikeAndUnScrap(HashMap<String,Object>map);
	
	
	
	//[칼럼] - 글 수정하기
	
	//[칼럼] - 삭제하기
	
	
	
}
