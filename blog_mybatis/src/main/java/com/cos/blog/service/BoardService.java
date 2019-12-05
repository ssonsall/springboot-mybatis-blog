package com.cos.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.blog.model.Board;
import com.cos.blog.model.View;
import com.cos.blog.repository.BoardRepository;

@Service
public class BoardService {
	@Autowired
	private BoardRepository bRepo;

	public int write(Board board) {
		try {
			bRepo.save(board);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	public List<View> goToList(@PathVariable int page) {
		List<View> viewList = bRepo.findByPage(page*3);
		return viewList;
	}

	public View goToDetail(@PathVariable int id) {
		View view = bRepo.findById(id);
		return view;
	}

	public int delete(@PathVariable int id) {
		try {
			bRepo.delete(id);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public View goToUpdate(@PathVariable int id) {
		View view = bRepo.findById(id);
		return view;
	}

	public int update(Board board) {
		try {
			bRepo.update(board);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int count() {
		return bRepo.count();
	}
}
