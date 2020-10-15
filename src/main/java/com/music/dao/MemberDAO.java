package com.music.dao;

import com.music.dto.MemberDTO;

public interface MemberDAO {
	// 회원 한 건 조회
	public MemberDTO selectOne(String user_id) throws Exception;
	// 회원 가입
	public void insert(MemberDTO memberDTO) throws Exception;
	// 회원정보 수정
	public void update(MemberDTO memberDTO) throws Exception;
	// 비밀번호 변경
	public void changePW(MemberDTO memberDTO) throws Exception;
	// 회원 탈퇴
	public void delete(String user_id) throws Exception;
}
