package com.music.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.music.dto.TrackDTO;

public interface TrackService {
	// 트랙파일을 저장하고 파일명을 리턴
	String trackFileUpload(MultipartFile track_file) throws Exception;
	// 트랙정보 리스트와 파일 추가
	public void insert(List<TrackDTO> trackList, List<MultipartFile> trackFiles) throws Exception;
	// 트랙정보 삭제
	public void delete(int album_id) throws Exception;
	// 트랙정보 리스트 조회
	public List<TrackDTO> selectList(int album_id) throws Exception;
	// 앨범ID와 트랙ID를 이용하여 트랙정보 조회
	public TrackDTO selectOne(int album_id, int track_id) throws Exception;
}
