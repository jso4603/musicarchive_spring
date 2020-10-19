package com.music.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.music.dao.MemberDAO;
import com.music.dto.MemberDTO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	@Resource
	private MemberDAO memberDAO;

	// 로그인
	@Override
	public Map<String, Object> loginCheck(String user_id, String password) throws Exception {
		
		String msg = null;
		
		//result : 0(로그인성공),1(아이디미존재),2(패스워드불일치)
		int result = -1;
		
		MemberDTO memberDTO = memberDAO.selectOne(user_id);		

		if(memberDTO == null) {
			msg = "존재하지 않는 아이디입니다.";
			result = 1;	
		}else {
			if(passwordEncoder.matches(password, memberDTO.getPassword())){
				msg = "로그인 성공하였습니다.";
				result = 0;
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
				result = 2;
			}
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("msg", msg);
		map.put("result", result);
		
		return map;	
	}
}
