package com.music.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.music.dao.AlbumDAO;
import com.music.dto.AlbumDTO;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Resource
	private AlbumDAO albumDAO;

	@Resource
	private TrackService trackService;
	
	@Resource(name="saveAlbumDir")
	String saveAlbumDir;
	
	// 앨범 아트워크 저장하고 파일명을 리턴
	@Override
	public String albumUpload(MultipartFile artwork_file) throws Exception {
		// 파일 이름
		String artwork_name = null;
		
		try {
			// 파일이름이 겹치지 않게 생성
			artwork_name = System.currentTimeMillis() + artwork_file.getOriginalFilename();
			File f = new File(saveAlbumDir,artwork_name); // 저장할 파일 생성
			artwork_file.transferTo(f); // f 의 경로에 파일 저장
		} catch (IllegalStateException e) {
			artwork_name = null;	
			e.printStackTrace();
		} catch (IOException e) {
			artwork_name = null;
			e.printStackTrace();
		} 	
		return artwork_name;
	}

	// 앨범 전체조회
	@Override
	public List<AlbumDTO> selectList() throws Exception {
		return albumDAO.selectList();
	}

	// 앨범 상세조회
	@Override
	public AlbumDTO selectOne(int album_id) throws Exception {
		return albumDAO.selectOne(album_id);
	}

	// 앨범 추가
	@Transactional
	@Override
	public void insert(AlbumDTO albumDTO, MultipartFile artwork_file) throws Exception {

		// 파일 업로드하고 아트워크 파일명 받아오기
		String artwork_name = albumUpload(artwork_file);

		// 파일명 DTO에 세팅
		albumDTO.setArtwork_name(artwork_name);

		// DTO 정보로 앨범 추가
		albumDAO.insert(albumDTO);
	}

	// 앨범 삭제
	@Transactional
	@Override
	public void delete(int album_id) throws Exception {
		// 주의 : 자식테이블 삭제후 부모테이블 삭제(foreign key관계)
		// 트랙 정보 삭제
		trackService.delete(album_id);

		// 앨범 정보 삭제
		albumDAO.delete(album_id);
	}
}
