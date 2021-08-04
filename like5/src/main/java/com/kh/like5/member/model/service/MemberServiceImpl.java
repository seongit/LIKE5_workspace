package com.kh.like5.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.like5.admin.model.vo.Calculate;
import com.kh.like5.board.model.vo.Board;
import com.kh.like5.board.model.vo.Reply;
import com.kh.like5.member.model.dao.MemberDao;
import com.kh.like5.member.model.vo.Customer;
import com.kh.like5.member.model.vo.Member;
import com.kh.like5.member.model.vo.Sponsorship;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		
		return mDao.insertMember(sqlSession, m);
		
	}

	@Override
	public int updateMember(Member m) {
		
		return mDao.updateMember(sqlSession, m);
		
	}

	@Override
	public int deleteMember(int memNo) {
		
		return mDao.deleteMember(sqlSession, memNo);
		
	}

	/**
	 * [1:1문의] 작성
	 * @author seong
	 */
	@Override
	public int insertInquiry(Customer c) {
		return mDao.insertInquiry(sqlSession, c);
	}
	
	
	@Override
	public ArrayList<Board> newlylist(int memNo) {
		
		return mDao.newlylist(sqlSession, memNo);
		
	}

	@Override
	public ArrayList<Reply> anslist(int memNo) {
		
		return mDao.anslist(sqlSession, memNo);
		
	}

	@Override
	public ArrayList<Board> tempSavelist(int memNo) {
		
		return mDao.tempSavelist(sqlSession, memNo);
		
	}

	@Override
	public ArrayList<Sponsorship> price(int memNo) {

		return mDao.price(sqlSession, memNo);
		
	}

	@Override
	public ArrayList<Calculate> calculate(int memNo) {
		
		return mDao.calculate(sqlSession, memNo);
		
	}
	

}
