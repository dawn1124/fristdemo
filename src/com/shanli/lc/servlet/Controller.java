package com.shanli.lc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shanli.lc.service.PermissionImpl;
import com.shanli.slrad.web.BrokerServlet;

public class Controller extends BrokerServlet {


	@Override
	public void init() throws ServletException {
		super.init();
	}	
	
	@Override
	public void config() {	
		config.setServicePackage("com.shanli.lc.service");
		config.setNeedLoginFirst(true);
		config.setDeaultPageSize(20);
		config.setPermissionService(PermissionImpl.class);
		config.setLoginUrl("/login.jsp");
	
		
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		this.doPost(request, response);
	}
}
