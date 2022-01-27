package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.QuestionReReplyVO;

public interface QuestionReReplyMapper {
	
	public List<QuestionReReplyVO> list(Integer replyId);
	
	public int insert(QuestionReReplyVO reReply);
	
	public int update(QuestionReReplyVO reReply);
	
	public int delete(Integer id);
	
	public int deleteByBoardId(Integer boardId);
	
	public int deleteByReplyId(Integer replyId);

	public QuestionReReplyVO selectById(Integer id);

	public QuestionReReplyVO readByNick(String nickname);
	
	public Integer listReReplyCount(Integer replyId);
	
	public Integer countInBoard(Integer boardId);

}
