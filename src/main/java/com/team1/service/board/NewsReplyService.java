package com.team1.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team1.domain.board.NewsReplyVO;
import com.team1.mapper.board.NewsReReplyMapper;
import com.team1.mapper.board.NewsReplyMapper;
import com.team1.mapper.board.ReportMapper;

import lombok.Setter;

@Service
public class NewsReplyService {
	@Setter(onMethod_=@Autowired)
	private NewsReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private NewsReReplyMapper newsReReplyMapper;
	
	@Setter(onMethod_=@Autowired)
	private ReportMapper reportMapper;
	
	public List<NewsReplyVO> list(Integer boardId) {
		return mapper.list(boardId);
	}
	
	public boolean insert(NewsReplyVO reply) {
		return mapper.insert(reply) == 1 ;
	}
	
	public boolean remove(Integer ID) {
		return mapper.delete(ID) == 1;
	}
	
	public boolean register(NewsReplyVO reply) {
		return mapper.insert(reply) == 1;
	}
	
	public boolean modify(NewsReplyVO reply) {
		return mapper.update(reply) == 1;
	}

	public NewsReplyVO readById(Integer ID) {
		return mapper.selectById(ID);
	}

	public boolean update(NewsReplyVO newReply) {
		return mapper.update(newReply) == 1;		
	}

	@Transactional
	public boolean delete(Integer ID) {
		//댓글에 달린 대댓글 지우기
		newsReReplyMapper.deleteByReplyId(ID);
		
		//댓글의 신고내역 지우기
		reportMapper.deleteByNewsReplyId(ID);
	
		//댓글 지우기 
		return mapper.delete(ID) == 1;
	}

	public Integer countReplyList(Integer ID) {
		return mapper.listReplyCount(ID);
	}

	public NewsReplyVO readByNick(String nickname) {
		return mapper.readByNick(nickname);
	}
}
