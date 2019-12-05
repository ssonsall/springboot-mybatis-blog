package com.cos.blog.repository;

import com.cos.blog.model.User;

public interface UserRepository {
	void save(User user);
	User findByUsername(String username, String password);
	User findById(int id);
	void update(User user);
}
