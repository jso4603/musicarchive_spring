package com.music.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.music.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Resource
	private SqlSession sqlSession;

	// 댓글 추가
	@Override
	public int insert(ReplyDTO replyDTO) throws Exception {
		return sqlSession.insert("replyMapper.insert",replyDTO);
	}

	// 댓글 수정
	@Override
	public int update(ReplyDTO replyDTO) throws Exception {
		return sqlSession.update("replyMapper.update",replyDTO);
	}

	// 댓글 삭제
	@Override
	public int delete(int reply_id) throws Exception {
		return sqlSession.delete("replyMapper.delete",reply_id);
	}

	// 댓글 조회
	@Override
	public List<ReplyDTO> selectList(int board_id) throws Exception {
		return sqlSession.selectList("replyMapper.selectList",board_id);
	}

	// 게시글ID로 댓글 삭제
	@Override
	public void delete_board_id(int board_id) throws Exception {
		sqlSession.delete("replyMapper.delete_board_id",board_id);
	}
}
