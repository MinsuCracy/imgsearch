package org.imgsearch.service;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.mapper.StoreMapper;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.StoreCVO;
import org.imgsearch.vo.StoreEVO;
import org.imgsearch.vo.StoreIVO;
import org.imgsearch.vo.StoreKVO;
import org.imgsearch.vo.StoreMVO;
import org.imgsearch.vo.StoreRVVO;
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
	public List<StoreVO> storelist(Criteria cri){
		

	
		return storemapper.storelist(cri);
	}
	
	@Override
	public int storecount(Criteria cri)
	{
		
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
	public StoreVO storeview(StoreVO vo){
		
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
	public List<StoreRVVO> storereview(StoreVO vo){
		
		
		
		return storemapper.storereview(vo);
	}
	
	
	//image
	public List<StoreIVO> storeiview(StoreVO vo){
		
		return storemapper.storeiview(vo);
	}

	public void storeiregist(StoreIVO ivo){
		
		storemapper.storeiregist(ivo);
	}
	
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
	
	public void storeeregist(StoreEVO evo){
		
		storemapper.storeeregist(evo);
	}
	
	public List<StoreEVO> storeseview(StoreVO vo){
		
		return storemapper.storeseview(vo);
	}
	
	
	
	//menu
	public void storemregist(StoreMVO mvo){
		
		storemapper.storemregist(mvo);
	}
	
	public List<StoreMVO> storemview(StoreVO vo){
		
		return storemapper.storemview(vo);
	}
	//point
	public int storersview(StoreVO vo){
		
		return storemapper.storersview(vo);
	};
	
	public int storemvview(StoreVO vo){
		
		return storemapper.storemvview(vo);
	};
	
	//keyword
	public List<StoreKVO> keylistview(){
		
		return storemapper.keylistview();
		
	};
	
	public List<StoreKVO> keywordchoice(StoreKVO kvo){
		
		return storemapper.keywordchoice(kvo);
	};
	
	//category
	public List<StoreCVO> catelistview(){
		
		
		
		return storemapper.catelistview();
	};
	
	public List<StoreCVO> storecategory(StoreCVO cvo){
		
		
		return storemapper.storecategory(cvo);
	};
	
	
	public StoreCVO storecview(StoreCVO cvo){
		
		
		return storemapper.storecview(cvo);
	};
	
	public StoreCVO storescview(StoreVO vo){
		
		
		return storemapper.storescview(vo);
	};
	
	public void storecregist(StoreCVO cvo){
		
		storemapper.storecregist(cvo);
	};
	
}

