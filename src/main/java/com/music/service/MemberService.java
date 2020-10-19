package com.music.service;

import java.util.Map;

import com.music.dto.MemberDTO;

public interface MemberService {
	
	// 회원 가입
	public Map<String, Object> insert(MemberDTO memberDTO) throws Exception;
	
	// 회원 조회
	public MemberDTO selectOne(String user_id) throws Exception;
	
	// 비밀번호 일치여부 확인
	public boolean checkPW(String password, String insertPW) throws Exception;
	
	// 회원정보 수정
	public void update(MemberDTO memberDTO) throws Exception;
	
	// 비밀번호 변경
	public Map<String,Object> changePW(MemberDTO memberDTO, String oldPW, String newPW) throws Exception;
	
	// 회원 탈퇴
	public Map<String,Object> delete(MemberDTO memberDTO, String insertPW) throws Exception;

}
