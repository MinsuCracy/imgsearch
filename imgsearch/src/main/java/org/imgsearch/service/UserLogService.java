package org.imgsearch.service;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.mapper.UserLogMapper;
import org.imgsearch.vo.UserLogVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


@Service
public class UserLogService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserLogService.class);
	
	@Inject
	UserLogMapper lm;
	
	public int userLogTotalCount(Criteria cri){
		
		return lm.userLogTotalCount(cri);
	}
	
	public List<UserLogVO> userLogList(Criteria cri){
		
		return lm.userLogList(cri);
	}
	

}
