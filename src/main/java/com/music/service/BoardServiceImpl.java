package com.music.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.music.dao.BoardDAO;
import com.music.dto.BoardDTO;
import com.music.dto.PageDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource
	private BoardDAO boardDAO;
	
	@Resource
	private FileService fileService;
	
	@Resource
	private ReplyService replyService;
	
	// 게시글 전체조회
	@Transactional
	@Override
	public List<BoardDTO> selectList(PageDTO pageDTO) throws Exception {
		
		// PageDTO 구하기
		
		// 전체게시물수
		int totCnt = boardDAO.totalCount(pageDTO);
		
		// 전체페이지수
		int totPage = totCnt / pageDTO.getPer_page();
		if ((totCnt % pageDTO.getPer_page()) != 0 ) totPage = totPage + 1;
			
		pageDTO.setTot_page(totPage);
		
		// 현재페이지
		int curPage = pageDTO.getCur_page();
		
		// 시작번호(mysql에서 0번부터 시작)
		int startNo = (curPage-1) * pageDTO.getPer_page();
		pageDTO.setStart_no(startNo);
		
		// 끝번호
		int endNo = startNo + pageDTO.getPer_page() -1;
		pageDTO.setEnd_no(endNo);
		
		// 시작페이지
		int startPage = curPage - ((curPage-1) % pageDTO.getPer_block());
		pageDTO.setStart_page(startPage);
		
		// 끝페이지
		int endPage = startPage + pageDTO.getPer_block()-1;
		if (endPage > totPage) endPage = totPage;
		pageDTO.setEnd_page(endPage);
		
		// 전체조회
		return boardDAO.selectList(pageDTO);
	}
	
	// 게시글 상세조회
	@Transactional
	@Override
	public Map<String, Object> selectOne(int board_id) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		// 게시물 한건조회
		map.put("board", boardDAO.selectOne(board_id));
		
		//파일 리스트 조회
		map.put("file_list",fileService.selectList(board_id));
		
		return map;
	}
	
	// 게시글 추가
	@Transactional
	@Override
	public void insert(BoardDTO boardDTO, List<MultipartFile> boardFiles) throws Exception {
		
		// 게시물 추가
		boardDAO.insert(boardDTO);
		int board_id = boardDTO.getBoard_id();
		
		// 파일 저장
		List<String> filenameList = fileService.fileUpload(boardFiles);
		
		// 파일 추가
		fileService.insert(board_id, filenameList);
	}
	
	// 게시글 수정
	@Transactional
	@Override
	public void update(BoardDTO boardDTO, List<Integer> fileIdList, List<MultipartFile> boardFiles) throws Exception {
		
		// 게시물 수정
		boardDAO.update(boardDTO);
		int board_id = boardDTO.getBoard_id();
		
		// 파일 삭제
		fileService.delete_part(board_id,fileIdList);
	
		// 파일 저장
		List<String> filenameList = fileService.fileUpload(boardFiles);
		
		// 파일 추가
		fileService.insert(board_id, filenameList);
	}
	
	// 게시글 삭제
	@Override
	public void delete(int board_id) throws Exception {
		// 게시물 삭제
		boardDAO.delete(board_id);
	}
	
	// 게시글 조회수 +1
	@Override
	public int readcnt_update(int board_id) throws Exception {
		return boardDAO.readcnt_update(board_id);
	}
	
	// 게시글 댓글수 +1
	@Override
	public int replycntUp_update(int board_id) throws Exception {
		return boardDAO.replycntUp_update(board_id);
	}
	
	// 게시글 댓글수 -1
	@Override
	public int replycntDown_update(int board_id) throws Exception {
		return boardDAO.replycntDown_update(board_id);
	}
}
