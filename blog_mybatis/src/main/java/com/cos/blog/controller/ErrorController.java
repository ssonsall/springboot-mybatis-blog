package com.cos.blog.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.blog.util.Script;

@RestController
@RequestMapping("/error")
public class ErrorController {

	@GetMapping("/loginFailed")
	public String loginFailed() {
		return Script.back("Login Failed");
	}
	
	@GetMapping("/joinFailed")
	public String joinFailed() {
		return Script.back("Join Failed");
	}
	
	@GetMapping("/updateFailed")
	public String updateFailed() {
		return Script.back("Update Failed");
	}
	
	@GetMapping("/boardSaveFailed")
	public String boardSaveFailed() {
		return Script.back("Board Save Failed");
	}
	
	@GetMapping("/boardDeleteFailed")
	public String boardDeleteFailed() {
		return Script.back("Board Delete Failed");
	}
	
	@GetMapping("/boardUpdateFailed")
	public String boardUpdateFailed() {
		return Script.back("Board Update Failed");
	}
	
	@GetMapping("/needLogin")
	public String needLogin() {
		return Script.href("/user/loginPage","Login Required");
	}
}
