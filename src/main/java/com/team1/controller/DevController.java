package com.team1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DevController {
	
	@RequestMapping("/dev")
	public String Dev(){
		
		return "dev";
		
	}

}
