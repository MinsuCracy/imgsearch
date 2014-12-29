package org.imgsearch.controller;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.service.UserLogService;
import org.imgsearch.vo.UserLogVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/userlog/*")
public class UserLogController {
	
	@Inject
	UserLogService ls;
	
	UserLogVO vo = new UserLogVO();
	
	private static final Logger logger = LoggerFactory.getLogger(UserLogController.class);

	@RequestMapping("/")
	public String sendList(){
		return "redirect:/admin/userlog/list";
	}
		
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Model model, @ModelAttribute("cri") Criteria cri){
		
		 cri.setTotalPage(ls.userLogTotalCount(cri));
		 
		 List<UserLogVO> userLogList = ls.userLogList(cri);
		 
		 model.addAttribute("userLogList", userLogList);
		
	}
	
	

}
