package org.imgsearch.controller;

import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/*")
public class LoginController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/loginform")
	public String loginForm(){
		logger.info("�α��� ��Ʈ�� ����");
		return "redirect:/user/login";
	}
	@RequestMapping("/login")
	public void login(Model model){
		logger.info("�α��� fasdfasdfasdf");
//		model.addAttribute("loginForm", true);
	}
}


