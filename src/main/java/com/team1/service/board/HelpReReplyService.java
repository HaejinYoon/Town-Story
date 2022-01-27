package com.team1.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team1.domain.board.HelpReReplyVO;
import com.team1.mapper.board.HelpReReplyMapper;
import com.team1.mapper.board.ReportMapper;

import lombok.Setter;

@Service
public class HelpReReplyService {
	
	@Setter(onMethod_=@Autowired)
	private HelpReReplyMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private ReportMapper reportMapper;
	
	public List<HelpReReplyVO> list(Integer replyId) {
		return mapper.list(replyId);
	}
	
	public boolean register(HelpReReplyVO reReply) {
		return mapper.insert(reReply) == 1 ;
	}
	
	public boolean modify(HelpReReplyVO reReply) {
		return mapper.update(reReply) == 1;
	}
	
	@Transactional
	public boolean remove(Integer id) {
		//대댓글의 신고내역 지우기 
		reportMapper.deleteByHelpReReplyId(id);
		
		//대댓글 지우기 
		return mapper.delete(id) == 1;
	}
	
	public HelpReReplyVO readById(Integer id) {
		return mapper.selectById(id);
	}

	public HelpReReplyVO readByNick(String nickname) {
		return mapper.readByNick(nickname);
	}
	
	public Integer countReReplyList(Integer replyId) {
		return mapper.listReReplyCount(replyId);
	}
	
	public Integer countInBoard(Integer boardId) {
		return mapper.countInBoard(boardId);
	}

}
