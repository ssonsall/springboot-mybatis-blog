package com.cos.blog.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cos.blog.model.User;
import com.cos.blog.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService uService;

	@Value("${file.path}")
	private String resourcePath;

	@GetMapping("/joinPage")
	public String goToJoin() {
		return "user/join";
	}

	@GetMapping("/loginPage")
	public String goToLogin() {
		return "user/login";
	}

	@GetMapping("/updatePage/{id}")
	public String goToUpdate(@PathVariable int id, Model model) {
		User user = uService.goToUpdate(id);
		model.addAttribute("user", user);
		return "user/update";
	}

	@PostMapping("/join")
	public String join(User user, @RequestParam("photo") MultipartFile file) {
		int result = uService.join(user, file);
		if (result == 1)
			return "redirect:/user/loginPage";
		else
			return "redirect:/error/joinFailed";

	}

	@PostMapping("/login")
	public String login(String username, String password, HttpServletRequest request) {
		int result = uService.login(username, password, request);
		if (result == 1)
			return "redirect:/home";
		else
			return "redirect:/error/loginFailed";
	}

	@GetMapping("/logout")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/home";
	}

	@PostMapping("/update")
	public String update(User user, @RequestParam("photo") MultipartFile file, HttpServletRequest request) {
		int result = uService.update(user, file, request);
		if (result == 1)
			return "redirect:/home";
		else
			return "redirect:/error/updateFailed";
	}
}
