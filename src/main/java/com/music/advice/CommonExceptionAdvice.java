package com.music.advice;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

// 컨트롤러에서 발생하는 예외를 전문적으로 처리하는 클래스
@ControllerAdvice
public class CommonExceptionAdvice {
	@ExceptionHandler
	public String common(Exception e,Model model) {
		System.out.println("예외발생");
		System.out.println(e.toString());
		e.printStackTrace();
		model.addAttribute("exception",e);
		return "error_common";
	}
}
