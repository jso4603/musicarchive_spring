package com.music.dao;

import java.util.List;

import com.music.dto.FileDTO;

public interface FileDAO {
	
	// 파일 조회
	public List<FileDTO> selectList(int board_id) throws Exception;
	
	// 파일 추가
	public void insert(FileDTO fileDTO) throws Exception;
	
	// 파일 수정
	public int update(FileDTO fileDTO) throws Exception;
	
	// 파일 삭제
	public void delete(int board_id) throws Exception;
	
	// 수정 시 일부 파일 삭제
	public void delete_part(int board_id, String files_id) throws Exception;
	
}
