package com.team1.mapper.board;

import org.apache.ibatis.annotations.Param;

public interface QuestionUpMapper {
	
	public int upUps(Integer postId);
	
	public int upDowns(Integer postId);

	public int upDelete(@Param("postId") Integer postId, @Param("userId") Integer userId);

	public int upInsertUser(@Param("postId") Integer postId, @Param("userId") Integer userId);

	public Integer getCount(@Param("id") Integer id);

	public void upDeleteByBoardId(@Param("postId") Integer id);
}
