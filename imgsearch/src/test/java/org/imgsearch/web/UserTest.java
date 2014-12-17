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
	
	
	
	
//	user management test�� ���� ����, list ��µ� �� ������ ���� �����
//	user DB �� ������ / �Ϲ� ����� ������ ���� type �߰� �ʿ���!!
//	���� Ű��� ���� DB �缳�� �ʿ�!! ����� ���� ������ ������ ���� ����
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
	
	
//	user Inquiry test �� ���� ����, ���κ� ��ȸ�� ���
	
	@Test
	public void test2(){
		UserVO vo = new UserVO();
		vo.setU_id("admin");
		List<UserVO> list = um.userInquiry(vo);
		logger.info("result================="+list);
	}
	
//	user Delete test �� ���� ����, ���� ���� / ��������
	
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
