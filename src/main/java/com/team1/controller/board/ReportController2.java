package com.team1.controller.board;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team1.domain.board.ReportVO;
import com.team1.domain.user.UserVO;
import com.team1.service.board.ReportService;

import lombok.Setter;

@RestController
@RequestMapping("/reportajax")
public class ReportController2 {
	@Setter(onMethod_ = @Autowired)
	private ReportService service;
	
	@PostMapping("/register")
	public ResponseEntity<String> register(ReportVO report, HttpSession session){
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		if(uvo == null) {
			System.out.println("UVO null");
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}else {
			System.out.println("report : "+report.getBoardName());
			service.register(report);
			return ResponseEntity.status(HttpStatus.OK).build();
		}
	}
	
	@GetMapping("/helprcount/{id}")
	public Integer helprcount(HttpSession session, @PathVariable Integer id){
		Integer rcnt = service.countHelpReplyId(id);
		return rcnt;
	}
	
	@GetMapping("/lifercount/{id}")
	public Integer lifercount(HttpSession session, @PathVariable Integer id){
		Integer rcnt = service.countLifeReplyId(id);
		return rcnt;
	}
	
	@GetMapping("/newsrcount/{id}")
	public Integer newsrcount(HttpSession session, @PathVariable Integer id){
		Integer rcnt = service.countNewsReplyId(id);
		return rcnt;
	}
	
	@GetMapping("/questionrcount/{id}")
	public Integer questionrcount(HttpSession session, @PathVariable Integer id){
		Integer rcnt = service.countQuestionReplyId(id);
		return rcnt;
	}
	
	@GetMapping("/helprrcount/{id}")
	public Integer helprrcount(HttpSession session, @PathVariable Integer id){
		Integer rcnt = service.countHelpReReplyId(id);
		return rcnt;
	}
	
	@GetMapping("/liferrcount/{id}")
	public Integer liferrcount(HttpSession session, @PathVariable Integer id){
		Integer rcnt = service.countLifeReReplyId(id);
		return rcnt;
	}
	
	@GetMapping("/newsrrcount/{id}")
	public Integer newsrrcount(HttpSession session, @PathVariable Integer id){
		Integer rcnt = service.countNewsReReplyId(id);
		return rcnt;
	}
	
	@GetMapping("/questionrrcount/{id}")
	public Integer questionrrcount(HttpSession session, @PathVariable Integer id){
		Integer rcnt = service.countQuestionReReplyId(id);
		return rcnt;
	}
	
}
