package com.music.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.music.dto.AlbumDTO;

@Repository
public class AlbumDAOImpl implements AlbumDAO {
	
	@Resource
	private SqlSession sqlSession;
	
	// 앨범 전체조회
	@Override
	public List<AlbumDTO> selectList() throws Exception {
		return sqlSession.selectList("albumMapper.selectList");
	}
	
	// 앨범 상세조회
	@Override
	public AlbumDTO selectOne(int album_id) throws Exception {
		return sqlSession.selectOne("albumMapper.selectOne", album_id);
	}

	// 앨범 추가
	@Override
	public void insert(AlbumDTO albumDTO) throws Exception {
		sqlSession.insert("albumMapper.insert",albumDTO);
	}

	// 앨범 수정
	@Override
	public void update(AlbumDTO albumDTO) throws Exception {
		sqlSession.update("albumMapper.update",albumDTO);
	}

	// 앨범 삭제
	@Override
	public void delete(int album_id) throws Exception {
		sqlSession.delete("albumMapper.delete",album_id);
	}
}
