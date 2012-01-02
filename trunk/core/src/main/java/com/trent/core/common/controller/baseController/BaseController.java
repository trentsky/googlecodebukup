package com.trent.core.common.controller.baseController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
@Scope("prototype")
public class BaseController {

	protected int maxResult = 5;
	private int page = 1;
	
	public int getPage(){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return Integer.parseInt(request.getParameter("page"));
	}
	
}
