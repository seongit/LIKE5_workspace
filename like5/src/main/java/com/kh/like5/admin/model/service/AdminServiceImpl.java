package com.kh.like5.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.like5.board.model.vo.Board;
import com.kh.like5.board.model.vo.Report;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.like5.admin.model.dao.AdminDao;
import com.kh.like5.common.model.vo.PageInfo;
import com.kh.like5.member.model.vo.Customer;
import com.kh.like5.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectMemCount() {
		return adDao.selectMemCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemList(PageInfo pi) {
		return adDao.selectMemList(sqlSession, pi);
	}

	@Override
	public int selectSearchMemCount(HashMap<String, String> map) {
		return adDao.selectSearchMemCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectSearchMemList(PageInfo pi, HashMap<String, String> map) {
		return adDao.selectSearchMemList(sqlSession, pi, map);
	}

	@Override
	public int deleteMem(int memNo) {
		return adDao.deleteMem(sqlSession, memNo);
	}
	

	@Override
	public int getBoardCount() {
		return adDao.getBoardCount(sqlSession);
	}

	@Override
	public ArrayList<Board> getBoardList(PageInfo pi) {
		return adDao.getBoardList(sqlSession, pi);
	}

	@Override
	public int getSearchBoardCount(HashMap<String, String> map) {
		return adDao.getSearchBoardCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> getSearchBoardList(PageInfo pi, HashMap<String, String> map) {
		return adDao.getSearchBoardList(sqlSession, pi, map);
	}

	@Override
	public int deleteBoard(int bno) {
		return adDao.deleteBoard(sqlSession, bno);
	}
	
	// 1:1문의 게시글-페이징
	@Override
	public int selectCsTwoCount() {
		return adDao.selectCsTwoCount(sqlSession);
	}
	// 1:1문의 게시글-리스트조회
	@Override
	public ArrayList<Customer> selectCsTwoList(PageInfo pi) {
		return adDao.selectCsTwoList(sqlSession, pi);
	}

	@Override
	public int getReportCount() {
		return adDao.getReportCount(sqlSession);
	}

	@Override
	public ArrayList<Report> getReportList(PageInfo pi) {
		return adDao.getReportList(sqlSession, pi);
	}

	@Override
	public int getSearchReportCount(HashMap<String, String> map) {
		return adDao.getSearchReportCount(sqlSession, map);
	}

	@Override
	public ArrayList<Report> getSearchReportList(PageInfo pi, HashMap<String, String> map) {
		return adDao.getSearchReportList(sqlSession, pi, map);
	}


}
