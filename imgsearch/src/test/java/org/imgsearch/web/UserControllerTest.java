package org.imgsearch.web;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


	@RunWith(SpringJUnit4ClassRunner.class)
	@WebAppConfiguration
	@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
	public class UserControllerTest {
		
		@Autowired
		private WebApplicationContext wac;
		
		private MockMvc mockMvc;
		
		
		private static final Logger logger = LoggerFactory
				.getLogger(UserControllerTest.class);
		
		
		@Before
		public void setup(){
			this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		}
		
//		첫 페이지 이동 테스트
		@Test
		public void testPage() throws Exception {
			MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/admin/user/usermanagement")).andReturn();
			logger.info("result============"+result.getModelAndView().getModel());
			}
		
		
//		Inquiry 테스트
		@Test
		public void testInquiry() throws Exception {
			MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/admin/user/userinquiry")
					.param("inputData", "testMOC@imgsearch.org")).andReturn();
			logger.info("result================"+result.getModelAndView().getModel());
		}
		
//		유저 생성 테스트
		@Test
		public void testInsert() throws Exception {
			MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("/admin/user/userinsert")
					.param("u_id", "testMOC").param("u_pw", "1234")
					.param("u_email", "testMOC@imgsearch.org")
					.param("u_age", "11")
					.param("u_gender", "f")
					.param("u_job", "테스터입니다.")
					.param("u_type", "s")
					).andReturn();
					
			logger.info("result================"+result.getModelAndView().getModel());
		}
		
		
		
//		유저 리스트 테스트
		@Test
		public void testUserList() throws Exception {
			MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/admin/user/userlist")).andReturn();
			logger.info("result============"+result.getModelAndView().getModel());
			}
		
		
		
//		유저 삭제 테스트
//		리스트를 파라미터로 넘기는 방법은???
		@Test
		public void testUserDelete() throws Exception{
			MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("admin/user/userdelete")
					.param("u_id", "testMOC"))
					.andReturn();
			
		}
		
		
}// end class