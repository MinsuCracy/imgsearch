package org.imgsearch.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.imgsearch.service.UserService;
import org.imgsearch.vo.StoreVO;
import org.imgsearch.vo.UserVO;
import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/user/*")
public class ImgsearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Inject
	private UserService userService;
	
	@RequestMapping("/location")
	public String index(Principal principal, Model model)throws Exception{
		
			model.addAttribute("id", principal.getName());
			logger.info(" 로그인 아이디 : " + principal.getName());
		return "/user/location";
	}
	@RequestMapping("/friendlist")
	@ResponseBody
	public List<UserVO> friendList(Principal principal)throws Exception{
		if(principal != null){
			return userService.frienList(principal.getName());
		}
		return null;
	}
	@RequestMapping("/bookmarklist")
	@ResponseBody
	public List<StoreVO> getBookMark(Principal principal)throws Exception{
		if(principal != null){
			return userService.getBookMark(principal.getName());
		}
		return null;
	}
	
}

