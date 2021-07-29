package com.kh.like5.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.like5.board.model.dao.BoardDao;
import com.kh.like5.board.model.vo.Board;
import com.kh.like5.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	/**
	 *  [커뮤니티] 전체 목록 리스트 페이징 처리시 필요한 게시글 전체 count
	 *  @author seong
	 */
	@Override
	public int comListCount() {
		return bDao.comListCount(sqlSession);
	}
	
	/**
	 *  [커뮤니티] 전체 목록 리스트 조회
	 *  @author seong
	 */
	@Override
	public ArrayList<Board> comList(PageInfo pi) {
		return bDao.comList(sqlSession, pi);
	}

	/**
	 *  [커뮤니티] 게시글 상세보기시 조회수 증가
	 *  @author seong
	 */
	@Override
	public int increaseCount(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 *  [커뮤니티] 커뮤니티 게시글 상세보기
	 *  @author seong
	 */
	
	@Override
	public Board comDetail(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 *  [칼럼] - 전체 목록 리스트 조회
	 *  @author seong
	 */
	
	@Override
	public ArrayList<Board> colList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 *  [칼럼] - 글 상세보기
	 *  @author seong
	 */
	
	@Override
	public Board colDetail(int bno) {
		// TODO Auto-generated method stub
		return null;
	}



	
	
	
}
