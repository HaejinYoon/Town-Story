package com.team1.controller.user;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team1.domain.board.UserPostVO;
import com.team1.domain.user.UserFileVO;
import com.team1.domain.user.UserVO;
import com.team1.service.user.UserService;

import lombok.Setter;

@Controller
@RequestMapping("/user")
public class UserController {

	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	@RequestMapping("/nicknamecheckForSignup")
	@ResponseBody
	public String nicknamecheckForSignup(String nickname) {
		boolean has = service.hasNickName(nickname);
		
		
		if (has) {
			
				return "unable";
				
			
		} else {
			return "able";
		}
	}
	
	
	@RequestMapping("/nicknamecheck")
	@ResponseBody
	public String nicknamecheck(String nickname, HttpSession session) {
		boolean has = service.hasNickName(nickname);
		UserVO userWithd = service.readWithdrwal(nickname);
		
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		if (has) { // 검색했는데 있는 아이디임
			if(userWithd.getWithdrawal().equals("X")) { // 근데 탈퇴한 계정이 아님
				
				if(nickname.equals(vo.getNickname())){
					return "same"; // session에서 받아온(로그인된) 정보와 같은 닉네임일 경우
				}else {
					return "unable"; // 로그인된 아이디를 제외한 닉네임 중복 검출
				}
				
			}else {
				return "able";
			}
		} else {
			return "able"; // 사용 가능 닉네임
		}
	}
	
	@RequestMapping("/emailcheck")
	@ResponseBody
	public String emailcheck(String email) {
		boolean has = service.hasEmail(email);
		
		if (has) {
			return "unable";
		} else {
			return "able";
		}
	}
	
//	@GetMapping("/login")
//	public void login() {
//		
//	}
	
	@RequestMapping("/login")
	public String login (String email, String pw, HttpSession session, RedirectAttributes rttr, Model model, HttpServletRequest request) throws UnsupportedEncodingException {
		UserVO vo = service.read(email);
		
		
		if(vo == null || vo.getWithdrawal() == "O") {
			
			if (email != null) {
				model.addAttribute("result", "존재하지 않은 아이디입니다.");
			}
			return null;
		}
		
		boolean correctPassword = pw.equals(vo.getPw());
		
		if(!correctPassword) {
			
			model.addAttribute("result", "비밀번호를 다시 확인해주세요.");
			
			return null;
		}
		String path = (String)request.getHeader("REFERER");

		System.out.println("path : "+path);
		session.setAttribute("loginUser",vo);
		rttr.addFlashAttribute("result", vo.getNickname() + "님 환영합니다.");
		//String encodeLoc = URLEncoder.encode(vo.getLocation(), "UTF-8");
		if(path.contains("login")) {
			return "redirect:/";
		}else {
			return "redirect:"+ path;
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		String path = (String)request.getHeader("REFERER");
		return "redirect:"+path;
	}

	
	@GetMapping("/signup")
	public void signup() {
		
	}
	
	@PostMapping("/signup")
	public String signup(UserVO user, MultipartFile file, RedirectAttributes rttr) 
			throws IllegalStateException, IOException {
		
		service.register(user, file);
		
		String message = "가입완료 되었습니다!!";
		
		rttr.addFlashAttribute("ok", message);
		
		return "redirect:/";
		
	}
	
	
	@GetMapping("/profile")
	public String profile(HttpSession session) {

		UserVO vo = (UserVO) session.getAttribute("loginUser");

	
		if (vo == null) {
			return "redirect:/user/login";
		}
		
		return null;
	}
	
	@GetMapping("/profile/{nickname}")
	public String profile(@PathVariable String nickname, Model model) {
		
		UserVO vo = service.readByNickName(nickname);
		//List<HelpVO> list = service.UserBoardHelpList(vo.getId());
		List<UserPostVO> list = service.getUserPostList(nickname);
		
		model.addAttribute("user", vo);
		model.addAttribute("list", list);
		
		return "user/profile";
	}
	
	
	@GetMapping("/infoModify")
	public String modify(HttpSession session, Model model) {

		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		UserVO uservo = (UserVO) service.read(vo.getEmail());
		UserFileVO file = (UserFileVO) vo.getFile();
		
		model.addAttribute("user", uservo);
		model.addAttribute("file", file);
		return null;
	}
	
	@PostMapping("/infoModify")
	public String modify(UserVO user, String removeFile,
			HttpSession session, MultipartFile file, RedirectAttributes rttr) 
			throws IllegalStateException, IOException {

		UserVO vo = (UserVO) session.getAttribute("loginUser");

		
		if (vo == null) {
			return "redirect:/user/login";
		}
		
		
		// 로그인된 상태
		if(removeFile !=null) {
			
			service.modify(user, removeFile, file);
		}else {
			service.modify(user);
		}
		rttr.addFlashAttribute("modify", "회원 정보가 변경되었습니다. 로그아웃 후에 이용해주세요!");
		

		return "redirect:/";
	}
	
	
	@GetMapping("/remove")
	public String remove(HttpSession session) {

		UserVO vo = (UserVO) session.getAttribute("loginUser");

	
		if (vo == null) {
			return "redirect:/user/login";
		}
		
		return null;
	}
	
	@PostMapping("/remove")
	public String remove(String email, String pw, HttpSession session, RedirectAttributes rttr) {
	
	
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		if (vo == null) {
			return "redirect:/user/login";
		}
		
		String sessionPw = vo.getPw();
				
		
		if(!(sessionPw.equals(pw))) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/user/remove";
			}
				service.remove(vo.getEmail());
				session.invalidate();
				return "redirect:/user/login";
	}
	
	@RequestMapping("/pwFind")
	@ResponseBody
	public String remove(String email) {
		
		System.out.println(email);

		String result;
		
		try {
			result = service.sendPassWordFindEmail(email);
			System.out.println(result);
			return result;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
	}
	
}
