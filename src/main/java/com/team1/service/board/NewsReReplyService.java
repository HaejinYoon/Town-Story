package com.team1.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team1.domain.board.NewsReReplyVO;
import com.team1.mapper.board.NewsReReplyMapper;
import com.team1.mapper.board.ReportMapper;

import lombok.Setter;

@Service
public class NewsReReplyService {
	
	@Setter(onMethod_=@Autowired)
	private NewsReReplyMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private ReportMapper reportMapper;
	
	public List<NewsReReplyVO> list(Integer replyId) {
		return mapper.list(replyId);
	}
	
	public boolean register(NewsReReplyVO reReply) {
		return mapper.insert(reReply) == 1 ;
	}
	
	public boolean modify(NewsReReplyVO reReply) {
		return mapper.update(reReply) == 1;
	}
	
	@Transactional
	public boolean remove(Integer id) {
		//대댓글의 신고내역 지우기 
		reportMapper.deleteByNewsReReplyId(id);
		
		//대댓글 지우기 
		return mapper.delete(id) == 1;
	}
	
	public NewsReReplyVO readById(Integer id) {
		return mapper.selectById(id);
	}

	public NewsReReplyVO readByNick(String nickname) {
		return mapper.readByNick(nickname);
	}
	
	public Integer countReReplyList(Integer replyId) {
		return mapper.listReReplyCount(replyId);
	}
	
	public Integer countInBoard(Integer boardId) {
		return mapper.countInBoard(boardId);
	}

}
