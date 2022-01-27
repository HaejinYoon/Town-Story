package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.LifeReReplyVO;

public interface LifeReReplyMapper {
	
	public List<LifeReReplyVO> list(Integer replyId);
	
	public int insert(LifeReReplyVO reReply);
	
	public int update(LifeReReplyVO reReply);
	
	public int delete(Integer id);
	
	public int deleteByBoardId(Integer boardId);
	
	public int deleteByReplyId(Integer replyId);

	public LifeReReplyVO selectById(Integer id);

	public LifeReReplyVO readByNick(String nickname);
	
	public Integer listReReplyCount(Integer replyId);
	
	public Integer countInBoard(Integer boardId);

}
