package com.team1.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team1.domain.board.LifeReplyVO;
import com.team1.mapper.board.LifeReReplyMapper;
import com.team1.mapper.board.LifeReplyMapper;
import com.team1.mapper.board.ReportMapper;

import lombok.Setter;

@Service
public class LifeReplyService {
	@Setter(onMethod_=@Autowired)
	private LifeReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private LifeReReplyMapper lifeReReplyMapper;
	
	@Setter(onMethod_=@Autowired)
	private ReportMapper reportMapper;
	
	public List<LifeReplyVO> list(Integer boardId) {
		return mapper.list(boardId);
	}
	
	public boolean insert(LifeReplyVO reply) {
		return mapper.insert(reply) == 1 ;
	}
	
	public boolean remove(Integer ID) {
		return mapper.delete(ID) == 1;
	}
	
	public boolean register(LifeReplyVO reply) {
		return mapper.insert(reply) == 1;
	}
	
	public boolean modify(LifeReplyVO reply) {
		return mapper.update(reply) == 1;
	}

	public LifeReplyVO readById(Integer ID) {
		return mapper.selectById(ID);
	}

	public boolean update(LifeReplyVO newReply) {
		return mapper.update(newReply) == 1;		
	}
	
	@Transactional
	public boolean delete(Integer ID) {
		//댓글에 달린 대댓글 지우기
		lifeReReplyMapper.deleteByReplyId(ID);
				
		//댓글의 신고내역 지우기
		reportMapper.deleteByLifeReplyId(ID);
		
		//댓글 지우기
		return mapper.delete(ID) == 1;
	}

	public Integer countReplyList(Integer ID) {
		return mapper.listReplyCount(ID);
	}

	public LifeReplyVO readByNick(String nickname) {
		return mapper.readByNick(nickname);
	}
}
