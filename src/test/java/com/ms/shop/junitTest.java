package com.ms.shop;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
@WebAppConfiguration
public class junitTest {
	
	private static final Logger logger = LoggerFactory.getLogger(junitTest.class);

	@Inject
	private WebApplicationContext wac;
	private MockMvc mockMvc;
	
   @Before
   public void setup() {
       this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
   }

	
   @Test
   public void Test() throws Exception {
       mockMvc.perform(MockMvcRequestBuilders.get("/"))
       .andExpect(MockMvcResultMatchers.view().name("shop"));
       logger.info("test");
   }

}
