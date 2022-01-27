package com.team1.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.domain.user.UserVO;
import com.team1.service.user.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws MessagingException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) throws MessagingException {
		logger.info("Welcome home! The client locale is {}.", locale);
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		model.addAttribute("login",vo);
		
		
		
		return "home";
	}
	
}
