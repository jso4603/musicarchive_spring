package com.music.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.music.dto.FileDTO;

@Repository
public class FileDAOImpl implements FileDAO {
	
	@Resource
	private SqlSession sqlSession;
	
	// 파일 조회
	@Override
	public List<FileDTO> selectList(int board_id) throws Exception {
		return sqlSession.selectList("fileMapper.selectList", board_id);
	}
	// 파일 추가
	@Override
	public void insert(FileDTO fileDTO) throws Exception {
		sqlSession.insert("fileMapper.insert", fileDTO);
	}
	// 파일 수정
	@Override
	public int update(FileDTO fileDTO) throws Exception {
		return sqlSession.update("fileMapper.update", fileDTO);
	}
	// 파일 삭제
	@Override
	public void delete(int board_id) throws Exception {
		sqlSession.update("fileMapper.delete", board_id);
	}
	// 수정 시 일부 파일 삭제
	@Override
	public void delete_part(int board_id, String files_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("board_id",board_id );
		map.put("files_id",files_id );
		
		sqlSession.update("fileMapper.delete_part", map);
	}
}
