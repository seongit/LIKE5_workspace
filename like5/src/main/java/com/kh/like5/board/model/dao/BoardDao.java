package com.kh.like5.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.like5.board.model.vo.Board;
import com.kh.like5.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	
	
	
	
	
	
	//-----------------------성은
	
	/**
	 *[커뮤니티] - 전체 목록 리스트 페이징 처리시 필요한 게시글 전체 count
	 * @author seong
	 */
	public int comListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.comListCount");
	}
	
	/**
	 * [커뮤니티] - 전체 목록 리스트 조회
	 * @author seong 
	 */
	public ArrayList<Board>comList(SqlSessionTemplate sqlSession,PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds  rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.comList",null,rowBounds);
	}
	
	
	/**
	 * [커뮤니티] - 키워드 검색 결과 list count
	 * @author seong
	 */
	
	public int comSearchListCount(SqlSessionTemplate sqlSession,HashMap<String,String>map) {
		return sqlSession.selectOne("boardMapper.comSearchListCount",map);
	}
	
	/**
	 * [커뮤니티] - 키워드 검색 결과 조회 
	 * @author seong
	 */
	
	public ArrayList<Board> comSearchList(SqlSessionTemplate sqlSession,PageInfo pi,HashMap<String,String>map){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.comSearchList",map,rowBounds);
	}
	
	/**
	 * [커뮤니티] - 카테고리별 게시글 list count
	 * @author seong
	 */
	
	public int comOrderByListCount(SqlSessionTemplate sqlSession,String condition) {
		return sqlSession.selectOne("boardMapper.comOrderByListCount",condition);
	}
	
	
	
	/**
	 * [커뮤니티] 전체 | 일상 | 스터디 모집 | 카테고리별 조회
	 * @author seong
	 */
	public ArrayList<Board> comOrderByCategory(SqlSessionTemplate sqlSession,PageInfo pi,String condition){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.comOrderByCategory",condition,rowBounds);
	}
	
	/**
	 * [커뮤니티]최신 | 조회수 | 댓글수 기준으로 조회
	 * @author seong
	 */
	public ArrayList<Board> comOrderByCount(SqlSessionTemplate sqlSession,PageInfo pi,String condition){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.comOrderByCount",condition,rowBounds);
	}

}
