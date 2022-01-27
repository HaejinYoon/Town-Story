package com.team1.mapper.board;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.domain.board.QuestionFileVO;

public interface QuestionFileMapper {

	int insert(QuestionFileVO fileVO);
	
	List<QuestionFileVO> selectNamesByBoardId(Integer boardId);
	
	QuestionFileVO selectByUrl(String url);

	void delete(@Param("boardId") Integer boardId, @Param("fileName") String fileName);
	
	void deleteByUrl(@Param("url") String url);
	
	void deleteByBoardId(Integer boardId);
}
