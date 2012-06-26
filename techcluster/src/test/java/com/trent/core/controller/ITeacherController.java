package com.trent.core.controller;

import java.net.URL;

import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.annotation.DirtiesContext.ClassMode;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.HttpMethod;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.WebRequest;

@DirtiesContext(classMode=ClassMode.AFTER_EACH_TEST_METHOD)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/spring/applicationContext.xml"})
public class ITeacherController {
	private static final Logger logger = LoggerFactory.getLogger(ITeacherController.class);
	
	@Value("${test.baseUrl}")
	private String baseUrl;
	
	@Test
	public void testGetTeachers() throws Exception{

		WebClient client = new WebClient(BrowserVersion.FIREFOX_3_6);
		WebRequest request = new WebRequest(new URL(baseUrl + "/teacher/getAllTeacher"), HttpMethod.POST);
		//request.getRequestParameters().add(new NameValuePair("page", "2"));
		Page page = client.getPage(request);
		JSONObject jo = new JSONObject(page.getWebResponse().getContentAsString());
		logger.info(jo.toString());
	}
}
