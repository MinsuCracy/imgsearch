package org.imgsearch.web;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.mapper.UserMapper;
import org.imgsearch.service.SearchLogService;
import org.imgsearch.service.UserService;
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
	
	@Inject
	UserService us;

	
//	1. ���� ���� �׽�Ʈ�ϱ� ���� �κ�
	
//	user management test�� ���� ����, list ��µ� �� ������ ���� �����
//	user DB �� ������ / �Ϲ� ����� ������ ���� type �߰� �ʿ���!!
//	���� Ű��� ���� DB �缳�� �ʿ�!! ����� ���� ������ ������ ���� ����
	@Test
	public void testCount(){
		Criteria cri = new Criteria();
		int result1 = um.userCount(cri.getDbLimitTotal());
		
		logger.info("result1 ==========="+result1);
	}
	
	
	@Test
	public void testList(){
		Criteria cri = new Criteria();
		List<UserVO> list = um.userList(cri.getPage());
		
		for (int i = 0; i < list.size(); i++) {
			
			logger.info(list.get(i).toString());
			
		}
	}
	
//	user rader chart ��������
	@Test
	public void raderData(){
		UserVO vo = new UserVO();
		vo.setU_no(29);
		vo = us.userRead(vo);
		logger.info("result " +vo);
	}
	
	
//	userGrow �Է��ϱ�
	@Test
	public void growTest(){
		UserVO vo = new UserVO();
		vo.setU_no(99);
		vo.setUg_age(5);
		vo.setUg_view(5);
		vo.setUg_kind(5);
		vo.setUg_intell(5);
		vo.setUg_face(5);
		vo.setUg_trouble(5);
		vo.setUg_rumor(5);
		vo.setUg_Atype(vo.getUg_age());
		vo.setUg_Btype((vo.getUg_view()+vo.getUg_kind())/2);
		vo.setUg_Ctype((vo.getUg_intell()+vo.getUg_face()+vo.getUg_trouble()+vo.getUg_rumor())/4);
		um.userGrow(vo);
	}
//	userGrow update �׽�Ʈ
	@Test
	public void GUTest(){
		UserVO vo = new UserVO();
		vo.setU_no(999);
		vo.setUg_age(5);
		vo.setUg_view(5);
		vo.setUg_kind(5);
		vo.setUg_intell(5);
		vo.setUg_face(5);
		vo.setUg_trouble(5);
		vo.setUg_rumor(5);
		vo.setUg_Atype(vo.getUg_age());
		vo.setUg_Btype((vo.getUg_view()+vo.getUg_kind())/2);
		vo.setUg_Ctype((vo.getUg_intell()+vo.getUg_face()+vo.getUg_trouble()+vo.getUg_rumor())/4);
		um.userGrowUpdate(vo);
	}
	
//	user Inquiry test �� ���� ����, ���κ� ��ȸ�� ���
	
	@Test
	public void testInquiry(){
		UserVO vo = new UserVO();
		vo.setU_email("testMOC@imgsearch.org");
		List<UserVO> list = um.userInquiry(vo);
		logger.info("result================="+list);
	}
	
	@Test
	public void testUserGrowCheck(){
		UserVO vo = new UserVO();
		vo.setU_no(9999);
		int result = um.userGrowCheck(vo);
		logger.info("result count=============="+result);
	}
	
//	user Delete test �� ���� ����, ���� ���� / ��������
	
	@Test
	public void testDelete(){
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
	
//	user Insert test�� ���� ����
	@Test
	public void testInsert(){
		UserVO vo = new UserVO();
		vo.setU_id("realUser");
		vo.setU_age(35);
		vo.setU_email("tester@naver.com");
		vo.setU_gender("m");
		vo.setU_job("DBA");
		int result = 0;
		try{
		result = um.userInsert(vo);
		}catch(Exception e){
			result = 999;
		}
		logger.info("result ========"+result);
	}
	
//	user Update test�� ���� ����
	@Test
	public void testUpdate(){
		UserVO vo = new UserVO();
		vo.setU_id("realUser");
		vo.setU_age(35);
		vo.setU_email("tester@naver.com");
		vo.setU_gender("m");
		vo.setU_job("DBA");
		int result = 0;
		try{
			result = um.userUpdate(vo);
		}catch(Exception e){
			result=888;
		}
		logger.info("result=========="+result);
	}
		
		
	
	
//	2. ���� ���� �׽�Ʈ �ϱ� ���� �κ�
	
//	���� ����� ��ȸ
	@Test
	public void testInquiryService(){
		
		String inputData = "admin@imgsearch.org" ;
		logger.info(us.userInquiry(inputData).toString());
		
	}
	
	
	
}
