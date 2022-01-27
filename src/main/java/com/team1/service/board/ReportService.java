package com.team1.service.board;

import org.springframework.stereotype.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.team1.mapper.board.ReportMapper;

import lombok.Setter;

import com.team1.domain.board.ReportVO;

@Service
public class ReportService {
	@Setter(onMethod_= @Autowired)
	private ReportMapper mapper;
	
	public List<ReportVO> getList(){
		return mapper.getList();
	}
	
	public boolean register(ReportVO report) {
		return mapper.insert(report) == 1;
	}
	
	public boolean remove(Integer id) {
		return mapper.delete(id) == 1;
	}
	
	public Integer countHelpReplyId(Integer id) {
		return mapper.countHelpReplyId(id);
	}
	
	public Integer countLifeReplyId(Integer id) {
		return mapper.countLifeReplyId(id);
	}
	
	public Integer countNewsReplyId(Integer id) {
		return mapper.countNewsReplyId(id);
	}
	
	public Integer countQuestionReplyId(Integer id) {
		return mapper.countQuestionReplyId(id);
	}
	
	public Integer countHelpReReplyId(Integer id) {
		return mapper.countHelpReReplyId(id);
	}
	
	public Integer countLifeReReplyId(Integer id) {
		return mapper.countLifeReReplyId(id);
	}
	
	public Integer countNewsReReplyId(Integer id) {
		return mapper.countNewsReReplyId(id);
	}
	
	public Integer countQuestionReReplyId(Integer id) {
		return mapper.countQuestionReReplyId(id);
	}
}
