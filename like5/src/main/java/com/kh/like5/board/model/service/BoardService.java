package com.kh.like5.board.model.service;

import java.util.ArrayList;

import com.kh.like5.board.model.vo.Board;
import com.kh.like5.common.model.vo.PageInfo;

public interface BoardService {

	
	
	
	
	
	
	
	
	
	//-------------------성은-------------------------

	//[커뮤니티]
	
	// 전체 목록 리스트 페이징 처리시 필요한 게시글 전체 count
	int comListCount();
	// 전체 목록 리스트 조회
	ArrayList<Board>comList(PageInfo pi);
	
	// 커뮤니티 게시글 상세보기시 조회수 증가
	int increaseCount(int bno);
	// 게시글 상세보기
	Board comDetail(int bno);
	
	//[커뮤니티] - 글 수정하기
	
	//[커뮤니티] - 삭제하기
	
	
	//[칼럼] - 전체 목록 리스트 조회
	ArrayList<Board>colList(PageInfo pi);
	

	//[칼럼] - 글 상세보기
	Board colDetail(int bno);
	
	//[칼럼] - 글 수정하기
	
	//[칼럼] - 삭제하기
	
	
	
}
