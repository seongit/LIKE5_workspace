package com.kh.like5.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.like5.common.model.vo.PageInfo;
import com.kh.like5.member.model.vo.Member;

public interface AdminService {

	// 회원관리 관련 select문-페이징처리
	int selectMemCount();
	// 회원관리 관련 select문 -회원정보 가져오기
	ArrayList<Member> selectMemList(PageInfo pi);
	// 회원관련 검색기능
	public int selectSearchMemCount(HashMap<String,String> map);
	public ArrayList<Member> selectSearchMemList(PageInfo pi, HashMap<String, String> map);
	
	// 회원관리-회원삭제기능(update혹은 delete구문)
	
	// 1:1문의 메인페이지 select문
	
	// 1:1문의 상세페이지 select문
	
	// 1:1문의 수정 페이지 update문(다시 상세 페이지로 돌아가게)
	
	// 후원관리 메인 페이지 select문-페이징처리
	
	// 후원관리 메인 페이지 select문 - 후원정보 가져오기
	
	// 후원상세 페이지 select문(후원내용)-페이징처리
	// 후원상세 페이지 select문(후원내용)-내용가져오기
	
	// 후원상세 페이지 select문(정산내용)-페이징처리
	// 후원상세 페이지 select문(정산내용)-내용가져오기
	
	// tag 메인페이지 select문 
	// tag 조회 페이지 select문-페이징처리
	// tag 조회 페이지 select문-게시글불러오기
	// tag 수정페이지(관리자용) select문
	// tag 수정페이지 Modal update문
	
	
	
	
	
	
	
}