package com.music.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.dao.BoardDAO;
import com.music.dao.ReplyDAO;
import com.music.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Resource
	private ReplyDAO replyDAO;
	
	@Resource
	private BoardDAO boardDAO;

	// 댓글 추가
	@Transactional
	@Override
	public int insert(ReplyDTO replyDTO) throws Exception {
		// 댓글이 추가될 때 게시판의 댓글 수 +1 
		boardDAO.replycntUp_update(replyDTO.getBoard_id());
		
		return replyDAO.insert(replyDTO);
	}

	// 댓글 수정
	@Override
	public int update(ReplyDTO replyDTO) throws Exception {
		return replyDAO.update(replyDTO);
	}

	// 댓글 삭제
	@Transactional
	@Override
	public int delete(int reply_id, int board_id) throws Exception {
		// 댓글이 삭제될때 게시판의 댓글수 -1
		boardDAO.replycntDown_update(board_id);
		
		return replyDAO.delete(reply_id);
	}

	// 댓글 조회
	@Override
	public List<ReplyDTO> selectList(int board_id) throws Exception {
		return replyDAO.selectList(board_id);
	}

	// 게시글ID로 댓글 삭제
	@Override
	public void delete_board_id(int board_id) throws Exception {
		replyDAO.delete_board_id(board_id);
	}

}
