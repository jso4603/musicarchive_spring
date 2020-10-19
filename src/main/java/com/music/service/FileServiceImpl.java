package com.music.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.music.dao.FileDAO;
import com.music.dto.FileDTO;

@Service
public class FileServiceImpl implements FileService {

	// root-context.xml에 파일 저장 디렉토리 빈
	@Resource(name="saveDir")
	String saveDir;
	
	@Resource
	private FileDAO fileDAO;

	// 다중 파일 업로드하고 파일이름 리스트 반환
	@Override
	public List<String> fileUpload(List<MultipartFile> boardFiles) throws Exception {
		
		List<String> list = new ArrayList<>();
		
		for(MultipartFile multipartFile: boardFiles) {
			
			// 파일이름 생성
			if (multipartFile.getOriginalFilename() != "") { // 파일명이 존재할때만 반복
				
				// 파일 한글이 깨지는 현상 방지
				String file_name = Normalizer.normalize(multipartFile.getOriginalFilename(), Normalizer.Form.NFC);
				
				// 파일이름이 겹치지 않게 생성
				file_name = System.currentTimeMillis() + file_name;
				
				// 현재시간과 파일이름 합쳐서 저장
				// 전송할 파일경로와 이름 생성
				File f = new File(saveDir, file_name);
				try {
					multipartFile.transferTo(f);
					list.add(file_name); //파일이름 추가
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	// 파일명 리스트를 입력받아 파일명 저장
	@Override
	public void insert(int board_id, List<String> filenameList) throws Exception {
		
		for(String file_name : filenameList) {
			
			FileDTO fileDTO = new FileDTO();
			
			fileDTO.setBoard_id(board_id);
			fileDTO.setFile_name(file_name);
			
			fileDAO.insert(fileDTO);
		}
	}

	// 파일 조회
	@Override
	public List<FileDTO> selectList(int board_id) throws Exception {
		return fileDAO.selectList(board_id);
	}

	// 파일 삭제
	@Override
	public void delete(int board_id) throws Exception {
		fileDAO.delete(board_id);
	}

	// 수정시 일부 파일 삭제
	@Override
	public void delete_part(int board_id, List<Integer> files_id_list) throws Exception {
		
		String files_id = "";
		
		// null처리
		if (files_id_list != null) {
			files_id = files_id_list.toString().replace("[", "").replace("]", "");
		}
		
		fileDAO.delete_part(board_id, files_id);
	}

	// 파일 다운로드
	@Override
	public void fileDownload(String file_name, HttpServletResponse response) throws Exception {
		
		String fileUrl = saveDir + "/" +file_name;

		try {
			// 파일 읽기 스트림 생성
			FileInputStream fis = new FileInputStream(fileUrl);
			
			// 한글파일이름 인코딩
			file_name = URLEncoder.encode(file_name, "utf-8");
			// filename = new String(filename.getBytes("utf-8"), "iso-8859-1");
			
			// 응답객체의 헤더설정 변경
			// 첨부파일 형태로 변경
			// 파일이름 지정
			response.setHeader("Content-Disposition", "attachment;filename="+file_name);
			
			
			// 파일 내보내기 스트림  생성
			OutputStream out = response.getOutputStream();
			
			// inputstream에서 데이타를 읽어서 outputstream으로 내보냄
			FileCopyUtils.copy(fis, out);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
