package com.trent.core.xstream;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.json.JettisonMappedXmlDriver;
import com.thoughtworks.xstream.io.json.JsonHierarchicalStreamDriver;
import com.trent.core.common.entity.User;

public class XstreamTest {

	private static final Logger logger = LoggerFactory.getLogger(XstreamTest.class);
	private User user = null;
	private XStream xstream = null;
	private ObjectOutputStream out = null;
	private ObjectInputStream in = null;

	@Before
	public void init() {
		xstream = new XStream();
		user = new User();
		user.setLoginName("admin");
		user.setPlainPassword("123456");
		user.setShaPassword("123456");
		user.setStatus("1");
		user.setVersion(3);
		user.setEmail("aaa");
		user.setName("Tom");
	}

	@After
	public void destory() {
		xstream = null;
		user = null;
		try {
			if (out != null) {
				out.flush();
				out.close();
			}
			if (in != null) {
				in.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.gc();
	}

	/**
	 * JavaBean 对象转化为XML
	 */
	@Test
	public void writeBean2XML() {
		xstream = new XStream();
		// xstream.alias("User", User.class);
		// xstream.aliasPackage("trent","com.trent.core");
		// xstream.aliasField("登录名称", User.class,"loginName");
		logger.info(xstream.toXML(user));
	}

	/**
	 * JavaBean 对象转化为XML
	 */
	@Test
	public void writeXML2Bean() throws IOException, ClassNotFoundException {
		xstream = new XStream();
		xstream.alias("User", User.class);
		String str = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><User><loginName>admin</loginName><plainPassword>123456</plainPassword><shaPassword>123456</shaPassword><name>Tom</name><email>aaa</email><status>1</status><version>3</version></User></xml>";
		User user1 = (User) xstream.fromXML(str);
		logger.info(user1.toString());
	}

	/**
	 * JavaBean 对象转化为 Json
	 */
	@Test
	public void writeEntity2JETTSON() {
		xstream = new XStream(new JsonHierarchicalStreamDriver());
		logger.info(xstream.toXML(user));
	}
	
	/**
	 * Json转 JavaBean
	 */
	@Test
	public void readJSON2Object() {
		xstream = new XStream(new JettisonMappedXmlDriver());
		String jsonStr = "{com.trent.core.common.entity.User: {loginName:'admin',plainPassword:'123456',shaPassword:'123456',name:'Tom',email:'aaa',status:'1',version:3}}";
		User user2 = (User)xstream.fromXML(jsonStr);
		logger.info(user2.toString());
	}

}
