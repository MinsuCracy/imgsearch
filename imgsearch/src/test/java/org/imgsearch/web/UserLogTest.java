package org.imgsearch.web;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.mapper.SearchLogMapper;
import org.imgsearch.mapper.UserLogMapper;
import org.imgsearch.service.SearchLogService;
import org.imgsearch.service.UserService;
import org.imgsearch.vo.SearchLogVO;
import org.imgsearch.vo.UserLogVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserLogTest {
	
	private static final Logger logger = LoggerFactory
			.getLogger(UserLogTest.class);
	
	
	@Inject
	UserLogMapper lm;
	
	@Inject
	SearchLogMapper sm;
	
	@Inject
	UserService us;
	
	
	@Inject
	SearchLogService sls;
	
	
	@Test
	public void ULCTest(){
		Criteria cri = new Criteria();
		cri.setKeyword("hee");
		int result = lm.userLogTotalCount(cri);
		logger.info("result:::::::::::::::::::"+result);

	}
	
		
	@Test
	public void ULTest(){
		Criteria cri = new Criteria();
		cri.setKeyword("hee");
		List<UserLogVO> list = lm.userLogList(cri);
		logger.info("list:::::::::::::::::"+list);
		
	}
	
	@Test
	public void favoriteEnt(){
		List<SearchLogVO> list = sm.favoriteEnt();
		logger.info("list:::::::::::::::::"+list);
	}
	
	@Test
	public void favoriteKeyword(){
		List<SearchLogVO> list = sm.favoriteKeyword();
		logger.info("list:::::::::::::::::"+list);
	}
	
	@Test
	public void searchLogList(){
		Criteria cri = new Criteria();
		cri.setTotalPage(sls.searchLogCount(cri));
		List<SearchLogVO> list = sm.searchLogList(cri);
		logger.info("list:::::::::::::::::"+list);
	}
	
}
