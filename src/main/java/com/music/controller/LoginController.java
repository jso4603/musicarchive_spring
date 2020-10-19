package com.music.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.music.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Resource
	private LoginService loginService;
	
	// 로그인 폼으로 이동
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login() throws Exception {
		
		return "login/login";
	}
	
	// 로그인
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String login(String user_id, String password, RedirectAttributes redirectAttributes, HttpSession httpSession) throws Exception {

		Map<String, Object> map = loginService.loginCheck(user_id,password);
		
		redirectAttributes.addFlashAttribute("msg",map.get("msg"));
		redirectAttributes.addFlashAttribute("user_id",user_id);

		// 로그인 성공한 경우
		if((int)map.get("result") == 0) {
			
			httpSession.setAttribute("user_id", user_id);
			
			// 세션 유지시간 2시간
			httpSession.setMaxInactiveInterval(60*60*2);
			
			return "redirect:/main/main";
		} 
		
		// 로그인 실패
		return "redirect:/login/";
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(SessionStatus status,HttpSession httpSession,RedirectAttributes redirectAttributes) throws Exception {
		
		//세션을 지운다
		status.setComplete();
		
		httpSession.invalidate();
		
		String msg = "로그아웃 되었습니다.";
		redirectAttributes.addFlashAttribute("msg",msg);
		
		return "redirect:/main/main";
	}
}
