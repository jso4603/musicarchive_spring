package com.music.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TrackDTO {
	
	private int album_id; // 앨범ID(FK)
	private int track_id; // 트랙ID(PK)
	private String track_title; // 트랙제목
	private String lyric; // 가사
	private String file_name; // 트랙파일명
	private List<TrackDTO> trackList; // TrackDTO형 리스트
	
}
