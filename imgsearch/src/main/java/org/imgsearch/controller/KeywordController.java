package org.imgsearch.controller;

import javax.inject.Inject;

import org.imgsearch.service.AdminService;
import org.imgsearch.vo.KeywordVO;
import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/keyword/*")
public class KeywordController {
	
	@Inject
	private AdminService as;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void keywordInsert(KeywordVO vo)throws Exception{
		as.keywordInsert(vo);
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void keywordSelect(Model model)throws Exception{
		model.addAttribute("list", as.keywordSelect());
		
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void keywordUpdate(KeywordVO vo)throws Exception{
		as.keywordUpdate(vo);
	}
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void keywordDelete(int k_no)throws Exception{
		as.keywordDelete(k_no);
	}
	
	
	
	
}
