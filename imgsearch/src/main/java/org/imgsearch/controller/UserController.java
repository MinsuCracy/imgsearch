package org.imgsearch.controller;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.service.UserService;
import org.imgsearch.vo.UserVO;
import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("admin/user/*")
public class UserController {
	
	@Inject
	UserService us;
	
	UserVO vo = new UserVO();
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String sendList(){
		return "redirect:/admin/user/list";
	}
	
	
	@RequestMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri){
		cri.setTotalPage(us.userCount(cri.getDbLimitTotal()));

		logger.info("result       "+cri.getDbLimit());
		logger.info("total : "+ cri.getTotalPage());
		logger.info("start : "+ cri.getStartPage());
		logger.info("last  :"+cri.getLastPage());
		
		List<UserVO> userList = us.userList(cri.getDbLimit());
		model.addAttribute("userList", userList);
		
	}
	
	
	
	@RequestMapping("/regist")
	public void uIPage(){
		
	}
	
	
	
//	���� ������ ���� ��Ʈ�ѷ�
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String userInsert(UserVO vo){
		logger.info(vo.toString());
		String result = us.userInsert(vo);
		logger.info(result);
		
		if(result=="fail"){
			return "redirect:/admin/user/fail";
		}
		return "redirect:/admin/user/success";
	}
	
	@RequestMapping("/fail")
	public void fail(){
	}
	@RequestMapping("/success")
	public void success(){
	}
		
	
//	id �Ǵ� email�� ��ȸ ��Ʈ�ѷ�
	@RequestMapping(value = "/inquiry", method = RequestMethod.GET)
	public String userInquriy(Model model, String inputData){
		logger.info("*********************"+inputData+"*************************");
		List<UserVO> list;
		
		if(inputData != null){
			list = us.userInquiry(inputData);
		}else{
			list = null;
		}
		model.addAttribute("userList", list);
		model.addAttribute("inputData", inputData);
		return "admin/user/list";
	}
	
	
/*
//	ȸ�� ��ü ����Ʈ�� ���� ��Ʈ�ѷ� ajax
	@RequestMapping(value = "/userlist", method = RequestMethod.GET)
	@ResponseBody
	public List<UserVO> userList(){
		
		List<UserVO> list = us.userList();
		return list;
	}*/
	
	
//	ȸ�� ���� �б� ���� ��Ʈ�ѷ�
	@RequestMapping("/view")
	public void urPage(Model model, @ModelAttribute("vo") UserVO vo){
		vo = us.userRead(vo);
		model.addAttribute("vo", vo);
		
	}
	
	
//	ȸ�� ���� ������ ���� ��Ʈ�ѷ�
	@RequestMapping("/modify")
	public void uuPage(Model model, @ModelAttribute("vo") UserVO vo){
		vo = us.userRead(vo);
		model.addAttribute("vo", vo);

	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String userUpdate(UserVO vo, Model model){
		String result;
		result = us.userUpdate(vo);
		logger.info(vo.toString());
		if(result.equals("fail")){
			model.addAttribute("result", "fail");
			return "redirect:/admin/user/fail";
		}
		
		model.addAttribute("result", "good");
		return "redirect:/admin/user/success";
	}
	
	
	
//	ȸ�� ���� ������ ���� ��Ʈ�ѷ�
	
	
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public String userDelete(UserVO vo){
		String result = us.userDelete(vo);
		logger.info(result);
		
		return "redirect:/admin/user/list";
		
	}
	

} //end class