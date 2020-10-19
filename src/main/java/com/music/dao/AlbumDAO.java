package com.music.dao;

import java.util.List;

import com.music.dto.AlbumDTO;

public interface AlbumDAO {
	
	// 앨범 전체조회
	public List<AlbumDTO> selectList() throws Exception;
	
	// 앨범 상세조회
	public AlbumDTO selectOne(int album_id) throws Exception;
	
	// 앨범 추가
	public void insert(AlbumDTO albumDTO) throws Exception;
	
	// 앨범 수정
	public void update(AlbumDTO albumDTO) throws Exception;
	
	// 앨범 삭제
	public void delete(int album_id) throws Exception;
	
}
