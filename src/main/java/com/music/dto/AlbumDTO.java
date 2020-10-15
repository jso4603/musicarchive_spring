package com.music.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlbumDTO {
	private int album_id; // 앨범ID(PK)
	private String album_title; // 앨범제목
	private String artwork_name; // 앨범 아트워크 파일명
}
