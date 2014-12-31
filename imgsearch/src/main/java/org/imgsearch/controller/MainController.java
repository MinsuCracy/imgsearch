package org.imgsearch.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.service.MainService;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.StoreReviewVO;
import org.imgsearch.vo.StoreVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/img/*")
public class MainController {

//	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	@Inject
	private MainService service;
	
	
	@RequestMapping("/")
	public String index(@ModelAttribute("cri") Criteria cri){
		
		return "redirect:/img/main";
	}
	
	@RequestMapping("/main")
	public void main(@ModelAttribute("cri") Criteria cri, Principal principal, Model model)throws Exception{
		if(principal != null){
			model.addAttribute("id", principal.getName());
		}
	}
	
		
	@RequestMapping("/entImg")
	public @ResponseBody List<EntVO> mainImg(@ModelAttribute("cri") Criteria cri){
	
				
		return service.entImg(cri);
	
	}
	
	@RequestMapping("/entImgTotal")
	public @ResponseBody int mainImgTotal(){
		return service.entImgTotal();
	}
	
		
	@RequestMapping("/storeList")
	public void storeList(Model model,@ModelAttribute("cri") Criteria cri){
		// �������� ����Ұ�... Ʈ���� ĳġ.. ���� �������� throws��..
		
		// ��Ʈ�ѷ����� ���������� �������� ���;ߵ�... ������ ����..�ϴ� ��Ʈ������ ��ü�Ѵ�..
		cri.setU_no(55);
		// �𵨿� ����Ʈ ���
		List<StoreVO> list = service.storeList(cri);
		cri.setTotalPage(service.storeTotal(cri));
		model.addAttribute("storeList", list);
		model.addAttribute("imgList", service.storeMainImgList(list));
		
		
//		System.out.println("����?");
		
		//service.storeImgList(list);
		// searchLogd ���񽺿����� 
		// �˻���� ����
		// ���� ���������� ���� ���⿡ �ݿ�
		// ���� ������ �˻�ī��Ʈ �߰�.
//		service.searchLog(cri);
		
	}
	

	
	// ���ѽ�ũ��
	@RequestMapping("/list2")
	public @ResponseBody List<StoreVO> storeList2(Model model, @ModelAttribute("cri") Criteria cri){
		
		return service.storeList(cri);
	
	}
	
	@RequestMapping("/view")
	public void storeView(Model model, @ModelAttribute("cri") Criteria cri){
		model.addAttribute("vo", service.storeView(cri));
		model.addAttribute("imgList", service.storeImgList(cri));
	}
	
	
	@RequestMapping("/review")
	public @ResponseBody List<StoreReviewVO> storeReview(Model model,@ModelAttribute("cri") Criteria cri){
		return service.storeReview(cri); 
	}
	
	
	
	
	
	
	
}


