package com.music.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.music.dto.TrackDTO;

@Repository
public class TrackDAOImpl implements TrackDAO{
	
	@Resource
	private SqlSession sqlSession; 

	// 트랙리스트 정보 추가
	@Override
	public void insert(TrackDTO trackDTO) throws Exception {
		sqlSession.insert("trackMapper.insert",trackDTO);
	}

	// 트랙정보 삭제
	@Override
	public void delete(int album_id) throws Exception {
		sqlSession.delete("trackMapper.delete",album_id);
	}

	// 트랙정보 리스트 조회
	@Override
	public List<TrackDTO> selectList(int album_id) throws Exception {
		return sqlSession.selectList("trackMapper.selectList", album_id);
	}

	// 앨범ID와 트랙ID를 이용하여 트랙정보 조회
	@Override
	public TrackDTO selectOne(int album_id, int track_id) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("album_id", album_id);
		map.put("track_id", track_id);
		
		return sqlSession.selectOne("trackMapper.selectOne", map);
	}

}
