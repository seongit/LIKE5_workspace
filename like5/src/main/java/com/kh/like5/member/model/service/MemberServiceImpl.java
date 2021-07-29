package com.kh.like5.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.like5.member.model.dao.MemberDao;
import com.kh.like5.member.model.vo.Customer;
import com.kh.like5.member.model.vo.Member;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String Email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int emailCheck(String Email) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * [1:1문의] 작성
	 * @author seong
	 */
	@Override
	public int insertInquiry(Customer c) {
		return mDao.insertInquiry(sqlSession, c);
	}
	
	
	
	

}
