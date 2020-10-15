package com.music.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.music.dto.BoardDTO;
import com.music.dto.PageDTO;
import com.music.service.BoardService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Resource
	private BoardService boardService;
	
	// 자유게시판 메인으로 이동(게시판 전체조회)
	@RequestMapping("/main")
	public String communityMain(@ModelAttribute("pageDTO")PageDTO pageDTO,Model model) throws Exception {
		List<BoardDTO> boardList = boardService.selectList(pageDTO);
		model.addAttribute("boardList", boardList);
		return "community/main";
	}
	
	// 게시물 작성 폼으로 이동
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public void communityAdd() throws Exception {}
	
	// 게시물 작성
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public String communityAdd(BoardDTO boardDTO, List<MultipartFile> boardFiles
			,RedirectAttributes redirectAttributes) throws Exception {
		boardService.insert(boardDTO, boardFiles);
		redirectAttributes.addFlashAttribute("msg", "게시물이 작성되었습니다.");
		return "redirect:/community/main";		
	}
	
	// 게시물 상세조회 후 상세정보 페이지로 이동
	@Transactional
	@RequestMapping("/detail")
	public void communityDetail(int board_id, Model model) throws Exception {
		//조회수 +1
		boardService.readcnt_update(board_id);

		Map<String, Object> resultMap = boardService.selectOne(board_id);
		model.addAttribute("board", resultMap.get("board"));
		model.addAttribute("file_list", resultMap.get("file_list"));
	}
	
	// 게시물 삭제
	@RequestMapping("/delete")
	public String communityDelete(int board_id, Model model, RedirectAttributes redirectAttributes) throws Exception {
		boardService.delete(board_id);
		redirectAttributes.addFlashAttribute("msg", "게시물이 삭제되었습니다.");
		return "redirect:/community/main";
	}
	
	// 상세정보 가지고 수정폼으로 이동
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void communityModify(int board_id, Model model) throws Exception {
		Map<String, Object> resultMap = boardService.selectOne(board_id);
		model.addAttribute("board", resultMap.get("board"));
		model.addAttribute("file_list", resultMap.get("file_list"));
	}
	
	// 게시물 수정
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String communityModify(BoardDTO bdto,
			@RequestParam(value="file_id", required = false) List<Integer> fileIdList,
			List<MultipartFile> boardFiles,
			RedirectAttributes redirectAttributes) throws Exception {
		boardService.update(bdto,fileIdList,boardFiles);
		redirectAttributes.addFlashAttribute("msg", "게시물이 수정되었습니다.");
		redirectAttributes.addAttribute("board_id", bdto.getBoard_id());
		return "redirect:/community/main";
	}
}
