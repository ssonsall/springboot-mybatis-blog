package com.cos.blog.repository;

import java.util.List;

import com.cos.blog.model.Board;
import com.cos.blog.model.View;

public interface BoardRepository {
	void save(Board board);
	List<View> findAll();
	List<View> findByPage(int page);
	View findById(int id);
	void delete(int id);
	void update(Board board);
	int count();
}
