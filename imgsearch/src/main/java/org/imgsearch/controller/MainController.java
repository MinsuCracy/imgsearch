package org.imgsearch.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.service.EntService;
import org.imgsearch.service.MainService;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.StoreReviewVO;
import org.imgsearch.vo.StoreVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/img/*")
public class MainController {

	@Inject
	private MainService service;
	
	@Inject
	private EntService entService;

	@RequestMapping("/")
	public String index(@ModelAttribute("cri") Criteria cri) {

		return "redirect:/img/main";
	}

	@RequestMapping("/main")
	public void main(@ModelAttribute("cri") Criteria cri, Principal principal,
			Model model) throws Exception {
		if (principal != null) {
			model.addAttribute("id", principal.getName());
		}
	}

	@RequestMapping("/entImg")
	public @ResponseBody List<EntVO> mainImg(@ModelAttribute("cri") Criteria cri) {

		return service.entImg(cri);

	}

	@RequestMapping("/entImgTotal")
	public @ResponseBody int mainImgTotal() {
		return service.entImgTotal();
	}

	@RequestMapping("/storeList")
	public void storeList(Model model, @ModelAttribute("cri") Criteria cri) {
		// 오류날때 대비할것... 트라이 캐치.. 하위 로직에선 throws로..

		// 컨트롤러에서 세션정보로 유저정보 따와야됨... 쓸데가 많슴..일단 인트값으로 대체한다..
		cri.setU_no(55);
		// 모델에 리스트 담기
		List<StoreVO> list = service.storeList(cri);
		cri.setTotalPage(service.storeTotal(cri));
		model.addAttribute("storeList", list);
		model.addAttribute("imgList", service.storeMainImgList(list));

		// System.out.println("뭐야?");

		// service.storeImgList(list);
		// searchLogd 서비스에서는
		// 검색기록 저장
		// 현재 연예인점수 나의 성향에 반영
		// 현재 연예인 검색카운트 추가.
		// service.searchLog(cri);

	}

	// 무한스크롤
	@RequestMapping("/list2")
	public @ResponseBody List<StoreVO> storeList2(Model model,
			@ModelAttribute("cri") Criteria cri) {

		return service.storeList(cri);

	}

	@RequestMapping("/view")
	public void storeView(Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("vo", service.storeView(cri));
		model.addAttribute("imgList", service.storeImgList(cri));
		model.addAttribute("cateList", service.storeCategory(cri));
		model.addAttribute("entList", service.storeEntMatch(cri));
	}

	@RequestMapping("/menuView")
	public void menuView(Model model, String name, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("menuList", service.storeMenuList(cri));
		model.addAttribute("store", name);
	}

	@RequestMapping("/store/reviewTotal")
	public @ResponseBody Criteria storeReviewCri(
			@ModelAttribute("cri") Criteria cri) {
		cri.setTotalPage(service.storeReviewTotal(cri));
		return cri;
	}

	@RequestMapping(value = "/store/reviewWrite", method = RequestMethod.POST)
	public @ResponseBody void storeReviewWrite(StoreReviewVO rvo) {
		System.out.println(rvo.toString());
		service.storeReviewWrite(rvo);
	}

	@RequestMapping("/store/review")
	public @ResponseBody List<StoreReviewVO> storeReview(
			@ModelAttribute("cri") Criteria cri) {
		return service.storeReview(cri);
	}

	@RequestMapping(value = "/store/reviewDelete", method = RequestMethod.POST)
	@ResponseBody
	public void storeReviewDelete(StoreReviewVO rvo) {
		service.storeReviewDelete(rvo);
	}

	@RequestMapping(value = "/store/reviewModify", method = RequestMethod.POST)
	@ResponseBody
	public void storeReviewModify(StoreReviewVO rvo) {
		service.storeReviewModify(rvo);
	}
	
	@RequestMapping("/entSearch")
	@ResponseBody
	public EntVO entSearch(String e_name) {
		return entService.entSearch(e_name);
	}

}
