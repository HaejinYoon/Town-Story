package com.team1.mapper.board;

import java.util.List;
import com.team1.domain.board.HelpReplyVO;

public interface HelpReplyMapper {
	
	public List<HelpReplyVO> list(Integer boardId);
	
	public int insert(HelpReplyVO reply);
	
	public int update(HelpReplyVO reply);
	
	public int delete(Integer id);

	public HelpReplyVO selectById(Integer id);

	public Integer listReplyCount(Integer id);
	
	public int deleteByBoardId(Integer boardId);

	public HelpReplyVO readByNick(String nickname);

}
