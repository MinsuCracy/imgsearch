package org.imgsearch.controller;

import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/usermanagement")
	public void usermanagement(){
		logger.info("첫 페이지로 보냅니다.");
	}
	

}
