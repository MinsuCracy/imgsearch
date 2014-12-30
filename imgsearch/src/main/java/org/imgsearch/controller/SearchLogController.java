package org.imgsearch.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.service.SearchLogService;
import org.imgsearch.vo.SearchLogVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/searchlog/*")
public class SearchLogController {
	
	
	@Inject
	SearchLogService sls;
	
	SearchLogVO vo = new SearchLogVO();

	private static final Logger logger = LoggerFactory.getLogger(SearchLogController.class);
	
	@RequestMapping("/")
	public String sendSearchLogList(){
		return "redirect:/admin/searchlog/list";
	}
	
	
	@RequestMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri){
		
		cri.setTotalPage(sls.searchLogCount(cri));
		List<SearchLogVO> list = sls.searchLogList(cri);
		List<SearchLogVO> fEnt = sls.favoriteEnt();
		List<SearchLogVO> fKey = sls.favoriteKeyword();
		
		
		model.addAttribute("searchLogList", list);
		model.addAttribute("favoriteEntList", fEnt);
		model.addAttribute("favoriteKeyList", fKey);
		
	}
	
	

}
