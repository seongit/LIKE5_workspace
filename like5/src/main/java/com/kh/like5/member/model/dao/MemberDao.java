package com.kh.like5.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.like5.member.model.vo.Customer;
import com.kh.like5.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	
	/**
	 * [1:1문의] 작성
	 * @author seong
	 */
	
	public int insertInquiry(SqlSessionTemplate sqlSession, Customer c) {
		return sqlSession.insert("memberMapper.insertInquiry",c);
	}
	
	
}
