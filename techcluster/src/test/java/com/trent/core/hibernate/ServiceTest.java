package com.trent.core.hibernate;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.trent.consumeTest.Nano;
import com.trent.core.common.entity.Teacher;
import com.trent.core.common.service.ITeacherService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath:/META-INF/spring/applicationContext.xml" })
public class ServiceTest {

	private static final Logger logger = LoggerFactory.getLogger(ServiceTest.class);
	private static int measurements = 10; // 测量次数
	private static int threads = 100; // 线程个数
	@Autowired
	private ITeacherService teacherService;

	@Test
	public void teacherServiceTest() {
		Nano.bench().measurements(measurements).threads(threads).measure(
				"BoneCP 测试", new Runnable() {
					public void run() {
						List<Teacher> list = teacherService.findByProperty(
								"positional", "讲师");
						for (Teacher teacher : list) {
							logger.info(teacher.toString());
						}
					}
				});
	}

	@Test
	public void testGetScrollData() {
		Nano.bench().measurements(measurements).threads(threads).measure(
				"BoneCP 测试", new Runnable() {
					public void run() {
//						LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
//						orderby.put("id", "asc");
//						CustomerContextHolder
//								.setCustomerType(CustomerType.queryDB);
//						QueryResult<Teacher> scrollData = teacherService
//								.getScrollData(0, 10, "",
//										new Object[] { }, orderby);
						teacherService.getScrollData(0,10);
//						for (Teacher teacher : scrollData.getResultList()) {
//							logger.info(teacher.toString());
//						}
//						logger.info("queryDB总记录数："
//								+ scrollData.getTotalRecord());

						// CustomerContextHolder.setCustomerType(CustomerType.productDB);
						// QueryResult<Teacher> scrollData1 =
						// teacherService.getScrollData(0, 10,
						// "o.id=?", new Object[] { 41 }, orderby);
						// for (Teacher teacher : scrollData1.getResultList()) {
						// logger.info(teacher.toString());
						// }
						// logger.info("productDB总记录数：" +
						// scrollData1.getTotalRecord());
					}
				});
	}

	@Test
	public void testCache() {
		Nano.bench().measurements(measurements).threads(threads).measure(
				"cache测试:", new Runnable() {
					public void run() {
						Teacher teacher = teacherService.findByName("Teacher1");
						logger.info(teacher.toString());
					}
				});
	}
}
