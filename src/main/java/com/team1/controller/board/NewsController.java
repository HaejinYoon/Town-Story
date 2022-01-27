package com.team1.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.team1.domain.board.NewsReplyVO;
import com.team1.domain.board.NewsVO;
import com.team1.domain.user.UserVO;
import com.team1.service.board.NewsReplyService;
import com.team1.service.board.NewsService;
import com.team1.service.board.ReportService;

import lombok.Setter;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@Setter(onMethod_ = @Autowired)
	private NewsService service;

	@Setter(onMethod_ = @Autowired)
	private NewsReplyService replyservice;
	
	@Setter(onMethod_ = @Autowired)
	private ReportService reportservice;

	
	@GetMapping(value = "/list")
	public void news(@RequestParam(value = "location", required = false) String location,
			@RequestParam(value = "query", required = false) String query,
			@RequestParam(value = "tag", required = false) String tag, HttpSession session, Model model) {

		Cover.setCover("news", model);
		
		model.addAttribute("location", location);
		model.addAttribute("tag", tag);
		model.addAttribute("boardType", "news");
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		
		if (uvo != null) {
			List<NewsVO> list = service.getListByConditions(location, tag, query, uvo.getId());
			model.addAttribute("list", list);
		} else {
			List<NewsVO> list = service.getListByConditions(location, tag, query, 0);
			model.addAttribute("list", list);
		}
	}
	
	// 게시물 상세 페이지, news/list/id 와 같은 형식으로 게시물의 id를 링크에서 가져온다.
	@GetMapping(value = "/list/{id}")
	public String post(@PathVariable Integer id, Model model, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		// 한개의 post를 가져온다.

		if (uvo != null) {
			NewsVO newsVO = service.get(id, uvo.getId());
			// String[] fileNames = service.getNamesByBoardId(id);
			List<NewsReplyVO> reply = replyservice.list(id);
			model.addAttribute("post", newsVO);
			model.addAttribute("reply", reply);
			// model.addAttribute("fileNames", fileNames);
		} else {
			NewsVO newsVO = service.get(id, 0);
			// String[] fileNames = service.getNamesByBoardId(id);
			List<NewsReplyVO> reply = replyservice.list(id);
			model.addAttribute("post", newsVO);
			model.addAttribute("reply", reply);
			// model.addAttribute("fileNames", fileNames);
		}

		service.upViews(id);

		return "news/post";

	}

	@GetMapping("/modify")
	public String get(@RequestParam("id") Integer id, Model model, HttpSession session) {

		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		NewsVO hvo = (NewsVO) service.get(id, uvo.getId());

		if(uvo.getAdminQuali() == 1) { // 관리자가 글 수정하거나 지울 수 있음
			NewsVO board = service.get(id, uvo.getId());
			// String[] fileNames = service.getNamesByBoardId(id);
			model.addAttribute("board", board);
			
			return "news/modify";
		} else if (uvo.getId() != hvo.getMemberId()) {
			System.out.println("작성자가 아니면 수정할 수 없습니다.");
			return "redirect:/all/list";
		}

		NewsVO board = service.get(id, uvo.getId());
		// String[] fileNames = service.getNamesByBoardId(id);
		model.addAttribute("board", board);

		return "news/modify";
	}

	@PostMapping("/modify")
	public String modify(NewsVO board, String[] removeFile, MultipartFile[] files, String thumbNailChoice,
			RedirectAttributes rttr) {

		System.out.println("/modify로 잘 옴.");

		try {
			if (service.modify(board, removeFile, files, thumbNailChoice)) {
				rttr.addFlashAttribute("result", board.getId() + "번 게시글이 수정되었습니다.");
			}
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/news/list/"+board.getId();
	}

	@GetMapping("/register")
	public void register() {
		
	}

	// newsVO와 이미지 파일, 썸네일로 지정된 파일명을 받아온다(thumbNail).
	@PostMapping("/register")
	public String register(NewsVO board, MultipartFile[] files, String thumbNailChoice, RedirectAttributes rttr,
			HttpServletRequest req) throws IllegalStateException, IOException {

		service.register(board, files, thumbNailChoice);

		System.out.println(thumbNailChoice);
		rttr.addFlashAttribute("result", board.getId() + "번 게시글이 등록되었습니다.");

		return "redirect:/news/list/"+board.getId();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("id") Integer id, RedirectAttributes rttr) {

		System.out.println("/remove로 잘 옴.");
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", id + "번 게시글이 삭제되었습니다.");
		}

		return "redirect:/news/list";
	}

	
}
