package com.music.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.music.dto.FileDTO;

public interface FileService {
	
	// 다중파일 저장하고 파일명을 리턴
	public List<String> fileUpload(List<MultipartFile> files) throws Exception;
	
	// 파일명 리스트를 입력받아 파일명 저장
	public void insert(int board_id, List<String> filenameList) throws Exception;
	
	// 파일 조회
	public List<FileDTO> selectList(int board_id) throws Exception;
	
	// 파일 삭제
	public void delete(int board_id) throws Exception;
	
	// 수정시 일부 파일 삭제
	public void delete_part(int board_id, List<Integer> files_id_list) throws Exception;
	
	// 파일 다운로드
	public void fileDownload(String file_name, HttpServletResponse response) throws Exception;
	
}
