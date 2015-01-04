package org.imgsearch.controller;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.service.StoreService;
import org.imgsearch.vo.CategoryVO;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.KeywordVO;
import org.imgsearch.vo.SEmatchVO;
import org.imgsearch.vo.SKmatchVO;
import org.imgsearch.vo.StoreImageVO;
import org.imgsearch.vo.StoreMenuVO;
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
	public String sendStore(){
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
	List<SKmatchVO> kvolist = storeservice.keylistview();
		logger.info("kvolist:"+kvolist);
	List<CategoryVO> cvolist = storeservice.catelistview();
		logger.info("cvolist"+cvolist);
		model.addAttribute("elist", elist);
		model.addAttribute("kvolist", kvolist);
		model.addAttribute("cvolist", cvolist);
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String storeregist(@ModelAttribute("cri") Criteria cri, StoreVO vo, String [] siimg, int entfirst, int entsecond, int entthird, CategoryVO cvo, int [] kno, String [] smmenu, int [] smprice) {
		
		logger.info("regist vo :"+ vo);
		
		storeservice.storeregist(vo);
		StoreVO newvo = storeservice.storelast();
		logger.info("regist newvo :"+ newvo );
		
		logger.info("siimg:"+siimg);
		if(siimg != null) {
		for(int i = 0 ; i < siimg.length ; i++){
		StoreImageVO ivo = new StoreImageVO();
			ivo.setS_no(newvo.getS_no());
			ivo.setSi_img(siimg[i]);
			storeservice.storeiregist(ivo);
		}}
		
//		EntVO newentvo1 = storeservice.entnumfinder(entvo1);
//		EntVO newentvo2 = storeservice.entnumfinder(entvo2);
//		EntVO newentvo3 = storeservice.entnumfinder(entvo3);
		
		logger.info("entvo1:" + entfirst);
		logger.info("entvo2:" + entsecond);
		logger.info("entvo3:" + entthird);
		
		
		SEmatchVO newevo1 = new SEmatchVO();
		SEmatchVO newevo2 = new SEmatchVO();
		SEmatchVO newevo3 = new SEmatchVO();
		
		newevo1.setS_no(newvo.getS_no());
		newevo2.setS_no(newvo.getS_no());
		newevo3.setS_no(newvo.getS_no());
		
		newevo1.setE_no(entfirst);
		newevo2.setE_no(entsecond);
		newevo3.setE_no(entthird);
		
		storeservice.storeeregist(newevo1);
		storeservice.storeeregist(newevo2);
		storeservice.storeeregist(newevo3);
		
		
		StoreMenuVO mvo = new StoreMenuVO();
		if(smmenu != null) {
		for (int i= 0 ; i < smmenu.length ; i++){
			
		mvo.setS_no(newvo.getS_no());
		mvo.setSm_menu(smmenu[i]);
		mvo.setSm_price(smprice[i]);;
		storeservice.storemregist(mvo);
		}
		}
		if(cvo != null) {
		cvo.setS_no(newvo.getS_no());
		storeservice.storecregist(cvo);}
		if(kno != null) {
		for (int j = 0 ; j < kno.length ; j++){
			SKmatchVO kvo = new SKmatchVO();
			kvo.setS_no(newvo.getS_no());
			kvo.setK_no(kno[j]);
			storeservice.storeskmregist(kvo);
			
		}}
		
		return "redirect:/admin/store/storelist";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void storeview(@ModelAttribute("cri") Criteria cri, StoreVO vo, StoreImageVO ivo, Model model) {
		
		vo = storeservice.storeview(vo);
		logger.info("vo :"+vo);
		List<StoreImageVO> ivolist = storeservice.storeiview(vo);
		logger.info("ivolist :"+ivolist);
		List<SEmatchVO> evolist = storeservice.storeseview(vo);
		logger.info("evolist :"+evolist);
	if(evolist.size() != 0)	{
		for(int i=0; i<evolist.size(); i++){
		
	  String e_name = storeservice.entnamefinder(evolist.get(i).getE_no());
	
	  
	  	SEmatchVO newevo = new SEmatchVO();
	  	
	  	newevo.setE_no(evolist.get(i).getE_no());
	  	newevo.setE_name(e_name);
		evolist.set(i, newevo);
	
		}
		
	}
	  	List<StoreMenuVO> mvolist =storeservice.storemview(vo);
	  	logger.info("mvolist:"+mvolist);
	  	
	  	
	  
	  	
	  	
	  	
	  	int reserv = storeservice.storersview(vo);
	  	int menuview = storeservice.storemvview(vo);
	  	int matchpoint = reserv*3 + menuview ;
	  	logger.info("matchpoint:"+matchpoint);
	  	
	  	//category
	  	 CategoryVO scvo =  storeservice.storescview(vo);
	  	logger.info("scvo:"+scvo);
	  	scvo = storeservice.storecview(scvo);
	  	logger.info("scvo:"+scvo);
	  	CategoryVO scvop1 = new CategoryVO();
	  	if(scvo != null){
		  	scvop1.setC_no(scvo.getC_parent());
		  	scvop1 = storeservice.storecview(scvop1);
		  	if(scvop1 != null){
			  	CategoryVO scvop2 = new CategoryVO();
			  	scvop2.setC_no(scvop1.getC_parent());
			  	scvop2 = storeservice.storecview(scvop2);
				scvop2 = storeservice.storecview(scvop2);
			  	model.addAttribute("scvop2", scvop2);
		  	}
		  	
			model.addAttribute("scvo", scvo);
			model.addAttribute("scvop1", scvop1);
	  	}
	  //keyword
	  	
	  	List<KeywordVO> kvolist = storeservice.storeskmview(vo);
	  	logger.info("vo:"+vo);
	  	if(kvolist.size() != 0){
		  	for(int i = 0; i < kvolist.size() ; i++ ){
		  	
		  		KeywordVO kvo = kvolist.get(i);
		  		KeywordVO newkvo = storeservice.sotrekview(kvo);
		  	 	kvo.setK_keyword(newkvo.getK_keyword());
		  	
		  		
		  	}
	  	}
	  	
	  	logger.info("kvolist:"+kvolist);
	  	
	  	
		model.addAttribute("vo", vo);
		model.addAttribute("ivolist", ivolist);
		model.addAttribute("evolist", evolist);
		model.addAttribute("mvolist", mvolist);
		model.addAttribute("matchpoint", matchpoint);
	
	
		model.addAttribute("kvolist", kvolist);
		
		
		
		
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void storemodify(@ModelAttribute("cri") Criteria cri, @ModelAttribute("vo") StoreVO vo, Model model){
		
		
		
		vo = storeservice.storeview(vo);
		logger.info("vo :"+vo);
		List<StoreImageVO> ivolist = storeservice.storeiview(vo);
		logger.info("ivolist :"+ivolist);
		List<SEmatchVO> evolist = storeservice.storeseview(vo);
		logger.info("evolist :"+evolist);
		if(evolist.size() != 0)	{
			for(int i=0; i<evolist.size(); i++){
			
		  String e_name = storeservice.entnamefinder(evolist.get(i).getE_no());
		
		  
		  	SEmatchVO newevo = new SEmatchVO();
		  	
		  	newevo.setE_no(evolist.get(i).getE_no());
		  	newevo.setE_name(e_name);
			evolist.set(i, newevo);
		
			}}
	  	List<StoreMenuVO> mvolist =storeservice.storemview(vo);
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
		
		List<CategoryVO> cvolist = storeservice.catelistview();
		logger.info("cvolist"+cvolist);
		
		
		
		
		List<KeywordVO> kvolist = storeservice.storeskmview(vo);
	  	logger.info("vo:"+vo);
	  	if(kvolist.size() != 0) {
		  	for(int i = 0; i < kvolist.size() ; i++ ){
		  	
		  		KeywordVO kvo = kvolist.get(i);
		  		KeywordVO newkvo = storeservice.sotrekview(kvo);
		  	 	kvo.setK_keyword(newkvo.getK_keyword());
		  	
		  		
		  	}
	  	}
	  	logger.info("kvolist:"+kvolist);
	  	
	  	
		
		
		model.addAttribute("elist", elist);
		model.addAttribute("kvolist", kvolist);
		model.addAttribute("cvolist", cvolist);
		
		
		//category
	  	CategoryVO scvo =  storeservice.storescview(vo);
	  	logger.info("scvo:"+scvo);
	  	scvo = storeservice.storecview(scvo);
	  	logger.info("scvo:"+scvo);
	  	if(scvo != null) {
	  	CategoryVO scvop1 = new CategoryVO();
	  	scvop1.setC_no(scvo.getC_parent());
	  	scvop1 = storeservice.storecview(scvop1);
	  	if(scvop1 != null) {
	  	CategoryVO scvop2 = new CategoryVO();
	  	scvop2.setC_no(scvop1.getC_parent());
	  	scvop2 = storeservice.storecview(scvop2);
	  	
	  	model.addAttribute("scvo", scvo);
		model.addAttribute("scvop1", scvop1);
		model.addAttribute("scvop2", scvop2);
	  	}
	  	}
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String storemodify(@ModelAttribute("cri") Criteria cri,StoreVO vo, String [] siimg, int entfirst, int entsecond, int entthird, CategoryVO cvo, int [] kno, String [] smmenu, int [] smprice){
		
		storeservice.storemodify(vo);
		
logger.info("regist vo :"+ vo);
		
		
	logger.info("siimg:"+siimg);
		storeservice.storeiremove(vo);
	if(siimg != null){	
	for(int i = 0 ; i < siimg.length ; i++){
		StoreImageVO ivo = new StoreImageVO();
		
		ivo.setS_no(vo.getS_no());
		ivo.setSi_img(siimg[i]);
		storeservice.storeiregist(ivo);
		}
	}
		logger.info("entvo1:" + entfirst);
		logger.info("entvo2:" + entsecond);
		logger.info("entvo3:" + entthird);
		
		
		SEmatchVO newevo1 = new SEmatchVO();
		SEmatchVO newevo2 = new SEmatchVO();
		SEmatchVO newevo3 = new SEmatchVO();
		
		newevo1.setS_no(vo.getS_no());
		newevo2.setS_no(vo.getS_no());
		newevo3.setS_no(vo.getS_no());
		
		newevo1.setE_no(entfirst);
		newevo2.setE_no(entsecond);
		newevo3.setE_no(entthird);
		
		storeservice.storeemodify(newevo1);
		storeservice.storeemodify(newevo2);
		storeservice.storeemodify(newevo1);
		
		
		
		
		StoreMenuVO mvo = new StoreMenuVO();
		storeservice.storemremove(vo);
		if(smmenu != null){
		for (int i= 0 ; i < smmenu.length ; i++){
			
		mvo.setS_no(vo.getS_no());
		mvo.setSm_menu(smmenu[i]);
		mvo.setSm_price(smprice[i]);;
		storeservice.storemregist(mvo);
		}
		}
		
		if(cvo != null) {
		cvo.setS_no(vo.getS_no());
		storeservice.storescmmodify(cvo);
		}
		
		SKmatchVO kvo = new SKmatchVO();
		storeservice.storeskmremove(vo);
		if(kno != null) {
		for (int j = 0 ; j < kno.length ; j++){
			
			kvo.setS_no(vo.getS_no());
			kvo.setK_no(kno[j]);
			storeservice.storeskmregist(kvo);
			
		}}
		
		return "redirect:/admin/store/storelist";
		
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String storeremove(@ModelAttribute("cri") Criteria cri,StoreVO vo) {
		
		storeservice.storeiremove(vo);
		storeservice.storeeremove(vo);
		storeservice.storemremove(vo);
		storeservice.storeskmremove(vo);
		storeservice.storescmremove(vo);
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
	public List<CategoryVO> storecategory(StoreVO vo, int cno, Model model)
	{
		CategoryVO cvo = new CategoryVO();
		
		logger.info("cno:"+cno);
		
		
		cvo.setC_parent(cno);
		
		return storeservice.storecategory(cvo);
		
	}
	
	
	
	@RequestMapping(value="/keyword", method = RequestMethod.GET,produces = "application/json")
	@ResponseBody
	public List<SKmatchVO> keywordchoice(SKmatchVO kvo, String keynumlist) 
	{
	
	logger.info(keynumlist);

	
	
	
	
	
	List<SKmatchVO> kvolist = storeservice.keywordchoice(kvo);
	
	logger.info("kvolist:"+kvolist);

	logger.info("kvolist:"+kvolist);
		return kvolist;

	}
	
	
	@RequestMapping(value="/keynumber", method = RequestMethod.GET)
	@ResponseBody
	public KeywordVO keynumberchoice(KeywordVO kvo){
		logger.info("kvo:"+kvo);
		
		return storeservice.sotrekview(kvo);
	}
	
}
