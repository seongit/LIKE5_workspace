package com.kh.like5.booking.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.like5.booking.model.vo.Booking;
import com.kh.like5.booking.model.vo.Office;
import com.kh.like5.booking.model.vo.Review;
import com.kh.like5.common.model.vo.Attachment;
import com.kh.like5.common.model.vo.PageInfo;

@Repository
public class BookingDao {

	public ArrayList<Office> selectOfficeList(SqlSessionTemplate sqlSession, Booking b){
		return (ArrayList)sqlSession.selectList("bookingMapper.selectOfficeList", b);
	}
	
	public int insertBook(SqlSessionTemplate sqlSession, Booking b) {
		return sqlSession.insert("bookingMapper.insertBook", b);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookingMapper.selectListCount");
	}
	
	public ArrayList<Office> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds  rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("bookingMapper.selectListAll", null, rowBounds);
	}
	
	public Office selectOffice(SqlSessionTemplate sqlSession, int officeNo) {
		return sqlSession.selectOne("bookingMapper.selectOffice", officeNo);
	}
	
	public ArrayList selectOfficeAtt(SqlSessionTemplate sqlSession, int officeNo) {
		return (ArrayList)sqlSession.selectList("bookingMapper.selectOfficeAtt", officeNo);
	}
	public int insertOffice(SqlSessionTemplate sqlSession, Office o) {
		return sqlSession.insert("bookingMapper.insertOffice", o);
	}
	
	public int insertOfficeAtt(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		int result = 0;
		for(Attachment att : list) {
			result = sqlSession.insert("bookingMapper.insertOfficeAtt", att);
		}
		return result;
	}
	public int insertOfficeReAtt(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		int result = 0;
		for(Attachment att : list) {
			result = sqlSession.insert("bookingMapper.insertOfficeReAtt", att);
		}
		return result;
	}
	public int updateOffice(SqlSessionTemplate sqlSession, Office o) {
		return sqlSession.update("bookingMapper.updateOffice", o);
	}
	
	public int updateOfficeAtt(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		int result = 0;
		for(Attachment att : list) {
			result = sqlSession.update("bookingMapper.updateOfficeAtt", att);
		}
		return result;
	}
	
	/*추가 - 첨부파일 조회 + 사진*/
	public ArrayList<Attachment> selectList(SqlSessionTemplate sqlSession, int refFno){
		/*System.out.println(refFno);*/
		ArrayList<Attachment> pics= (ArrayList)sqlSession.selectList("selectAtList", refFno);
		/*System.out.println(pics);*/
		return pics;
		
	}
	
	public Booking selectBooking(SqlSessionTemplate sqlSession, int officeNo) {
		return sqlSession.selectOne("selectBooking", officeNo);
	}
	
	/*리뷰 조회*/
	public ArrayList<Review> selectReview(SqlSessionTemplate sqlSession, int officeNo){
		/*System.out.println(officeNo);*/
		ArrayList<Review> pis = (ArrayList)sqlSession.selectList("selectReview", officeNo);
		/*System.out.println(pis);*/
		return pis;
	}
	
	
}
