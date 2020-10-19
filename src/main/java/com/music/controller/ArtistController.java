package com.music.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/artist")
public class ArtistController {
	
	// Artist 화면으로 이동
	@RequestMapping(value = "/discography")
	public String artistMain() {
		
		return "artist/discography";
	}
}
