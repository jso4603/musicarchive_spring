package com.music.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	private String user_id; // 아이디(PK)
	private String password; // 비밀번호
	private String zip_code; // 우편번호
	private String address; // 주소
	private String address_detail; // 상세주소
	private Date insert_time; // 등록일자
	private Date update_time; // 수정일자
}
