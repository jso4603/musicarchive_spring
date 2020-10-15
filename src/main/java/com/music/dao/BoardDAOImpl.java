package com.music.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.music.dto.BoardDTO;
import com.music.dto.PageDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Resource
	private SqlSession sqlSession; 
	
	// 게시글 전체건수
	@Override
	public int totalCount(PageDTO pageDTO) throws Exception {
		return sqlSession.selectOne("boardMapper.totCount", pageDTO);
	}
	// 게시글 전체조회
	@Override
	public List<BoardDTO> selectList(PageDTO pageDTO) throws Exception {
		return sqlSession.selectList("boardMapper.selectList", pageDTO);
	}
	// 게시글 상세조회
	@Override
	public BoardDTO selectOne(int board_id) throws Exception {
		return sqlSession.selectOne("boardMapper.selectOne", board_id);
	}
	// 게시글 추가
	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert("boardMapper.insert",boardDTO);
	}
	// 게시글 수정
	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return sqlSession.update("boardMapper.update",boardDTO);
	}
	// 게시글 삭제
	@Override
	public void delete(int board_id) throws Exception {
		sqlSession.update("boardMapper.delete",board_id);
	}
	// 게시글 조회수 +1
	@Override
	public int readcnt_update(int board_id) throws Exception {
		return sqlSession.update("boardMapper.readcnt_update", board_id);
	}
	// 게시글 댓글수 +1
	@Override
	public int replycntUp_update(int board_id) throws Exception {
		return sqlSession.update("boardMapper.replycntUp_update", board_id);
	}
	// 게시글 댓글수 -1
	@Override
	public int replycntDown_update(int board_id) throws Exception {
		return sqlSession.update("boardMapper.replycntDown_update", board_id);
	}
}
