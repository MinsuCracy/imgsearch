package org.imgsearch.controller;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.service.EntService;
import org.imgsearch.vo.EntVO;
import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/ent/*")
public class EntController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private EntService entService;
	
	@RequestMapping("/")
	public String entTestList() {
		return "redirect:/admin/ent/list";
	}
	
	// ����Ʈ
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void entList(Model model, @ModelAttribute("cri") Criteria cri)throws Exception {		
		cri.setTotalPage(entService.entTotal(cri));
		model.addAttribute("entList", entService.entList(cri));
		model.addAttribute("cri", cri);
	}
	
	// ��ȸ
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public void entRead(Model model, int e_no, @ModelAttribute("cri") Criteria cri) throws Exception {
		
		logger.info("view cri >>>>>>> " + cri.toString());
		
		model.addAttribute("ent", entService.entRead(e_no));
		model.addAttribute("entStore", entService.entStore(e_no));
		model.addAttribute("cri", cri);
	}
	
	// ��� ȭ��
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public void entRegist() throws Exception { }
	
	// ��� �۾�
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String entRegist(@ModelAttribute("ent") EntVO ent) throws Exception {
		entService.entRegist(ent);
		return "redirect:/admin/ent/registSuccess";
	}
	
	// ��� �Ϸ�
	@RequestMapping("/registSuccess")
	public void entRegistSuccess() { }
	
	// ���� ȭ��
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void entModify(Model model, int e_no) throws Exception {
		model.addAttribute("ent", entService.entRead(e_no));
	}
	
	// ���� �۾�
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String entModify(@ModelAttribute("ent") EntVO ent) throws Exception {
		entService.entModify(ent);
		return "redirect:/admin/ent/modifySuccess?e_no=" + ent.getE_no();
	}
	
	// ���� �Ϸ�
	@RequestMapping("/modifySuccess")
	public void entModifySuccess(Model model, int e_no) {
		model.addAttribute("e_no", e_no);
	}
	
	// ����
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String entRemove(int e_no) throws Exception {
		entService.entRemove(e_no);
		return "redirect:/admin/ent/list";
	}
	
}
