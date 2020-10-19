package com.music.dao;

import java.util.List;

import com.music.dto.TrackDTO;

public interface TrackDAO {
	
	// 트랙리스트 정보 추가
	public void insert(TrackDTO trackDTO) throws Exception;
	
	// 트랙정보 삭제
	public void delete(int album_id) throws Exception;
	
	// 트랙정보 리스트 조회
	public List<TrackDTO> selectList(int album_id) throws Exception;
	
	// 앨범ID와 트랙ID를 이용하여 트랙정보 조회
	public TrackDTO selectOne(int album_id, int track_id) throws Exception;

}
