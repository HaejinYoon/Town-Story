package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.LifeReplyVO;

public interface LifeReplyMapper {
	
	public List<LifeReplyVO> list(Integer boardId);
	
	public int insert(LifeReplyVO reply);
	
	public int update(LifeReplyVO reply);
	
	public int delete(Integer id);

	public LifeReplyVO selectById(Integer id);

	public Integer listReplyCount(Integer id);
	
	public int deleteByBoardId(Integer boardId);

	public LifeReplyVO readByNick(String nickname);

}
