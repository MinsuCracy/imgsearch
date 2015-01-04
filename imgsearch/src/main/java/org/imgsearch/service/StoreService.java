package org.imgsearch.service;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.mapper.StoreMapper;
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
import org.springframework.stereotype.Service;

@Service
public class StoreService implements StoreMapper {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	StoreMapper storemapper;
	
	@Override
	public List<StoreVO> storelist(Criteria cri) {
		return storemapper.storelist(cri);
	}
	
	@Override
	public int storecount(Criteria cri) {
		return storemapper.storecount(cri);
	}
	
	@Override
	public void storeregist(StoreVO vo){
		storemapper.storeregist(vo);
	}
	
	@Override
	public StoreVO storelast(){
		return storemapper.storelast();
	}
	
	@Override
	public StoreVO storeview(StoreVO vo) {
		return storemapper.storeview(vo);
	}
	
	@Override
	public void storemodify(StoreVO vo){
		storemapper.storemodify(vo);
	}
	
	@Override
	public void storeremove(StoreVO vo){
		storemapper.storeremove(vo);
	}
	
	
	//review
	@Override
	public List<StoreReviewVO> storereview(StoreVO vo){
		return storemapper.storereview(vo);
	}
	
	
	//image
	public List<StoreImageVO> storeiview(StoreVO vo){
		return storemapper.storeiview(vo);
	}

	public void storeiregist(StoreImageVO ivo){
		storemapper.storeiregist(ivo);
	}
	
	public void storeiremove(StoreVO vo){
		storemapper.storeiremove(vo);
	};
	
	
	//ent
	public List<EntVO> entlistview(){
		return storemapper.entlistview();
	};
	
	public EntVO entnumfinder(EntVO entvo){
		return storemapper.entnumfinder(entvo);
	}
	
	public String entnamefinder(int e_no){
		return storemapper.entnamefinder(e_no);
	}
	
	public void storeeregist(SEmatchVO evo){
		storemapper.storeeregist(evo);
	}
	
	public void storeemodify(SEmatchVO evo){
		storemapper.storeemodify(evo);
	};
	
	public List<SEmatchVO> storeseview(StoreVO vo){
		return storemapper.storeseview(vo);
	}
	
	public void storeeremove(StoreVO vo){
		storemapper.storeeremove(vo);
	};
	
	
	//menu
	public void storemregist(StoreMenuVO mvo){
		storemapper.storemregist(mvo);
	}
	
	public List<StoreMenuVO> storemview(StoreVO vo){
		return storemapper.storemview(vo);
	}
	
	public void storemremove(StoreVO vo){
		storemapper.storemremove(vo);
	};
	
	
	//point
	public int storersview(StoreVO vo){
		return storemapper.storersview(vo);
	};
	
	public int storemvview(StoreVO vo){
		return storemapper.storemvview(vo);
	};
	
	
	//keyword
	public List<SKmatchVO> keylistview(){
		return storemapper.keylistview();
	};
	
	public List<SKmatchVO> keywordchoice(SKmatchVO kvo){
		return storemapper.keywordchoice(kvo);
	};
	
	public void storeskmregist(SKmatchVO kvo){
		storemapper.storeskmregist(kvo);
	};
	
	public void storeskmremove(StoreVO vo){
		storemapper.storeskmremove(vo);
	};
	
	public List<KeywordVO> storeskmview(StoreVO vo){
		return storemapper.storeskmview(vo);
	};
	
	public KeywordVO sotrekview(KeywordVO kvo){
		return storemapper.sotrekview(kvo);
	};
	
	
	//category
	public List<CategoryVO> catelistview(){
		return storemapper.catelistview();
	};
	
	public List<CategoryVO> storecategory(CategoryVO cvo){
		return storemapper.storecategory(cvo);
	};
	
	public CategoryVO storecview(CategoryVO cvo){
		return storemapper.storecview(cvo);
	};
	
	public CategoryVO storescview(StoreVO vo){
		return storemapper.storescview(vo);
	};
	
	public void storecregist(CategoryVO cvo){
		storemapper.storecregist(cvo);
	};
	
	public void storescmremove(StoreVO vo){	
		storemapper.storescmremove(vo);
	};
	
	public void storescmmodify(CategoryVO cvo){
		storemapper.storescmmodify(cvo);
	};
	
}

