package com.music.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.music.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {
	
	@Resource
	private FileService fileService;
	
	// 자유게시판 파일 다운로드
	@RequestMapping("/download")
	public void fileDownload(String file_name, HttpServletResponse response) throws Exception {
		fileService.fileDownload(file_name, response);
	}
}
