package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.ReportVO;

public interface ReportMapper {
	
	public List<ReportVO> getList();
	
	public int insert(ReportVO report);
	
	public int delete(Integer id);
	
	public int deleteByHelpId(Integer helpId);
	
	public int deleteByLifeId(Integer lifeId);

	public int deleteByNewsId(Integer newsId);

	public int deleteByQuestionId(Integer questionId);
	
	public int deleteByHelpReplyId(Integer helpReplyId);
	
	public int deleteByLifeReplyId(Integer lifeReplyId);

	public int deleteByNewsReplyId(Integer newsReplyId);

	public int deleteByQuestionReplyId(Integer questionReplyId);
	
	public int deleteByHelpReReplyId(Integer helpReReplyId);
	
	public int deleteByLifeReReplyId(Integer lifeReReplyId);

	public int deleteByNewsReReplyId(Integer newsReReplyId);

	public int deleteByQuestionReReplyId(Integer questionReReplyId);

	public Integer countHelpReplyId(Integer id);
	
	public Integer countLifeReplyId(Integer id);
	
	public Integer countNewsReplyId(Integer id);
	
	public Integer countQuestionReplyId(Integer id);

	public Integer countHelpReReplyId(Integer id);
	
	public Integer countLifeReReplyId(Integer id);
	
	public Integer countNewsReReplyId(Integer id);
	
	public Integer countQuestionReReplyId(Integer id);

}
