package com.team1.domain.user;

import lombok.Data;

@Data
public class UserFileVO {
	
	private Integer id;
	private Integer userId;
	private String fileName;
	private String url;
}