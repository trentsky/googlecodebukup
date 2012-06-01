package com.trent.core.ibatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.trent.core.ibatis.service.TeacherService;
import com.trent.dbUtil.ibatis.Page;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/applicationContext.xml"})
public class IbatisServiceTest {

	Logger logger = LoggerFactory.getLogger(IbatisServiceTest.class);
	private static int measurements = 10; // 测量次数
	private static int threads = 100; // 线程个数
	@Autowired
	private TeacherService teacherService;
	
	@Test
	public void testIbatisQueryForPage() {
//		Nano.bench().measurements(measurements).threads(threads).measure(
//				"cache测试:", new Runnable() {
//					public void run() {
						Map<String, Object> map = new HashMap<String, Object>();
						Page<com.trent.core.ibatis.entiey.Teacher> page = teacherService.queryForPage("getAllUserForPage", map, 1, 10);
						List<com.trent.core.ibatis.entiey.Teacher> list = page.getData();
						for (com.trent.core.ibatis.entiey.Teacher teacher:list) {
							logger.info(teacher.toString());
//						}
					}
//				});
	}
}
