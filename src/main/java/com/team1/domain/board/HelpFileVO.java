package com.team1.domain.board;

import lombok.Data;

@Data
public class HelpFileVO {
	private Integer id;
	private Integer postId;
	private String fileName;
	private String url;
	private Integer isThumbnail;
	
}
