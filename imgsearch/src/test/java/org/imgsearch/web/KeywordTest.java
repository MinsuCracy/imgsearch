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
public class KeywordTest {
	private static final Logger logger = LoggerFactory
			.getLogger(UserTest.class);
	
	
	 @Autowired
	 private WebApplicationContext wac;
	 
	 private MockMvc mockMvc;
	 
	 @Before
	 public void setup(){
	 this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	 }
	 
	 @Test
	 public void testList() throws Exception {
	 MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/admin/keyword/list")).andReturn();
	 logger.info("¸®½ºÆ® : " +result.getModelAndView().getModel());
	 
	 }
//	 
//	 @Test
//	 public void testRead() throws Exception {
//	 MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("/read")
//	 .param("bno", "430")).andReturn();
//	 System.out.println(result.getModelAndView().getModel());
//	 }
	 
	 //keyword insert 
//	 @Test
//	 public void testInsert() throws Exception {
//	 mockMvc.perform(MockMvcRequestBuilders.post("/admin/keyword/insert")
//	 .param("k_keyword", "»êÃ¤ºñºö¹ä"));
//	 }
	 
	//keyword update 
//	 @Test
//	 public void testUpdate() throws Exception {
//		 mockMvc.perform(MockMvcRequestBuilders.post("/admin/keyword/update")
//				 .param("k_keyword", "³ª¹°ºñºö¹ä")
//				 .param("k_no", "225"));
//	 }
	 //keyword update 
	 @Test
	 public void testDelete() throws Exception {
		 mockMvc.perform(MockMvcRequestBuilders.post("/admin/keyword/delete")
				 .param("k_no", "225"));
	 }
	 
	 
}
