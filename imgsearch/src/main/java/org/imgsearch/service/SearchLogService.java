package org.imgsearch.service;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.mapper.SearchLogMapper;
import org.imgsearch.vo.SearchLogVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class SearchLogService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Inject
	SearchLogMapper sm;
	
	
	public List<SearchLogVO> favoriteEnt(){
		
		return sm.favoriteEnt();
	}
	
	public List<SearchLogVO> favoriteKeyword(){
		
		return sm.favoriteKeyword();
	}
	
	public int searchLogCount(Criteria cri){
		
		return sm.searchLogCount(cri);
	}
	
	public List<SearchLogVO> searchLogList(Criteria cri){
		return sm.searchLogList(cri);
	}

}
