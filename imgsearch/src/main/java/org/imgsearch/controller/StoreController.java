package org.imgsearch.controller;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.service.StoreService;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.StoreCVO;
import org.imgsearch.vo.StoreEVO;
import org.imgsearch.vo.StoreImageVO;
import org.imgsearch.vo.StoreKVO;
import org.imgsearch.vo.StoreMVO;
import org.imgsearch.vo.StoreReviewVO;
import org.imgsearch.vo.StoreVO;
import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/admin/store/*")
public class StoreController {
	
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	StoreService storeservice;
	
	@RequestMapping("/")
	public String sendList(){
		
		return "redirect:/admin/store/storelist";
	}

	@RequestMapping(value = "/storelist", method = RequestMethod.GET)
	public  String storelist( @ModelAttribute("cri") Criteria cri, Model model) {
		
		int total = storeservice.storecount(cri);
		cri.setTotalPage(total);
		List<StoreVO> list = storeservice.storelist(cri);
		logger.info("cri:"+cri);
		model.addAttribute("list", list);
		model.addAttribute("cri", cri);
				return "/admin/store/storelist";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public void storeregist(@ModelAttribute("cri") Criteria cri, @ModelAttribute("vo") StoreVO vo, EntVO evo, Model model) {
	List<EntVO> elist = storeservice.entlistview();
		logger.info("elist:"+ elist);
	List<StoreKVO> kvolist = storeservice.keylistview();
		logger.info("kvolist:"+kvolist);
	List<StoreCVO> cvolist = storeservice.catelistview();
		logger.info("cvolist"+cvolist);
		model.addAttribute("elist", elist);
		model.addAttribute("kvolist", kvolist);
		model.addAttribute("cvolist", cvolist);
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String storeregist(@ModelAttribute("cri") Criteria cri, StoreVO vo, StoreImageVO ivo, int entno1, int entno2, int entno3, StoreMVO mvo, StoreCVO cvo) {
		
		logger.info("regist vo :"+ vo);
		
		storeservice.storeregist(vo);
		StoreVO newvo = storeservice.storelast();
		logger.info("regist newvo :"+ newvo );
		ivo.setS_no(newvo.getS_no());
		logger.info("regist ivo :"+ ivo );
		storeservice.storeiregist(ivo);
		
//		EntVO newentvo1 = storeservice.entnumfinder(entvo1);
//		EntVO newentvo2 = storeservice.entnumfinder(entvo2);
//		EntVO newentvo3 = storeservice.entnumfinder(entvo3);
		
		logger.info("entvo1:" + entno1);
		logger.info("entvo2:" + entno2);
		logger.info("entvo3:" + entno3);
		
		
		StoreEVO newevo1 = new StoreEVO();
		StoreEVO newevo2 = new StoreEVO();
		StoreEVO newevo3 = new StoreEVO();
		
		newevo1.setS_no(newvo.getS_no());
		newevo2.setS_no(newvo.getS_no());
		newevo3.setS_no(newvo.getS_no());
		
		newevo1.setE_no(entno1);
		newevo2.setE_no(entno2);
		newevo3.setE_no(entno3);
		
		storeservice.storeeregist(newevo1);
		storeservice.storeeregist(newevo2);
		storeservice.storeeregist(newevo3);
		
		mvo.setS_no(newvo.getS_no());
		storeservice.storemregist(mvo);
		
		cvo.setS_no(newvo.getS_no());
		storeservice.storecregist(cvo);
		return "redirect:/admin/store/storelist";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void storeview(@ModelAttribute("cri") Criteria cri, StoreVO vo, StoreImageVO ivo, Model model) {
		
		vo = storeservice.storeview(vo);
		logger.info("vo :"+vo);
		List<StoreImageVO> ivolist = storeservice.storeiview(vo);
		logger.info("ivolist :"+ivolist);
		List<StoreEVO> evolist = storeservice.storeseview(vo);
		logger.info("evolist :"+evolist);
	  String e_name1 = storeservice.entnamefinder(evolist.get(0).getE_no());
	  String e_name2 = storeservice.entnamefinder(evolist.get(1).getE_no());
	  String e_name3 = storeservice.entnamefinder(evolist.get(2).getE_no());
	  	logger.info("e_name1:"+e_name1);
		logger.info("e_name2:"+e_name2);
		logger.info("e_name3:"+e_name3);
		   
	  
	  	StoreEVO newevo1 = new StoreEVO();
	  	StoreEVO newevo2 = new StoreEVO();
	  	StoreEVO newevo3 = new StoreEVO();
	  	
	  	newevo1.setE_no(evolist.get(0).getE_no());
	  	newevo1.setE_name(e_name1);
		evolist.set(0, newevo1);
		newevo2.setE_no(evolist.get(1).getE_no());
	  	newevo2.setE_name(e_name2);
	  	evolist.set(1, newevo2);
	  	newevo3.setE_no(evolist.get(2).getE_no());
	  	newevo3.setE_name(e_name3);
	  	evolist.set(2, newevo3);
		
		
	  	List<StoreMVO> mvolist =storeservice.storemview(vo);
	  	logger.info("mvolist:"+mvolist);
	  	
	  	
	  
	  	
	  	
	  	
	  	int reserv = storeservice.storersview(vo);
	  	int menuview = storeservice.storemvview(vo);
	  	int matchpoint = reserv*3 + menuview ;
	  	logger.info("matchpoint:"+matchpoint);
	  	
	  	//category
	  	 StoreCVO scvo =  storeservice.storescview(vo);
	  	logger.info("scvo:"+scvo);
	  	scvo = storeservice.storecview(scvo);
	  	logger.info("scvo:"+scvo);
	  	StoreCVO scvop1 = new StoreCVO();
	  	scvop1.setC_no(scvo.getC_parent());
	  	scvop1 = storeservice.storecview(scvop1);
	  	StoreCVO scvop2 = new StoreCVO();
	  	scvop2.setC_no(scvop1.getC_parent());
	  	scvop2 = storeservice.storecview(scvop2);
	  	
	  	
	  	
		model.addAttribute("vo", vo);
		model.addAttribute("ivolist", ivolist);
		model.addAttribute("evolist", evolist);
		model.addAttribute("mvolist", mvolist);
		model.addAttribute("matchpoint", matchpoint);
		model.addAttribute("scvo", scvo);
		model.addAttribute("scvop1", scvop1);
		model.addAttribute("scvop2", scvop2);
		
		
		
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void storemodify(@ModelAttribute("cri") Criteria cri, @ModelAttribute("vo") StoreVO vo, Model model){
		
		
		
		vo = storeservice.storeview(vo);
		logger.info("vo :"+vo);
		List<StoreImageVO> ivolist = storeservice.storeiview(vo);
		logger.info("ivolist :"+ivolist);
		List<StoreEVO> evolist = storeservice.storeseview(vo);
		logger.info("evolist :"+evolist);
	  String e_name1 = storeservice.entnamefinder(evolist.get(0).getE_no());
	  String e_name2 = storeservice.entnamefinder(evolist.get(1).getE_no());
	  String e_name3 = storeservice.entnamefinder(evolist.get(2).getE_no());
	  	logger.info("e_name1:"+e_name1);
		logger.info("e_name2:"+e_name2);
		logger.info("e_name3:"+e_name3);
		   
	  
	  	StoreEVO newevo1 = new StoreEVO();
	  	StoreEVO newevo2 = new StoreEVO();
	  	StoreEVO newevo3 = new StoreEVO();
	  	
	  	newevo1.setE_no(evolist.get(0).getE_no());
	  	newevo1.setE_name(e_name1);
		evolist.set(0, newevo1);
		newevo2.setE_no(evolist.get(1).getE_no());
	  	newevo2.setE_name(e_name2);
	  	evolist.set(1, newevo2);
	  	newevo3.setE_no(evolist.get(2).getE_no());
	  	newevo3.setE_name(e_name3);
	  	evolist.set(2, newevo3);
		
		
	  	List<StoreMVO> mvolist =storeservice.storemview(vo);
	  	logger.info("mvolist:"+mvolist);
	  	
	  	
	  	
	  	
	  	int reserv = storeservice.storersview(vo);
	  	int menuview = storeservice.storemvview(vo);
	  	int matchpoint = reserv*3 + menuview ;
	  	logger.info("matchpoint:"+matchpoint);
	  	
		model.addAttribute("vo", vo);
		model.addAttribute("ivolist", ivolist);
		model.addAttribute("evolist", evolist);
		model.addAttribute("mvolist", mvolist);
		model.addAttribute("matchpoint", matchpoint);
		
		
		List<EntVO> elist = storeservice.entlistview();
		logger.info("elist:"+ elist);
		List<StoreKVO> kvolist = storeservice.keylistview();
		logger.info("kvolist:"+kvolist);
		List<StoreCVO> cvolist = storeservice.catelistview();
		logger.info("cvolist"+cvolist);
		model.addAttribute("elist", elist);
		model.addAttribute("kvolist", kvolist);
		model.addAttribute("cvolist", cvolist);
		
		
		//category
	  	 StoreCVO scvo =  storeservice.storescview(vo);
	  	logger.info("scvo:"+scvo);
	  	scvo = storeservice.storecview(scvo);
	  	logger.info("scvo:"+scvo);
	  	StoreCVO scvop1 = new StoreCVO();
	  	scvop1.setC_no(scvo.getC_parent());
	  	scvop1 = storeservice.storecview(scvop1);
	  	StoreCVO scvop2 = new StoreCVO();
	  	scvop2.setC_no(scvop1.getC_parent());
	  	scvop2 = storeservice.storecview(scvop2);
	  	
	  	model.addAttribute("scvo", scvo);
		model.addAttribute("scvop1", scvop1);
		model.addAttribute("scvop2", scvop2);
		
		
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String storemodify(@ModelAttribute("cri") Criteria cri,StoreVO vo, StoreImageVO ivo, int entno1, int entno2, int entno3, StoreMVO mvo){
		
		storeservice.storemodify(vo);
		
logger.info("regist vo :"+ vo);
		
		storeservice.storeregist(vo);
		StoreVO newvo = storeservice.storelast();
		logger.info("regist newvo :"+ newvo );
		ivo.setS_no(newvo.getS_no());
		logger.info("regist ivo :"+ ivo );
		storeservice.storeiregist(ivo);

		logger.info("entvo1:" + entno1);
		logger.info("entvo2:" + entno2);
		logger.info("entvo3:" + entno3);
		
		
		StoreEVO newevo1 = new StoreEVO();
		StoreEVO newevo2 = new StoreEVO();
		StoreEVO newevo3 = new StoreEVO();
		
		newevo1.setS_no(newvo.getS_no());
		newevo2.setS_no(newvo.getS_no());
		newevo3.setS_no(newvo.getS_no());
		
		newevo1.setE_no(entno1);
		newevo2.setE_no(entno2);
		newevo3.setE_no(entno3);
		
		storeservice.storeeregist(newevo1);
		storeservice.storeeregist(newevo2);
		storeservice.storeeregist(newevo3);
		
		mvo.setS_no(newvo.getS_no());
		storeservice.storemregist(mvo);
		
		
		
		
		
		
		
		return "admin/store/storelist";
		
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String storeremove(@ModelAttribute("cri") Criteria cri,StoreVO vo) {
		
		storeservice.storeremove(vo);
		
		return "redirect:/admin/store/storelist";
	}
	
	@RequestMapping(value = "/review")
	@ResponseBody
	public List<StoreReviewVO> storereview(StoreVO vo, Model model)
	{	
		
		
		
		 return storeservice.storereview(vo);
		 
	}
	@RequestMapping(value ="/category")
	@ResponseBody
	public List<StoreCVO> storecategory(StoreVO vo, int cno, Model model)
	{
		StoreCVO cvo = new StoreCVO();
		
		logger.info("cno:"+cno);
		
		
		cvo.setC_parent(cno);
		
		return storeservice.storecategory(cvo);
		
	}
	@RequestMapping(value="/keyword")
	@ResponseBody
	public List<StoreKVO> keywordchoice(StoreKVO kvo)
	{
	
		
		logger.info("kvo:"+kvo);
		
		List<StoreKVO> kvolist = storeservice.keywordchoice(kvo);
		logger.info("kvolist:"+kvolist);
		
		return kvolist;
		
		
	}
	
	
}
