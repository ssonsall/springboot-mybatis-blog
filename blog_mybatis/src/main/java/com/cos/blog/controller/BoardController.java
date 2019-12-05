package com.cos.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cos.blog.model.Board;
import com.cos.blog.model.View;
import com.cos.blog.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService bService;

	@PostMapping("/write")
	public String write(Board board) {
		int result = bService.write(board);
		if (result == 1)
			return "redirect:/home";
		else
			return "redirect:/error/boardSaveFailed";

	}

	@GetMapping("/writePage")
	public String goToWrite() {
		return "board/write";
	}

	@GetMapping("/list/{page}")
	public String goToList(@PathVariable int page, Model model) {
		List<View> viewList = bService.goToList(page);
		int total = bService.count();
		model.addAttribute("viewList", viewList);
		model.addAttribute("page", page);
		model.addAttribute("total", total);
		return "board/list";
	}

	@GetMapping("/detail/{id}")
	public String goToDetail(@PathVariable int id, Model model) {
		View view = bService.goToDetail(id);
		model.addAttribute("view", view);
		return "board/detail";
	}

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		int result = bService.delete(id);
		if (result == 1)
			return "redirect:/home";
		else
			return "redirect:/error/boardDeleteFailed";
	}

	

	@GetMapping("/updatePage/{id}")
	public String goToUpdate(@PathVariable int id, Model model) {
		View view = bService.goToUpdate(id);
		model.addAttribute("view", view);
		return "board/update";
	}

	@PostMapping("/update")
	public String update(Board board) {
		int result = bService.update(board);
		if (result == 1)
			return "redirect:/board/detail/" + board.getId();
		else
			return "redirect:/error/boardUpdateFailed";
	}

}
