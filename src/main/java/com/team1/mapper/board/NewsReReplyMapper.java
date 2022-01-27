package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.NewsReReplyVO;

public interface NewsReReplyMapper {
	
	public List<NewsReReplyVO> list(Integer replyId);
	
	public int insert(NewsReReplyVO reReply);
	
	public int update(NewsReReplyVO reReply);
	
	public int delete(Integer id);
	
	public int deleteByBoardId(Integer boardId);
	
	public int deleteByReplyId(Integer replyId);

	public NewsReReplyVO selectById(Integer id);

	public NewsReReplyVO readByNick(String nickname);
	
	public Integer listReReplyCount(Integer replyId);
	
	public Integer countInBoard(Integer boardId);

}
