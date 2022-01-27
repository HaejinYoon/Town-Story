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

import com.team1.domain.board.LifeReReplyVO;
import com.team1.domain.user.UserVO;
import com.team1.service.board.LifeReReplyService;

import lombok.Setter;

@RestController
@RequestMapping("/liferereply")
public class LifeReReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private LifeReReplyService service;

	@GetMapping("/reply/{replyId}")
	public List<LifeReReplyVO> list(@PathVariable Integer replyId, HttpSession session) {
		UserVO loggedIn = (UserVO) session.getAttribute("loginUser");
		List<LifeReReplyVO> relist = service.list(replyId); //댓글에 달린 대댓글 리스트 
		if(loggedIn != null) {
			for (LifeReReplyVO rereply : relist) {
				String writerId = rereply.getNickname();
				rereply.setOwn(loggedIn.getNickname().equals(writerId)); // 로그인한 사람과 댓글 작성자가 같을 때 true
			}
		}
		return relist;
	}
	
	@PostMapping("/write")
	public ResponseEntity<String> write(LifeReReplyVO rereply, @SessionAttribute(value="loginUser", required = false) UserVO logged, HttpSession session) {
		System.out.println("log withdrawal: "+logged.getWithdrawal());
		if (logged !=null && logged.getId().equals(rereply.getUid())&& (logged.getWithdrawal().equals("X"))) {
		service.register(rereply);
			return ResponseEntity.status(HttpStatus.OK).build();
		} 
		else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();			
		}
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<String>  modify(@PathVariable Integer id, @RequestBody LifeReReplyVO  rereply, @SessionAttribute(value="loginuser", required = false) UserVO logged, HttpSession session) {
		// 댓글 조회
		logged = (UserVO) session.getAttribute("loginUser");
		
		LifeReReplyVO old = service.readById(id);
		// 로그인된 멤버의 아이디와 댓글 작성한 사람 아이디가 같을 때만
		if ((logged !=null && logged.getNickname().equals(old.getNickname()))&& (logged.getWithdrawal().equals("X"))) { // 관리자 권한 ||logged.getAdminQuali()==1
			// 업데이트
			old.setReReply(rereply.getReReply());
			service.modify(old);
			
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
		LifeReReplyVO old = service.readById(id);
		// 로그인된 멤버의 아이디와 댓글 작성한 사람 아이디가 같을 때만 또는 관리자일 때
		if (((logged !=null && logged.getNickname().equals(old.getNickname()))&& (logged.getWithdrawal().equals("X"))) || logged.getAdminQuali()==1) {
			// 삭제
			service.remove(id);
			
			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
	@GetMapping("/count/{replyId}")
	public Integer countReReplyList(@PathVariable Integer replyId) {
		return service.countReReplyList(replyId);
	}
	
	@GetMapping("/countb/{boardId}")
	public Integer countInBoard(@PathVariable Integer boardId) {
		return service.countInBoard(boardId);
	}

}
