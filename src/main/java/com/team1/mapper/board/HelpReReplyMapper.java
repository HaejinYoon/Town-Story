package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.HelpReReplyVO;

public interface HelpReReplyMapper {
	
	public List<HelpReReplyVO> list(Integer replyId);
	
	public int insert(HelpReReplyVO reReply);
	
	public int update(HelpReReplyVO reReply);
	
	public int delete(Integer id);
	
	public int deleteByBoardId(Integer boardId);
	
	public int deleteByReplyId(Integer replyId);

	public HelpReReplyVO selectById(Integer id);

	public HelpReReplyVO readByNick(String nickname);
	
	public Integer listReReplyCount(Integer replyId);
	
	public Integer countInBoard(Integer boardId);

}
