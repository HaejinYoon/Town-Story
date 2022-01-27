package com.team1.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.coverData.Cover;
import com.team1.service.board.HelpService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private HelpService service;

	@GetMapping(value = "/main")
	public void main(Model model) {

		Cover.setCover("all", model);

		model.addAttribute("tag", "all");
		model.addAttribute("region", "");
		// post들 가져온다.
		// region이 없으면 모든 region에 대하여 검색

		// 선택된 태그가 없으면 모든 tag에 대하여 검색
	}

	@GetMapping(value = "/main", params = { "region", "tag" })
	public void main(@RequestParam(value = "region") String region, @RequestParam(value = "tag") String tag,
			Model model) {

		Cover.setCover(tag, model);

		model.addAttribute("tag", tag);
		model.addAttribute("region", region);
		// post들 가져온다.
		// region이 없으면 모든 region에 대하여 검색

		// 선택된 태그가 없으면 모든 tag에 대하여 검색
	}

	// 쿼리를 함께 검색하는 컨트롤러
	@GetMapping(value = "/main", params = { "region", "tag", "query" })
	public void main(@RequestParam(value = "region") String region, @RequestParam(value = "tag") String tag,
			String query, Model model) {

		Cover.setCover(tag, model);

		model.addAttribute("tag", tag);
		model.addAttribute("region", region);
		// post들 가져온다.
		// region이 없으면 모든 region에 대하여 검색

		// 선택된 태그가 없으면 모든 tag에 대하여 검색
	}
	
	//help 페이지 (검색 쿼리 있는 버전)
	@GetMapping(value = "/help", params = { "region", "query" })
	public void help(@RequestParam(value = "region") String region, @RequestParam(value = "query") String query,
			Model model) {

		Cover.setCover("help", model);
		
		model.addAttribute("tag", "help");
		model.addAttribute("region", region);
		
	}
	
	//help 페이지
	@GetMapping(value = "/help", params = { "region"})
	public void help(@RequestParam(value = "region") String region,Model model) {

		Cover.setCover("help", model);
		
		model.addAttribute("tag", "help");
		model.addAttribute("region", region);
	}
	
	//news 페이지 (검색 쿼리 있는 버전)
	@GetMapping(value = "/news", params = { "region", "query" })
	public void news(@RequestParam(value = "region") String region, @RequestParam(value = "query") String query,
			Model model) {

		Cover.setCover("news", model);
		
		model.addAttribute("tag", "news");
		model.addAttribute("region", region);
		
	}
	
	//news 페이지 
	@GetMapping(value = "/news", params = { "region"})
	public void news(@RequestParam(value = "region") String region,Model model) {

		Cover.setCover("news", model);
		
		model.addAttribute("tag", "news");
		model.addAttribute("region", region);
	}
	
	//life 페이지 (검색 쿼리 있는 버전)
	@GetMapping(value = "/life", params = { "region", "query" })
	public void life(@RequestParam(value = "region") String region, @RequestParam(value = "query") String query,
			Model model) {

		Cover.setCover("life", model);
		
		model.addAttribute("tag", "life");
		model.addAttribute("region", region);
		
	}
	
	//life 페이지 (검색 쿼리 있는 버전)
	@GetMapping(value = "/life", params = { "region"})
	public void life(@RequestParam(value = "region") String region,Model model) {

		Cover.setCover("life", model);

		model.addAttribute("tag", "life");
		model.addAttribute("region", region);
	}
	
	//question 페이지(검색 쿼리 있는 버전)
	@GetMapping(value = "/question", params = { "region", "query" })
	public void question(@RequestParam(value = "region") String region, @RequestParam(value = "query") String query,
			Model model) {

		Cover.setCover("question", model);
		
		model.addAttribute("tag", "question");
		model.addAttribute("region", region);
		
	}
	
	//question 페이지 
	@GetMapping(value = "/question", params = { "region"})
	public void question(@RequestParam(value = "region") String region,Model model) {

		Cover.setCover("question", model);
		
		model.addAttribute("tag", "question");
		model.addAttribute("region", region);
	}
}
