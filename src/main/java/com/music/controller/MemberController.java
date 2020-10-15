package com.music.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.music.dto.MemberDTO;
import com.music.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource
	private MemberService memberService;

	// 회원가입 폼으로 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void join(Model model) throws Exception {}
	
	// 회원가입 db에 저장 후 로그인 폼으로 이동
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberDTO memberDTO,RedirectAttributes redirectAttributes) throws Exception {

		Map<String, Object> resultMap = memberService.insert(memberDTO);
		
		redirectAttributes.addFlashAttribute("msg",resultMap.get("msg"));
		// 회원가입 성공
		if((int)resultMap.get("result") == 0) return "redirect:/login/";
		// 회원가입 실패
		return "redirect:/member/join";
	}
	
	// 마이페이지 폼으로 이동
	@RequestMapping(value ="/modify", method = RequestMethod.GET)
	public void modify(String user_id,Model model) throws Exception {
		MemberDTO memberDTO = memberService.selectOne(user_id);
		model.addAttribute("memberDTO",memberDTO);
	}
	
	// 회원정보 수정
	@RequestMapping(value ="/modify", method = RequestMethod.POST)
	public String modify(MemberDTO memberDTO, 
			RedirectAttributes redirectAttributes) throws Exception {
		
		memberService.update(memberDTO);
		redirectAttributes.addFlashAttribute("msg","정보수정이 완료되었습니다.");
		redirectAttributes.addAttribute("user_id",memberDTO.getUser_id());
		return "redirect:/member/modify";
	}
	
	// 비밀번호 확인화면으로 이동
	@RequestMapping(value = "/checkPW", method = RequestMethod.GET)
	public void checkPW() throws Exception {}
	
	// 비밀번호 일치여부 확인
	@RequestMapping(value = "/checkPW", method = RequestMethod.POST)
	public String checkPW(String password, String insertPW,
			RedirectAttributes redirectAttributes) throws Exception {
		
		String msg = null;

		boolean checkResult = memberService.checkPW(password,insertPW);

		if(checkResult) msg = "비밀번호 일치";
		else msg = "비밀번호 불일치";
		redirectAttributes.addFlashAttribute("msg",msg);
		
		return "redirect:/member/checkPW";
	}
	
	// 비밀번호 변경화면으로 이동
	@RequestMapping(value = "/changePW", method = RequestMethod.GET)
	public String changePW(String user_id,Model model) throws Exception {
		MemberDTO memberDTO = memberService.selectOne(user_id);
		model.addAttribute("memberDTO",memberDTO);
		return "member/changePW";
	}
	
	// 비밀번호 변경
	@RequestMapping(value = "/changePW", method = RequestMethod.POST)
	public String changePW(MemberDTO memberDTO, String oldPW, String newPW,
			RedirectAttributes redirectAttributes) throws Exception {
		Map<String, Object> resultMap = memberService.changePW(memberDTO,oldPW,newPW);

		redirectAttributes.addFlashAttribute("msg",resultMap.get("msg"));
		redirectAttributes.addAttribute("user_id",memberDTO.getUser_id());

		// 비밀번호 변경 성공
		if((int)resultMap.get("result") == 0) return "redirect:/member/modify";
		
		// 비밀번호 변경 실패
		return "redirect:/member/changePW";
	}
	
	// 삭제비밀번호 확인화면으로 이동
	@RequestMapping(value = "/delete",method = RequestMethod.GET)
	public String deletePW(String user_id,Model model) throws Exception {
		MemberDTO memberDTO = memberService.selectOne(user_id);
		model.addAttribute("memberDTO",memberDTO);
		return "member/deletePW";
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	public String delete(MemberDTO memberDTO, String insertPW,
			RedirectAttributes redirectAttributes) throws Exception {

		Map<String,Object> resultMap = memberService.delete(memberDTO,insertPW);
		redirectAttributes.addFlashAttribute("msg",resultMap.get("msg"));
		
		// 탈퇴 실패
		if((int)resultMap.get("result") == 1) {
			redirectAttributes.addAttribute("user_id",memberDTO.getUser_id());
			return "redirect:/member/modify";
		} 
		
		// 탈퇴 성공
		return "redirect:/main/logout";
	}

}
