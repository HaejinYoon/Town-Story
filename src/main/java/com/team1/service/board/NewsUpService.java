package com.team1.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.mapper.board.NewsUpMapper;

import lombok.Setter;

@Service
public class NewsUpService {
	@Setter(onMethod_ =@Autowired)
	private NewsUpMapper mapper;
	
	public boolean upUps(Integer id) {
		return mapper.upUps(id) == 1;
	}
	
	public boolean upDowns(Integer id) {
		return mapper.upDowns(id)==1;
	}

	public boolean upDelete(Integer id, Integer userId) {
		return mapper.upDelete(id, userId)==1;
	}

	public boolean upInsertUser(Integer postId, Integer userId) {
		return mapper.upInsertUser(postId, userId)==1;
	}

	public Integer getCount(Integer id) {
		return mapper.getCount(id); 
	}
}
