package org.imgsearch.controller;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.service.UserLogService;
import org.imgsearch.vo.UserLogVO;
import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("admin/userlog/*")
public class UserLogController {
	
	@Inject
	UserLogService ls;
	
	UserLogVO vo = new UserLogVO();
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/")
	public String sendList(){
		return "redirect:/admin/userlog/list";
	}
		
	//Ajax·Î userlog º¸³À´Ï´Ù.
	@RequestMapping(value="/list", method=RequestMethod.POST)
	@ResponseBody
	public List list(@ModelAttribute("ucri") Criteria cri){
		
		 cri.setTotalPage(ls.userLogTotalCount(cri));
		 List<UserLogVO> userLogList = ls.userLogList(cri);
		 
		 return userLogList;
		
	}
	
	@RequestMapping(value="/test", method=RequestMethod.POST)
	@ResponseBody
	public Criteria test(@ModelAttribute("ucri") Criteria cri){
	
		 cri.setTotalPage(ls.userLogTotalCount(cri));

		 logger.info("dblimit : "+cri.getDbLimit());
		 logger.info("dblimittotal : "+cri.getDbLimitTotal());
		 logger.info("page : "+cri.getPage());
		 logger.info("start : "+cri.getStartPage());
		 logger.info("last : "+cri.getLastPage());
		 logger.info("total : "+cri.getTotalPage());
		 logger.info("pre : "+cri.isPrePage());
		 logger.info("next : "+cri.isNextPage());
		 
		 
		 return cri;
		
	}
	

}
