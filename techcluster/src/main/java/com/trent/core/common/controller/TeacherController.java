package com.trent.core.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trent.core.common.entity.Teacher;
import com.trent.core.common.service.ITeacherService;
import com.trent.core.common.util.JsonUtil;
import com.trent.dbUtil.hibernate.page.PageView;

@Controller
@RequestMapping("/teacher")
public class TeacherController{
	private static final Logger logger = LoggerFactory.getLogger(TeacherController.class);
	
	@Autowired
	private ITeacherService teacherService;
	
	@RequestMapping(value = "/getAllTeacher", method = RequestMethod.GET)
	public @ResponseBody
	String getAllTeacher(HttpServletRequest request,
			@RequestParam(value = "page", required = true, defaultValue = "1") Integer page) {
		logger.info("获取teacher列表");
		int maxResult = 5;
		PageView<Teacher> pageView = new PageView<Teacher>(maxResult, page);
		pageView.setQueryResult(teacherService.getScrollData(pageView.getFirstResult(), maxResult));
		request.setAttribute("pageView", pageView);
		ResponseData rd = new ResponseData();
		rd.setValue(pageView);
		return JsonUtil.toJson(rd);
	}
	
	@RequestMapping(value = "/getTeacherName", method = RequestMethod.GET)
	public @ResponseBody
	String getTeacherByName(HttpServletRequest request,
			@RequestParam(value = "name", required = true) String name) {
		logger.info("根据name查询teacher getTeacherByName"+" ,name:"+name);
		Teacher teacher = teacherService.findByName(name);
		return JsonUtil.toJson(teacher);
	}
}
