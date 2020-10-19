package com.music.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.music.dto.BoardDTO;
import com.music.dto.PageDTO;

public interface BoardService {
	
	// 게시글 전체조회
	public List<BoardDTO> selectList(PageDTO pageDTO) throws Exception;
	
	// 게시글 상세조회
	public Map<String, Object> selectOne(int board_id) throws Exception;
	
	// 게시글 추가
	public void insert(BoardDTO boardDTO, List<MultipartFile> boardFiles) throws Exception;
	
	// 게시글 수정
	public void update(BoardDTO boardDTO, List<Integer> fileNumList,List<MultipartFile> boardFiles) throws Exception;
	
	// 게시글 삭제
	public void delete(int board_id) throws Exception;
	
	// 게시글 조회수 +1
	public int readcnt_update(int board_id) throws Exception;
	
	// 게시글 댓글수 +1
	public int replycntUp_update(int board_id) throws Exception;
	
	// 게시글 댓글수 -1
	public int replycntDown_update(int board_id) throws Exception;
	
}
