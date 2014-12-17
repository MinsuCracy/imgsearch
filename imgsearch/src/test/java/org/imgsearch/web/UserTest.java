package org.imgsearch.web;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.imgsearch.mapper.UserMapper;
import org.imgsearch.vo.UserVO;
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
public class UserTest {
	
	private static final Logger logger = LoggerFactory
			.getLogger(UserTest.class);
	
	
	@Inject
	UserMapper um;
	
	
	
	
//	user management test를 위한 영역, list 출력도 이 곳에서 같이 담당함
//	user DB 에 관리자 / 일반 사용자 나누기 위한 type 추가 필요함!!
//	성향 키우기 위해 DB 재설계 필요!! 현재는 개인 성향을 보여줄 수가 없음
	@Test
	public void testCount(){
		int result1 = um.userCount();
		
		logger.info("result1 ==========="+result1);
	}
	
	
	@Test
	public void testList(){
		List<UserVO> list = um.userList();
		
		for (int i = 0; i < list.size(); i++) {
			
			logger.info(list.get(i).toString());
			
		}
	}
	
	
//	user Inquiry test 를 위한 영역, 개인별 조회를 담당
	
	@Test
	public void test2(){
		UserVO vo = new UserVO();
		vo.setU_id("admin");
		List<UserVO> list = um.userInquiry(vo);
		logger.info("result================="+list);
	}
	
//	user Delete test 를 위한 영역, 개별 삭제 / 광역삭제
	
	@Test
	public void test3(){
		UserVO vo = new UserVO();
		List delList = new ArrayList();
		delList.add("test2");
		delList.add("test3");
		delList.add("test4");
		
		for (int i = 0; i < delList.size(); i++) {
			logger.info("i::::::" +i+"  delList:::::::"+delList.get(i));
			vo.setU_id(delList.get(i).toString());
			int result = um.userDelete(vo);
			logger.info("result============"+result);
		}
		
	}
	

}
