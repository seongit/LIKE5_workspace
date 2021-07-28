package com.kh.like5.booking.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.like5.booking.model.vo.Booking;
import com.kh.like5.booking.model.vo.Office;
import com.kh.like5.common.model.vo.Attachment;
import com.kh.like5.common.model.vo.PageInfo;

public interface BookingService {

	//1.검색 결과 조회(사용자)
	ArrayList<Office> selectList(Booking b);
	
	//2.리스트 전체 조회 + 페이징(관리자)
	int selectListCount();
	ArrayList<Office> selectListAll(PageInfo pi);
	ArrayList<Office> selectListAll();
	
	//3.오피스 등록(관리자)
	int insertOffice(Office o, ArrayList<Attachment> list);
	
	//4.오피스 수정(관리자)
	int updateOffice(Office o, ArrayList<Attachment> list);
	
	//5.오피스 삭제(관리자)
	int deleteOffice(Office o);
	
	//6.검색 + 페이징(관리자)
	int selectSearchListCount(HashMap<String, String> map);
	ArrayList<Office> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	//7.오피스 상세 조회(관리자)
	Office selectOffice(int officeNo);
	ArrayList<Attachment> selectOfficeAtt(int officeNo);
	
	/**
	 * 추가 부분 - 박정빈
	 *
	 */
	//8. 첨부파일 조회(사진)
	ArrayList<Attachment> selectList(int refFno);
	
	//9. 오피스 조회(내용 상세)
	
	//10. 리뷰 조회
	
}

