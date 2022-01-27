package com.team1.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.domain.board.HelpFileVO;


public interface HelpFileMapper {
	
	int insert(HelpFileVO fileVO);
	
	//List<String> selectNamesByBoardId(Integer boardId);
	
	List<HelpFileVO> selectNamesByBoardId(Integer boardId);
	
	HelpFileVO selectByUrl(String url);
	
	void setThumbnailById(Integer Id);
	
	void unsetThumbnailById(Integer Id);

	void delete(@Param("boardId") Integer boardId, @Param("fileName") String fileName);
	
	void deleteByUrl(@Param("url") String url);
	
	void deleteByBoardId(Integer boardId);
}
