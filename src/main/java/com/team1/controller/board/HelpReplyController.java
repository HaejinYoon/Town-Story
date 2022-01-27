package com.team1.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team1.domain.board.HelpReplyVO;
import com.team1.domain.user.UserVO;
import com.team1.service.board.HelpReplyService;

import lombok.Setter;

@RestController
@RequestMapping("/helpreply")
public class HelpReplyController {
	@Setter(onMethod_ = @Autowired)
	private HelpReplyService service;
	
	@GetMapping("/board/{boardId}")
	public List<HelpReplyVO> list(@PathVariable Integer boardId, HttpSession session) {
		UserVO loggedIn = (UserVO) session.getAttribute("loginUser");
		List<HelpReplyVO> list = service.list(boardId);
		if(loggedIn != null) {
			for (HelpReplyVO reply : list) {
				String writerId = reply.getNickname();
				reply.setOwn(loggedIn.getNickname().equals(writerId)); // 로그인한 사람과 댓글 작성자가 같을 때 true
			}
		}
		return list;
	}
	
	@PostMapping("/write")
	public ResponseEntity<String> write(HelpReplyVO reply, @SessionAttribute(value="loginUser", required = false) UserVO logged, HttpSession session) {
//		logged = (UserVO) session.getAttribute("loginUser");
		System.out.println("log withdrawal: "+logged.getWithdrawal());
		if (logged !=null && logged.getId().equals(reply.getUid())&& (logged.getWithdrawal().equals("X"))) {
		service.insert(reply);
			return ResponseEntity.status(HttpStatus.OK).build();
		} 
		else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();			
		}
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<String>  modify(@PathVariable Integer id, @RequestBody HelpReplyVO  reply, @SessionAttribute(value="loginuser", required = false) UserVO logged, HttpSession session) {
		// 댓글 조회
		logged = (UserVO) session.getAttribute("loginUser");
		
		HelpReplyVO old = service.readById(id);
		// 로그인된 멤버의 아이디와 댓글 작성한 사람 아이디가 같을 때만
		if ((logged !=null && logged.getNickname().equals(old.getNickname()))&& (logged.getWithdrawal().equals("X"))) { // 관리자 권한 ||logged.getAdminQuali()==1
			// 업데이트
			old.setReply(reply.getReply());
			service.update(old);
			
			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
	@DeleteMapping("/{id}")
	public ResponseEntity<String> remove(@PathVariable Integer id, @SessionAttribute(value="loginuser", required = false) UserVO logged, HttpSession session) {
		System.out.println("/delete로 잘 넘어옴");
		logged = (UserVO) session.getAttribute("loginUser");
		System.out.println("로그인 닉넴 : "+logged);
		// 댓글 조회
		HelpReplyVO old = service.readById(id);
		// 로그인된 멤버의 아이디와 댓글 작성한 사람 아이디가 같을 때만 또는 관리자일 때
		if (((logged !=null && logged.getNickname().equals(old.getNickname()))&& (logged.getWithdrawal().equals("X"))) ||logged.getAdminQuali()==1) {
			// 삭제
			service.delete(id);
			
			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
	@GetMapping("/count/{id}")
	public Integer countReplyList(@PathVariable Integer id) {
		return service.countReplyList(id);
	}
	
}









