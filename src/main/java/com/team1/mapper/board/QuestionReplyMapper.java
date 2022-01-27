package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.QuestionReplyVO;

public interface QuestionReplyMapper {
	
	public List<QuestionReplyVO> list(Integer boardId);
	
	public int insert(QuestionReplyVO reply);
	
	public int update(QuestionReplyVO reply);
	
	public int delete(Integer id);

	public QuestionReplyVO selectById(Integer id);

	public Integer listReplyCount(Integer id);
	
	public int deleteByBoardId(Integer boardId);

	public QuestionReplyVO readByNick(String nickname);

}

