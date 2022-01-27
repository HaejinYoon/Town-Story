package com.team1.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.domain.board.HelpFileVO;
import com.team1.domain.board.HelpVO;

public interface HelpMapper {

	public List<HelpVO> getList(Integer loginId);
	
	public int insert(HelpVO board); 
	
	public HelpVO read(@Param("id") Integer id, @Param("loginId") Integer loginId); 
	
	public int delete(Integer id);
	
	public int update(HelpVO board);

	public List<HelpVO> getListSearchByContent(String search);
	
	public List<HelpVO> getListByConditions(@Param("location") String location, @Param("tag") String tag, @Param("query") String query, @Param("loginId") Integer loginId);
	
	public List<HelpVO> getListByUserId(Integer Id);
	
	public int upViews(Integer id);

	public List<HelpFileVO> getFiles();

	public List<HelpFileVO> getFilesById(Integer id);

	public int upUps(Integer id);
	
}