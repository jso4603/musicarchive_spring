package com.music.archive;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.CollectionUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.music.dao.BoardDAO;
import com.music.dao.FileDAO;
import com.music.dto.BoardDTO;
import com.music.dto.FileDTO;
import com.music.dto.PageDTO;
import com.music.service.FileService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DAOTests {
	
	@Resource
	private BoardDAO boardDAO;
	
	@Resource
	private FileDAO fileDAO;
	
	@Resource 
	FileService fileService;
	
	// 게시글 추가 테스트
	@Test
	public void testOfInsert() throws Exception {
		BoardDTO params = new BoardDTO();
		params.setWriter("1번 게시글 작성자");
		params.setTitle("1번 게시글 제목");
		params.setContent("1번 게시글 내용");
		
		int result = boardDAO.insert(params);
		System.out.println("결과는"+result+"입니다.");
	}
	
	// 게시글 상세조회 테스트 
	@Test
	public void testOfSelectDetail() throws Exception {
		BoardDTO board = boardDAO.selectOne(2);
		String boardJson = new ObjectMapper().writeValueAsString(board);
		System.out.println(boardJson);
	}
	
	// 게시글 수정 테스트
	@Test
	public void testOfUpdate() throws Exception {
		BoardDTO params = new BoardDTO();
		params.setWriter("테스터 수정");
		params.setTitle("1번 게시글 제목을 수정합니다.");
		params.setContent("1번 게시글 내용을 수정합니다.");
		params.setBoard_id(1);

		int result = boardDAO.update(params);
		if(result == 1) {
			BoardDTO board = boardDAO.selectOne(1);

			String boardJson = new ObjectMapper().writeValueAsString(board);
			
			System.out.println(boardJson);

		}
	}
	
	// 게시글 삭제 테스트
	@Test
	public void testOfDelete() throws Exception {
		boardDAO.delete(1);

		BoardDTO board = boardDAO.selectOne(1);
		String boardJson = new ObjectMapper().writeValueAsString(board);
		
		System.out.println(boardJson);
		
	}
	
	// 게시글 전체조회를 위해 게시글 여러 건 삽입
	@Test
	public void testMultipleInsert() throws Exception {
		for(int i=1;i<=100;i++) {
			BoardDTO params = new BoardDTO();
			params.setWriter("관리자");
			params.setTitle(i+"번 째 제목");
			params.setContent("관리자가 페이징처리 테스트를 위해 임시로 만든 게시글입니다.\n "
					+ "여러분의 게시글을 게시판에 남겨주세요. \n"
					+ "감사합니다!");
			boardDAO.insert(params);
		}
	}
		
	// 게시글 전체 조회
	@Test
	public void testOfSelectList() throws Exception {
		PageDTO pageDTO = new PageDTO();
		String pageJson = new ObjectMapper().writeValueAsString(pageDTO);
		System.out.println("=========================");
		System.out.println(pageJson);
		System.out.println("=========================");
		
		int boardTotalCount = boardDAO.totalCount(pageDTO);
		System.out.println("=========================");
		System.out.println("총 게시물 수 : "+boardTotalCount);
		System.out.println("=========================");
		
		List<BoardDTO> boardList = boardDAO.selectList(pageDTO);
		if(CollectionUtils.isEmpty(boardList) == false) {
			for(BoardDTO board : boardList) {
				System.out.println("=========================");
				System.out.println(board.getWriter());
				System.out.println(board.getTitle());
				System.out.println(board.getContent());
				System.out.println("=========================");
			}
		}
	}
	
	// 파일 추가
	@Test
	public void testOfFileInsert() throws Exception {
		FileDTO params = new FileDTO();
		params.setBoard_id(1);
		params.setFile_name("2번파일.jpg");
		
		fileDAO.insert(params);
	}
	// 파일 수정
	@Test
	public void testOfFileUpdate() throws Exception {
		FileDTO params = new FileDTO();
		params.setFile_id(1);
		params.setFile_name("1번파일수정.jpg");
		
		int result = fileDAO.update(params);
		System.out.println("결과는"+result+"입니다.");
	}
	// 파일 삭제
	@Test
	public void testOfFileDelete() throws Exception{
		fileDAO.delete(1);
	}
	// 파일 조회
	@Test
	public void testOfFileSelectList() throws Exception {
		List<FileDTO> list = fileDAO.selectList(1);
		System.out.println(list);
	}
	
	@Test
	public void test() throws Exception {
		List<String> list = new ArrayList<String>();
		list.add("1.jpg");
		list.add("2.jpg");
		fileService.insert(4, list);
	}
}
