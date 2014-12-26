package org.imgsearch.controller;

import java.security.Principal;

import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/loginform")
	public String loginForm(){
		logger.info("로그인 컨트롤 입장");
		return "/user/login";
	}
	@RequestMapping("/login")
	public String login(Model model, Principal principal){
		model.addAttribute("loginForm", true);
		return "/user/location";
	}
}
