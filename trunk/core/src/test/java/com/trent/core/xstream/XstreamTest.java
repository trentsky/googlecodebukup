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
import com.trent.core.common.entity.User;

public class XstreamTest {

	private Logger logger = LoggerFactory.getLogger(XstreamTest.class);
	private User user = null;
	private XStream xstream = null;
	private ObjectOutputStream out = null;
	private ObjectInputStream in = null;

	@Before
	public void init() {
		xstream = new XStream();
		User user = new User();
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

	@Test
	public void writeBean2XML() {
		xstream = new XStream();
		User user = new User();
		user.setLoginName("admin");
		user.setPlainPassword("123456");
		user.setShaPassword("123456");
		user.setStatus("1");
		user.setVersion(3);
		user.setEmail("aaa");
		user.setName("Tom");
		logger.info(xstream.toXML(user));
	}

}
