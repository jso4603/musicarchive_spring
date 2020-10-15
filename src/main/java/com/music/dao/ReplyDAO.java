package com.music.dao;

import java.util.List;

import com.music.dto.ReplyDTO;

public interface ReplyDAO {
	// 댓글 추가
	public int insert(ReplyDTO replyDTO) throws Exception;
	// 댓글 수정
	public int update(ReplyDTO replyDTO) throws Exception;
	// 댓글 삭제
	public int delete(int reply_id) throws Exception;
	// 댓글 조회
	public List<ReplyDTO> selectList(int board_id) throws Exception;
	// 게시글ID로 댓글 삭제
	public void delete_board_id(int board_id) throws Exception;
}
