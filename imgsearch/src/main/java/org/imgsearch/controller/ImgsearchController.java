package org.imgsearch.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.imgsearch.service.UserService;
import org.imgsearch.vo.UserVO;
import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/img")
public class ImgsearchController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Inject
	private UserService userService;
	
	@RequestMapping("/location")
	public String index(Principal principal, Model model)throws Exception{
		
			logger.info("컨트롤로 입장 location");
			logger.info("uno 값 : "  + userService.getUno());
			model.addAttribute("uno" , userService.getUno());
			model.addAttribute("id", principal.getName());
			logger.info(" 로그인 아이디 : " + principal.getName());
		return "/user/location";
	}

	@RequestMapping("/index")
	public void index()throws Exception{}
		

	@RequestMapping("/insertFriend")
	public void insertFriend(UserVO vo)throws Exception{
		userService.insertFriend(userService.existFriend(vo));
	}

}

