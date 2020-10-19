package com.music.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.music.dto.AlbumDTO;
import com.music.dto.TrackDTO;
import com.music.service.AlbumService;
import com.music.service.TrackService;

@Controller
@RequestMapping("/album")
public class AlbumController {
	
	@Resource
	private AlbumService albumSerivce;
	
	@Resource
	private TrackService trackService;
	
	// Album 화면으로 이동
	@RequestMapping(value = "/main")
	public String albumMain(Model model) throws Exception {
		
		List<AlbumDTO> album_list = albumSerivce.selectList();
		
		model.addAttribute("album_list",album_list);
		
		return "album/main";
	}
	
	// Album 상세정보 화면으로 이동
	@Transactional
	@RequestMapping(value = "/detail")
	public void albumDetail(int album_id,Model model) throws Exception {
		
		// 앨범 정보 가져오기
		AlbumDTO albumDTO = albumSerivce.selectOne(album_id);
		
		// 트랙 정보 가져오기
		List<TrackDTO> trackList = trackService.selectList(album_id);
		
		model.addAttribute("albumDTO",albumDTO);
		model.addAttribute("trackList",trackList);
	}
	
	// 관리자모드 메인화면으로 이동
	@RequestMapping(value = "/admin/main")
	public void AdminMain(Model model) throws Exception {
		
		List<AlbumDTO> album_list = albumSerivce.selectList();
		
		model.addAttribute("album_list",album_list);
	}
	
	// 관리자모드 앨범추가 폼으로 이동
	@Transactional
	@RequestMapping(value = "/admin/addAlbum",method = RequestMethod.GET)
	public void AdminAddAlbum() throws Exception {}
	
	// 관리자모드 앨범추가 후 추가 된 앨범정보 가지고 트랙추가 폼으로 이동
	@RequestMapping(value = "/admin/addAlbum",method = RequestMethod.POST)
	public String AdminAddAlbum(AlbumDTO albumDTO, MultipartFile artwork_file
			, Model model) throws Exception {
		
		// 앨범정보 추가
		albumSerivce.insert(albumDTO, artwork_file);
		
		// 추가 된 앨범정보 albumDTO에 저장
		albumDTO = albumSerivce.selectOne(albumDTO.getAlbum_id());
		
		model.addAttribute("albumDTO",albumDTO);
		return "album/admin/addTrack";
	}
	
	// 관리자모드 앨범삭제 후 메인 폼으로 이동
	@RequestMapping("/admin/delete")
	public String AdminDeleteAlbum(int album_id, Model model, RedirectAttributes redirectAttributes) throws Exception {
		
		albumSerivce.delete(album_id);
		
		redirectAttributes.addFlashAttribute("msg", "앨범이 삭제되었습니다.");
		
		return "redirect:/album/admin/main";
	}
	
}
