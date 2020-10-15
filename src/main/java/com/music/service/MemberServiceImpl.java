package com.music.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.dao.MemberDAO;
import com.music.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Resource
	private MemberDAO memberDAO;
	
	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	// 회원 가입
	@Transactional
	@Override
	public Map<String, Object> insert(MemberDTO memberDTO) throws Exception {
		String msg = null;
		//result : 0(회원가입 성공),1(회원가입 실패)
		int result = -1;
		
		//아이디 중복 체크
		MemberDTO rdto =memberDAO.selectOne(memberDTO.getUser_id());
		
		if(rdto == null) { // 기존 아이디 미존재
			// 패스워드 암호화
			memberDTO.setPassword(passwordEncoder.encode(memberDTO.getPassword()));
			
			
			memberDAO.insert(memberDTO);
			msg = "회원가입이 완료되었습니다.";
			result = 0;
		} else {
			msg = "중복된 아이디가 있습니다.";
			result = 1;
		}
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("msg", msg);
		resultMap.put("result", result);
		return resultMap;
	}

	// 회원 조회
	@Override
	public MemberDTO selectOne(String user_id) throws Exception {
		MemberDTO memberDTO = memberDAO.selectOne(user_id);
		return memberDTO;
	}

	// 비밀번호 일치여부 확인
	@Override
	public boolean checkPW(String password, String insertPW) throws Exception {
		if(passwordEncoder.matches(insertPW, password)) {
			return true;
		}
		return false;
	}
	
	// 회원정보 수정 
	@Override
	public void update(MemberDTO memberDTO) throws Exception {
		memberDAO.update(memberDTO);
	}

	// 비밀번호 변경
	@Override
	public Map<String,Object> changePW(MemberDTO memberDTO, String oldPW, String newPW) throws Exception {
		String msg = null;
		
		//result : 0(변경 성공),1(변경 실패)
		int result = -1;
		
		if(passwordEncoder.matches(oldPW, memberDTO.getPassword())) {
			String newPassWord = passwordEncoder.encode(newPW);
			memberDTO.setPassword(newPassWord);
			
			memberDAO.changePW(memberDTO);
			msg = "비밀번호가 변경되었습니다.";
			result = 0;
		} else {
			msg = "비밀번호가 일치하지 않습니다.";
			result = 1;
		}
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("msg", msg);
		resultMap.put("result", result);
		
		return resultMap;
	}

	// 회원 탈퇴
	@Override
	public Map<String, Object> delete(MemberDTO memberDTO, String insertPW) throws Exception {
		String msg = null;
		//result : 0(탈퇴 성공),1(탈퇴 실패)
		int result = -1;

		
		// 일치하면 비밀번호 암호화 하여 dto 수정 후 DB에 입력
		if(passwordEncoder.matches(insertPW, memberDTO.getPassword())) {
			memberDAO.delete(memberDTO.getUser_id());
			msg = "회원탈퇴가 완료되었습니다.";
			result = 0;
		} else {
			msg = "비밀번호가 일치하지 않습니다.";
			result = 1;
		}
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("msg", msg);
		resultMap.put("result", result);
		
		return resultMap;
	}

}
