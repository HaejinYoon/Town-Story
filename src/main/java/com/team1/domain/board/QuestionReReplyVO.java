package com.team1.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class QuestionReReplyVO {
	private Integer id;
	private Integer replyId;
	private String nickname;
	private String reReply;
	private Integer boardId;
	private String url;
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	// 댓글 수정 삭제 버튼 여부
	private Boolean own;
	private String userprofile;
	private Integer uid;
	
	// 관리자 권한
	private Integer adminQuali;

	public String getInserted() {
		return this.inserted.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}
	
	public String getUpdated() {
		return this.updated.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}

}
