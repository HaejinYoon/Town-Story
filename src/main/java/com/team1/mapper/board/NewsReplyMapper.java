package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.NewsReplyVO;

public interface NewsReplyMapper {
	
	public List<NewsReplyVO> list(Integer boardId);
	
	public int insert(NewsReplyVO reply);
	
	public int update(NewsReplyVO reply);
	
	public int delete(Integer id);

	public NewsReplyVO selectById(Integer id);

	public Integer listReplyCount(Integer id);
	
	public int deleteByBoardId(Integer boardId);

	public NewsReplyVO readByNick(String nickname);

}
