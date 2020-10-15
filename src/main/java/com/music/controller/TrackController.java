package com.music.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
@RequestMapping("/track")
public class TrackController {
	
	@Resource
	private TrackService trackService;
	
	@Resource
	private AlbumService albumService;
	
	// 관리자모드 트랙 추가 후 메인 폼으로 이동
	@RequestMapping(value="/addTrack", method = RequestMethod.POST)
	public String albumAdminAddTrack(TrackDTO trackDTO, List<MultipartFile> trackFiles
			,RedirectAttributes redirectAttributes) throws Exception {

		List<TrackDTO> trackList = trackDTO.getTrackList();
		System.out.println("controller trackList : "+trackList);
		System.out.println("controller trackFiles : "+trackFiles);
		trackService.insert(trackList,trackFiles);
		redirectAttributes.addFlashAttribute("msg", "앨범이 추가되었습니다.");
		return "redirect:/album/admin/main";		
	}
	
	// 트랙정보 폼으로 이동
	@Transactional
	@RequestMapping(value = "/detail")
	public String trackDetail(int album_id, int track_id, Model model) throws Exception {
		
		TrackDTO trackDTO = trackService.selectOne(album_id,track_id);
		AlbumDTO albumDTO = albumService.selectOne(album_id);
		model.addAttribute("trackDTO",trackDTO);
		model.addAttribute("albumDTO",albumDTO);
	
		
		return "album/trackDetail";
	}	
}
