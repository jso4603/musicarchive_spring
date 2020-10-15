package com.music.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.music.dto.AlbumDTO;

public interface AlbumService {
	// 앨범 전체조회
	public List<AlbumDTO> selectList() throws Exception;
	// 앨범 상세조회
	public AlbumDTO selectOne(int album_id) throws Exception;
	// 앨범 추가
	public void insert(AlbumDTO albumDTO,MultipartFile artwork_file) throws Exception;
	// 앨범 삭제
	public void delete(int album_id) throws Exception;
	// 앨범 아트워크 저장하고 파일명을 리턴
	String albumUpload(MultipartFile artwork_file) throws Exception;
}
