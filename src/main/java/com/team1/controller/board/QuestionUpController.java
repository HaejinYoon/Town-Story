package com.team1.controller.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team1.domain.user.UserVO;
import com.team1.service.board.QuestionUpService;

import lombok.Setter;

@RestController
@RequestMapping("/questionup")
public class QuestionUpController {
	
	@Setter(onMethod_ = @Autowired)
	private QuestionUpService service;
	
	@GetMapping("/")
	public void home() {
		
	}
	@PutMapping("/{id}")
	public Integer up(@PathVariable Integer id, @SessionAttribute(value="loginuser", required = false) UserVO logged, HttpSession session) {
		logged = (UserVO) session.getAttribute("loginUser");
		service.upUps(id);
		service.upInsertUser(id, logged.getId());
		Integer cnt = service.getCount(id);
		return cnt;
	}
	
	@DeleteMapping("/{id}")
	public Integer down(@PathVariable Integer id, @SessionAttribute(value="loginuser", required = false) UserVO logged, HttpSession session) {
		logged = (UserVO) session.getAttribute("loginUser");
		service.upDowns(id);
		service.upDelete(id, logged.getId());
		Integer cnt = service.getCount(id);
		return cnt;
	}

}
