package com.cos.blog.config;

import java.util.regex.Pattern;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	/*
	 * .addPathPatterns("/**");
	 * .excludePathPatterns("/user/*")
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		Pattern number = Pattern.compile("(^[0-9]*$)");
		
		
		// /board
		registry.addInterceptor(new SessionInterceptor())
		//board경로를 타는 페이지들은 전부 세션 있어야 들어가지게 요청
		.addPathPatterns("/board/**")
		//리스트는 세션없이 가능하게 설정
		.excludePathPatterns("/board/list/**");
		//.excludePathPatterns("/board/detail/**");
		
/*		
*		registry.addInterceptor(new AdminInterceptor())
*		.addPathPatterns("/admin/**");
*/
	}
}