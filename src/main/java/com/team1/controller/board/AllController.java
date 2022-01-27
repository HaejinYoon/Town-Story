package com.team1.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.coverData.Cover;
import com.team1.domain.board.HelpVO;
import com.team1.domain.board.QuestionVO;
import com.team1.domain.user.UserVO;
import com.team1.service.board.HelpService;
import com.team1.service.board.QuestionService;

import lombok.Setter;

@Controller
@RequestMapping("/all")
public class AllController {
	@Setter(onMethod_ = @Autowired)
	private QuestionService service;
	//태그 식별 없이 모든 게시물을 최신순으로 가져온다.
	@Setter(onMethod_ = @Autowired)
	private HelpService helpservice;
	
	@GetMapping(value = "/list")
	public void help(@RequestParam(value = "location", required = false) String location,
			@RequestParam(value = "query", required = false) String query,
			@RequestParam(value = "tag", required = false) String tag, HttpSession session, Model model) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		if (uvo != null) {
			List<HelpVO> list = helpservice.getListByConditions(location, tag, query, uvo.getId());
			model.addAttribute("list", list);
		} else {
			List<HelpVO> list = helpservice.getListByConditions(location, tag, query, 0);
			model.addAttribute("list", list);
		}
		Cover.setCover("all", model);
		List<QuestionVO> listNotice = service.getListPageByNotice();
		model.addAttribute("tag", "all");
		model.addAttribute("location", location);
		model.addAttribute("boardType", "all");
		model.addAttribute("listNotice", listNotice);
		// post들 가져온다.
		// region이 없으면 모든 region에 대하여 검색

		// 선택된 태그가 없으면 모든 tag에 대하여 검색
	}



}
