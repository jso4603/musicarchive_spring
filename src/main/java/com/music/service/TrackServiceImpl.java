package com.music.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.Normalizer;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.music.dao.TrackDAO;
import com.music.dto.TrackDTO;

@Service
public class TrackServiceImpl implements TrackService {
	
	// root-context.xml에 파일 저장 디렉토리 빈
	@Resource(name="saveTrackDir")
	String saveTrackDir;
	
	@Resource
	private TrackDAO trackDAO;
	
	
	// 트랙파일을 저장하고 파일명을 리턴
	@Override
	public String trackFileUpload(MultipartFile track_file) throws Exception {
		// 파일 이름
		String file_name = null;
		
		try {
			// 파일 한글이 깨지는 현상 방지
			file_name = Normalizer.normalize(track_file.getOriginalFilename(), Normalizer.Form.NFC);
			// 파일이름이 겹치지 않게 생성
			file_name = System.currentTimeMillis() + file_name;
			File f = new File(saveTrackDir,file_name); // 저장할 파일 생성
			track_file.transferTo(f); // f 의 경로에 파일 저장
		} catch (IllegalStateException e) {
			file_name = null;	
			e.printStackTrace();
		} catch (IOException e) {
			file_name = null;
			e.printStackTrace();
		} 	
		return file_name;
		}

	// 트랙정보 리스트와 파일 추가
	@Transactional
	@Override
	public void insert(List<TrackDTO> trackList, List<MultipartFile> trackFiles) throws Exception {
		
		// 트랙정보 리스트 추가
		for (int i=0;i<trackList.size();i++) {
			
			// 트랙파일 저장
			MultipartFile track_file = trackFiles.get(i);
			String file_name = trackFileUpload(track_file);

			// trackDTO에 파일명 저장
			TrackDTO trackDTO = trackList.get(i);
			trackDTO.setFile_name(file_name);
			
			// 트랙 정보 저장
			trackDAO.insert(trackDTO);
			
		}
	}

	// 트랙정보 삭제
	@Override
	public void delete(int album_id) throws Exception {
		trackDAO.delete(album_id);
	}

	// 트랙정보 리스트 조회
	@Override
	public List<TrackDTO> selectList(int album_id) throws Exception {
		return trackDAO.selectList(album_id);
	}

	// 앨범ID와 트랙ID를 이용하여 트랙정보 조회
	@Override
	public TrackDTO selectOne(int album_id, int track_id) throws Exception {
		return trackDAO.selectOne(album_id,track_id);
	}
}
