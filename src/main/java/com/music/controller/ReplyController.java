package com.music.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.music.dto.ReplyDTO;
import com.music.service.ReplyService;


// Controller + ResponseBody 의 기능
@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Resource
	private ReplyService replyService;
	
	// 댓글 추가
	// @RequestBody : json형태로 값 받음
	// produces="application/text; charset=utf-8" : 반환값 문자 한글처리
	@RequestMapping(value="/", method = RequestMethod.POST, produces="application/text; charset=utf-8")
	public ResponseEntity<String> replyInsert(@RequestBody ReplyDTO replyDTO) throws Exception {
		replyService.insert(replyDTO);
		//응답객체를 생성해서 상태값 같이 전송
		return new ResponseEntity<>("댓글이 작성되었습니다.", HttpStatus.OK);
		//return new ResponseEntity<>("실패", HttpStatus.BAD_REQUEST);
	}
	
	// 댓글 전체조회
	@RequestMapping(value="/{board_id}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyDTO>> replyList(@PathVariable("board_id") int board_id) throws Exception {
		List<ReplyDTO> list = replyService.selectList(board_id);
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 댓글 삭제
	@RequestMapping(value="/{reply_id}", method = RequestMethod.DELETE, produces="application/text; charset=utf-8")
	public ResponseEntity<String> replyDelete(@PathVariable("reply_id") int reply_id,int board_id) throws Exception {
		replyService.delete(reply_id, board_id);
		//응답객체를 생성해서 상태값 같이 전송
		return new ResponseEntity<>("댓글이 삭제되었습니다.", HttpStatus.OK);
	}
	
	// 댓글 수정
	@RequestMapping(value="/{reply_id}", method = {RequestMethod.PUT,RequestMethod.PATCH},  
			produces="application/text; charset=utf-8")
	public ResponseEntity<String> replyUpdate(@PathVariable("reply_id") int reply_id,@RequestBody ReplyDTO replyDTO) throws Exception {
		replyDTO.setReply_id(reply_id); //댓글번호 세팅
		replyService.update(replyDTO);
		//응답객체를 생성해서 상태값 같이 전송
		return new ResponseEntity<>("댓글이 수정되었습니다.", HttpStatus.OK);
	}
}