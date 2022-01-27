package com.team1.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class UserPostVO {
	
	//게시판의 종류 (화면에 띄울 용도)
	private String boardType;
	//게시판의 종류 (링크 타고 넘어갈 용도)
	private String link;
	private String tag;
	private String title;
	private LocalDateTime inserted;
	private LocalDateTime updated;
	private Integer postId;
	
	public String getInserted() {
		return this.inserted.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}
	
	public String getUpdated() {
		return this.updated.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}
	
	public LocalDateTime getOriginalInserted() {
		return inserted;
	}
	
	public LocalDateTime getOriginalUpdated() {
		return updated;
	}
}
