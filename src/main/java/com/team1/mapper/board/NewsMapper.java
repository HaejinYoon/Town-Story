package com.team1.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.domain.board.NewsFileVO;
import com.team1.domain.board.NewsVO;

public interface NewsMapper {
	
	public List<NewsVO> getList(Integer loginId);
	
	public int insert(NewsVO board); 
	
	public NewsVO read(@Param("id") Integer id, @Param("loginId") Integer loginId); 
	
	public int delete(Integer id);
	
	public int update(NewsVO board);

	public List<NewsVO> getListSearchByContent(String search);
	
	public List<NewsVO> getListByConditions(@Param("location") String location, @Param("tag") String tag, @Param("query") String query, @Param("loginId") Integer loginId);
	
	public List<NewsVO> getListByUserId(Integer Id);
	
	public int upViews(Integer id);

	public List<NewsFileVO> getFiles();

	public List<NewsFileVO> getFilesById(Integer id);

	public int upUps(Integer id);

}
