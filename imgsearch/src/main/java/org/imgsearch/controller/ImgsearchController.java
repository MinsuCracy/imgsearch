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
public class ImgsearchController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/location")
	public String index(Principal principal, Model model)throws Exception{
		model.addAttribute("id", principal.getName());
		logger.info(" 로그인 아이디 : " + principal.getName());
		return "/user/location";
	}
}

