package com.music.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter
@Setter
@ToString
public class ReplyDTO {
	private int board_id; // 게시글ID(FK)
	private int reply_id; // 댓글ID(PK)
	private String writer; // 작성자
	private String content; // 내용
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul") // 포맷형식지
	private Date insert_time; // 등록일자
}
