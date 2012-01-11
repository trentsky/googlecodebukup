package com.trent.core.camel;

import javax.annotation.Resource;

import org.apache.camel.CamelContext;
import org.apache.camel.EndpointInject;
import org.apache.camel.Route;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.component.mock.MockEndpoint;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;

import com.trent.core.common.entity.User;
import com.trent.core.jms.camel.CamelMessageProducer;

@RunWith(SpringJUnit4ClassRunner.class)
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class,
		DirtiesContextTestExecutionListener.class })
@ContextConfiguration(locations = {
		"classpath:/META-INF/jms/applicationContext-jms.xml",
		"classpath:/META-INF/spring/applicationContext.xml",
		"classpath:/META-INF/spring/applicationContext-cache.xml" })
@DirtiesContext
@Component
public class CamelRouteTest {

	private static Logger logger = LoggerFactory
			.getLogger(CamelRouteTest.class);
	@EndpointInject(uri = "mock:result")
	protected MockEndpoint resultEndpoint;

	@Resource(name = "lotteryCamelContext")
	CamelContext camelContext;

	@Value("${mailQueue}")
	private String mailQueue;

	@Autowired
	private CamelMessageProducer camelMessageProducer;

	@Before
	public void initRoute() throws Exception {
		camelContext.addRoutes(new RouteBuilder() {
			public void configure() {
				// from("jms:topic:sendMailTopic").to("mock:result");
				from("jms:queue:sendMailQueue?concurrentConsumers=" + mailQueue).to("bean:camelNotifyMessageListener?method=process").routeId("邮件服务");
			}
		});
		camelContext.start();
		for (Route route : camelContext.getRoutes()) {
			logger.info("启动路由:" + route.getId());
			camelContext.startRoute(route.getId());
		}
	}

	@Test
	public void testCamelRoute() {

		User user = new User();
		user.setLoginName("admin");
		user.setPlainPassword("123456");
		user.setShaPassword("123456");
		user.setStatus("1");
		user.setVersion(3);
		user.setEmail("aaa");
		user.setName("Tom");
		camelMessageProducer.sendMessage(user);
	}
}
