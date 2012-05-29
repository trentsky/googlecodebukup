package com.trent.core.ip;

import junit.framework.TestCase;

public class IPtest extends TestCase {

	public void testIp() {
		// 指定纯真数据库的文件名，所在文件夹
//		IPLocation ip = new IPLocation("58.20.43.13");
		IPLocation ip = new IPLocation("203.208.46.146");
		// 测试IP 58.20.43.13
		System.out.println(ip.getCountry() + ":" + ip.getArea());
	}
}