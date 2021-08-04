package com.kh.like5.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.like5.admin.model.vo.Calculate;
import com.kh.like5.board.model.vo.Board;
import com.kh.like5.board.model.vo.Reply;
import com.kh.like5.member.model.vo.Customer;
import com.kh.like5.member.model.vo.Member;
import com.kh.like5.member.model.vo.Sponsorship;

@Repository
public class MemberDao {
	
	//-------------------------동규------------------------------------
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
		
	}
	
	public ArrayList<Board> newlylist(SqlSessionTemplate sqlSession, int memNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.newlylist", memNo);
				
	}

	public ArrayList<Board> tempSavelist(SqlSessionTemplate sqlSession, int memNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.tempSaveList", memNo);
		
	}

	public ArrayList<Reply> anslist(SqlSessionTemplate sqlSession, int memNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.ansList", memNo);
		
	}

	public ArrayList<Sponsorship> price(SqlSessionTemplate sqlSession, int memNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.Spon", memNo);
		
	}


	public ArrayList<Calculate> calculate(SqlSessionTemplate sqlSession, int memNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.Calculate", memNo);
		
	}


	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember",m);
		
	}


	public int deleteMember(SqlSessionTemplate sqlSession, int memNo) {
		
		return sqlSession.update("memberMapper.deleteMem", memNo);

	}
	
	/**
	 * [1:1문의] 작성
	 * @author seong
	 */
	
	public int insertInquiry(SqlSessionTemplate sqlSession, Customer c) {
		return sqlSession.insert("memberMapper.insertInquiry",c);
	}
	
	
	
	
}
