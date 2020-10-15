package com.music.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/studio")
public class StudioController {

	// 스튜디오 위치 화면 이동
	@RequestMapping(value="/location", method = RequestMethod.GET)
	public String studio() throws Exception {
		return "/studio/location";
	}
}
