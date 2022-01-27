package com.team1.controller.board;

import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team1.coverData.Cover;
import com.team1.domain.board.QuestionPageInfoVO;
import com.team1.domain.board.QuestionReplyVO;
import com.team1.domain.board.QuestionVO;
import com.team1.domain.user.UserVO;
import com.team1.service.board.QuestionReplyService;
import com.team1.service.board.QuestionService;
import com.team1.service.board.ReportService;

import lombok.Setter;

@Controller
@RequestMapping("/question")
public class QuestionController {

	@Setter(onMethod_ = @Autowired)
	private QuestionService service;
	@Setter(onMethod_ = @Autowired )
	private QuestionReplyService replyservice;
	@Setter(onMethod_ = @Autowired)
	private ReportService reportservice;
	
	@GetMapping(value = "/list")
	public void list(@RequestParam(value = "location", required = false) String location,
			@RequestParam(value = "query", required = false) String query,
			@RequestParam(value = "tag", required = false) String tag,
			@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {

		Cover.setCover("question", model);
		Integer numberPerPage = 10;

		//공지사항만 가져오는 service
		List<QuestionVO> listNotice = service.getListPageByNotice();
		//모든 리스트 가져오는 service
		List<QuestionVO> list = service.getListPage(page, numberPerPage, location, tag, query);
		QuestionPageInfoVO pageInfo = service.getPageInfo(page, numberPerPage, location, tag, query);

		model.addAttribute("tag", tag);
		model.addAttribute("location", location);
		model.addAttribute("boardType", "question");
		
		model.addAttribute("listNotice", listNotice);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		
	}

	

	@GetMapping(value = "/list/{id}")
	public String get(@PathVariable Integer id, Model model, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		if (uvo != null) {
		
			QuestionVO qvo = service.get(id);
			
			List<QuestionReplyVO> reply = replyservice.list(id);
			
			model.addAttribute("post", qvo);
			model.addAttribute("reply", reply);
		}else {
			QuestionVO qvo = service.get(id);
		
			List<QuestionReplyVO> reply = replyservice.list(id);
			model.addAttribute("post", qvo);
			model.addAttribute("reply", reply);
		}
		
		service.upViews(id);
		return "question/get";
	}

	@GetMapping("/register")
	public String register(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		if (vo == null) {
			System.out.println("로그인 안하고 들어옴");
			return "redirect:/user/login";
		}

		return null;
	}

	@PostMapping("/register")
	public String register(QuestionVO board,
			@RequestParam(value = "page", defaultValue = "1") Integer page, 
			MultipartFile[] files, RedirectAttributes rttr) 
			throws IllegalStateException, IOException {

			// 3. business logic
			service.register(board, files);
			// 4. add attribute
			rttr.addFlashAttribute("result", board.getId() + "번 게시글이 등록되었습니다.");

		// 5. forward / redirect
		// 책: 목록으로 redirect
		return "redirect:/question/list/"+board.getId();
	}
	
	@GetMapping("/modify")
	public String getmodi(@RequestParam("id") Integer id, Model model, HttpSession session) {

		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		QuestionVO qvo = (QuestionVO) service.get(id);

		
		if(uvo.getAdminQuali() == 1) { // 관리자가 글 수정하거나 지울 수 있음
			QuestionVO board = service.get(id);
			// String[] fileNames = service.getNamesByBoardId(id);
			model.addAttribute("board", board);
			
			return "question/modify";
			
		} else if (uvo.getId() != qvo.getMemberId()) {
			System.out.println("작성자가 아니면 수정할 수 없습니다.");
			return "redirect:/question/list?page=";
		}

		QuestionVO board = service.get(id);
		// String[] fileNames = service.getNamesByBoardId(id);
		model.addAttribute("board", board);

		return "question/modify";
	}
	
	@PostMapping("/modify")
	public String modify(QuestionVO board, String[] removeFile, MultipartFile[] files, RedirectAttributes rttr) {
		try {
			if (service.modify(board, removeFile, files)) {
				rttr.addFlashAttribute("result", board.getId() + "번 게시글이 수정되었습니다.");
			}
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/question/list/"+board.getId();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("id") Integer id, RedirectAttributes rttr) {

		
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", id + "번 게시글이 삭제되었습니다.");
		}

		return "redirect:/question/list?page=";
	}
}
