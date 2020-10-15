package com.music.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.music.dto.AlbumDTO;
import com.music.dto.PageDTO;
import com.music.service.AlbumService;

@Controller
@RequestMapping("/main")
@SessionAttributes("pageDTO")
public class MainController {
	
	@Resource
	private AlbumService albumService;
	
	// 로그아웃 메인 화면으로 이동
	@RequestMapping(value = "/logout")
	public String logoutMain(Model model) throws Exception {

		List<AlbumDTO> albumList = albumService.selectList();
		model.addAttribute("albumList",albumList);
		
		return "main/logoutMain";
	}
	
	// 로그인 메인 화면으로 이동
	@RequestMapping(value = "/login")
	public String loginMain(PageDTO pageDTO, Model model) throws Exception {
		//@SessionAttributes("pageDTO") 생성
		model.addAttribute("pageDTO", pageDTO);
		
		List<AlbumDTO> albumList = albumService.selectList();
		model.addAttribute("albumList",albumList);
		
		return "main/loginMain";
	}
}
