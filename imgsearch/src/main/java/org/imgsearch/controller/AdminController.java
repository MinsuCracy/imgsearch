package org.imgsearch.controller;

import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/main")
	public void main()throws Exception{
		
	}
	@RequestMapping(value="/user")
	public void user()throws Exception{
		
	}
	@RequestMapping(value="/userlog")
	public void userlog()throws Exception{
	
	}
	@RequestMapping(value="/user/read")
	public String userRead()throws Exception{
		return "admin/userRead";
	}
	@RequestMapping(value="/ent")
	public void ent()throws Exception{
		
	}
	@RequestMapping(value="/ent/insert")
	public String entInsertForm()throws Exception{
		return "admin/entInsert";
	}
	@RequestMapping(value="/ent/read")
	public String entReadForm()throws Exception{
		return "admin/entRead";
	}
	@RequestMapping(value="/ent/update")
	public String entUpdateForm()throws Exception{
		return "admin/entUpdate";
	}
	@RequestMapping(value="/store")
	public void store()throws Exception{
	}
	@RequestMapping(value="/store/read")
	public String storeRead()throws Exception{
		return "admin/storeRead";
	}
	@RequestMapping(value="/store/insert")
	public String storeInsert()throws Exception{
		return "admin/storeInsert";
	}
	@RequestMapping(value="/store/update")
	public String storeUpdate()throws Exception{
		return "admin/storeUpdate";
	}
	
	@RequestMapping(value="/log")
	public void log()throws Exception{
	}
	
	
}
