package com.music.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	
	private int cur_page = 1; // 현재페이지
	private int per_page = 10; // 한페이지당 게시물수
	private int per_block = 5; // 한화면의 페이지수
	private int tot_page; // 전체페이지수
	private int start_no; // 시작번호
	private int end_no; // 끝번호
	private int start_page; // 시작페이지
	private int end_page;   // 끝번호
	private String find_key;  // 검색키
	private String find_value; // 검색값
	
}
