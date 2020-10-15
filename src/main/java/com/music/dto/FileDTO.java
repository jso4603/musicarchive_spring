package com.music.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileDTO {
	private int board_id; // 게시글ID(FK)
	private int file_id; // 파일ID(PK)
	private String file_name; // 파일 이름
	private Date insert_time; // 등록일자
	private Date update_time; // 수정일자
	private Date delete_time; // 삭제일자
}
