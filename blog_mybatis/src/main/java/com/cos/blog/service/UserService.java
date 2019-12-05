package com.cos.blog.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cos.blog.model.User;
import com.cos.blog.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository uRepo;

	@Value("${file.path}")
	private String resourcePath;

	
	public User goToUpdate(@PathVariable int id) {
		User user = uRepo.findById(id);
		return user;
	}

	public int join(User user, @RequestParam("photo") MultipartFile file) {
		try {
			if (file.getSize() != 0) {
				// 중복확률이 거의 없는 번호 생성(100프로는 아니지만)
				UUID uuid = UUID.randomUUID();
				String uuidFileName = uuid + "_" + file.getOriginalFilename();
				Path filePath = Paths.get(resourcePath + uuidFileName);
				Files.write(filePath, file.getBytes());
				String userProfile = "/userprofile/" + uuidFileName;
				user.setUserProfile(userProfile);
			} else {
				String userProfile = "/userprofile/default.jpg";
				user.setUserProfile(userProfile);
			}
			uRepo.save(user);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	public int login(String username, String password, HttpServletRequest request) {
		User user = uRepo.findByUsername(username, password);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			return 1;
		} else
			return -1;
	}
	
	public int update(User user, @RequestParam("photo") MultipartFile file, HttpServletRequest request) {
		try {
			if (file.getSize() != 0) {
				// 중복확률이 거의 없는 번호 생성(100프로는 아니지만)
				UUID uuid = UUID.randomUUID();
				String uuidFileName = uuid + "_" + file.getOriginalFilename();
				Path filePath = Paths.get(resourcePath + uuidFileName);
				Files.write(filePath, file.getBytes());
				String userProfile = "/userprofile/" + uuidFileName;
				user.setUserProfile(userProfile);
			} else {
				String userProfile = "/userprofile/default.jpg";
				user.setUserProfile(userProfile);
			}
			uRepo.update(user);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}
}
