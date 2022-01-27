package com.team1.mapper.user;

import org.apache.ibatis.annotations.Param;

import com.team1.domain.user.UserFileVO;

public interface UserFileMapper {
	
	int insert(UserFileVO fileVO);
	
	void delete(@Param("userId") Integer userId, @Param("fileName") String fileName);
	
	void deleteByUrl(@Param("url") String url);

	UserFileVO selectNamesByUserId(Integer id);
	
}
