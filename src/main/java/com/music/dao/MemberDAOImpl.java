package com.music.dao;

import org.apache.ibatis.session.SqlSession;
import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.music.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Resource
	private SqlSession sqlSession;

	// 회원 한 건 조회
	@Override
	public MemberDTO selectOne(String user_id) throws Exception {
		return sqlSession.selectOne("memberMapper.selectOne",user_id);
	}

	// 회원 가입
	@Override
	public void insert(MemberDTO memberDTO) throws Exception {
		sqlSession.insert("memberMapper.insert",memberDTO);
	}

	// 회원정보 수정
	@Override
	public void update(MemberDTO memberDTO) throws Exception {
		sqlSession.update("memberMapper.update",memberDTO);
	}
	
	// 비밀번호 변경
	@Override
	public void changePW(MemberDTO memberDTO) throws Exception {
		sqlSession.update("memberMapper.changePW",memberDTO);
	}

	// 회원 탈퇴
	@Override
	public void delete(String user_id) throws Exception {
		sqlSession.update("memberMapper.delete",user_id);
	}

}
