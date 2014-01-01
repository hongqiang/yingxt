/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.jianxin.yingxt.web.common.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 生成分页控件
 * @author ThinkGem
 * @version 2013-5-19
 */
@SuppressWarnings("serial")
public class PageServlet extends HttpServlet {
	
	
	
	public PageServlet() {
		super();
	}
	
	public void destroy() {
		super.destroy(); 
	}
	
	
	@SuppressWarnings("rawtypes")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int pageNo=Integer.parseInt(request.getParameter("pageNo"));
		int count=Integer.parseInt(request.getParameter("count"));
		Page page = new Page(pageNo,pageSize,count);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset="+"UTF-8");  
		response.setHeader("content-type","text/html;charset=UTF-8");
		response.getWriter().print(page.toString());
	}
}
