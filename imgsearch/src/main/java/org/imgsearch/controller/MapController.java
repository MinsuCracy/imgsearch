package org.imgsearch.controller;

import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/fri/*")
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@RequestMapping(value="/map/{id}", method=RequestMethod.GET)
	public String map(@PathVariable("id")String id, Model model){
		System.out.println("map 컨트롤러");
		logger.info("map 컨트롤러");
		model.addAttribute("id", id);
		return "/fri/map"; 
		
	}
}
