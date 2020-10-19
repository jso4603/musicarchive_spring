package com.music.service;

import java.util.Map;

public interface LoginService {
	
	// 로그인
	public Map<String, Object> loginCheck(String user_id, String password) throws Exception;

}
