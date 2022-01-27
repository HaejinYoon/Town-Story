package com.team1.domain.user;

import java.time.LocalDate;

import lombok.Data;

@Data
public class UserVO {

	private Integer id;
	private String location ;
	private String email;
	private String pw; 
	private String nickname;
	private LocalDate signupday; 
	private String profileurl; 
	private String introduce; 
	private String withdrawal;
	private Integer adminQuali;
	
	//파일 넣은 aws url => 헤더나 일부 세션에서 필요
	private String url;
	private String fileName;
	UserFileVO file;
}
