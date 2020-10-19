package com.music.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	
	private int board_id; // 게시글ID(PK)
	private String writer; // 작성자
	private String title; // 제목
	private String content; // 내용
	private int read_cnt; // 조회수
	private int reply_cnt; // 댓글수
	private Date insert_time; // 등록일자
	private Date update_time; // 수정일자
	private Date delete_time; // 삭제일자
	
}