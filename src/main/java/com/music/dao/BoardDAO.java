package com.music.dao;

import java.util.List;

import com.music.dto.BoardDTO;
import com.music.dto.PageDTO;

public interface BoardDAO {
	
	// 게시글 전체건수
	public int totalCount(PageDTO pageDTO) throws Exception;
	
	// 게시글 전체조회
	public List<BoardDTO> selectList(PageDTO pageDTO) throws Exception;
	
	// 게시글 상세조회
	public BoardDTO selectOne(int board_id) throws Exception;
	
	// 게시글 추가
	public int insert(BoardDTO boardDTO) throws Exception;
	
	// 게시글 수정
	public int update(BoardDTO boardDTO) throws Exception;
	
	// 게시글 삭제
	public void delete(int board_id) throws Exception;
	
	// 게시글 조회수 +1
	public int readcnt_update(int board_id) throws Exception;
	
	// 게시글 댓글수 +1
	public int replycntUp_update(int board_id) throws Exception;
	
	// 게시글 댓글수 -1
	public int replycntDown_update(int board_id) throws Exception;
	
}

