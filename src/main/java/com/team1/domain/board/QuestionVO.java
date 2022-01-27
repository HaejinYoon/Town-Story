package com.team1.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import lombok.Data;

@Data
public class QuestionVO {
	private Integer id;
	private Integer memberId;
	private String location;
	private Integer up;
	private Integer views;
	private String tag;
	private String title;
	private String content;
	private String url;
	private LocalDateTime inserted;
	private LocalDateTime updated;
	private String nickname;
	private String fileName; // 기본프로필 설정
	private String profileurl;
	
	// 새로운 글 표시 해줄 기준 (오늘 - 작성일 < 지정한 일수) 지정한 일 수는 jsp 제목 부분 c:if 에서 직접 설정
	private Integer newMark;
	
	private Integer upposession;
	
	//게시글 신고 누적 갯수
	private Integer reportCount;
	//댓글 신고 누적 갯수
	private Integer replyReportCount;
	//대댓글 신고 누적 갯수
	private Integer rereplyReportCount;
	
	// 공지 글로 리스트의 최 상단에 위치하게 구분할 파라미터 0: 일반글 1: 공지글
	private Integer notice;
	
	List<QuestionFileVO> fileList;
	
	private Integer replyCount;
	private Integer fileCount;
	
	public UserPostVO toUserPostVO() {
		
		UserPostVO postVO = new UserPostVO();
		postVO.setLink("question");
		postVO.setBoardType("동네신문고");
		postVO.setPostId(this.id);
		postVO.setTag(this.tag);
		postVO.setTitle(this.title);
		postVO.setInserted(this.inserted);
		postVO.setUpdated(this.updated);
		
		return postVO;
	}
	
	public String getInserted() {
		return this.inserted.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}
	
	public String getUpdated() {
		return this.updated.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}
}
