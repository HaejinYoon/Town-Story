package com.team1.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.domain.board.LifeFileVO;
import com.team1.domain.board.LifeVO;

public interface LifeMapper {
	
	public List<LifeVO> getList(Integer loginId);
	
	public int insert(LifeVO board); 
	
	public LifeVO read(@Param("id") Integer id, @Param("loginId") Integer loginId); 
	
	public int delete(Integer id);
	
	public int update(LifeVO board);

	public List<LifeVO> getListSearchByContent(String search);
	
	public List<LifeVO> getListByConditions(@Param("location") String location, @Param("tag") String tag, @Param("query") String query, @Param("loginId") Integer loginId);
	
	public int upViews(Integer id);
	
	public List<LifeVO> getListByUserId(Integer Id);

	public List<LifeFileVO> getFiles();

	public List<LifeFileVO> getFilesById(Integer id);

	public int upUps(Integer id);

}
