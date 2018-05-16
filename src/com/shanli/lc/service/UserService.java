package com.shanli.lc.service;

import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import java.util.Date;


import com.shanli.slrad.Params;
import com.shanli.slrad.RespMsg;
import com.shanli.slrad.crypt.SLCrypt;
import com.shanli.slrad.data.DataAccess;
import com.shanli.slrad.data.Dataset;
import com.shanli.slrad.web.WebContext;

public class UserService {
	private static String KEY = "esms";
	public Connection dblc;
	public Params params;



	public void list() {
		Dataset ds = new Dataset(dblc);
		String sql = "SELECT user_id,username,role,phone,create_time from tbl_slrad_user ";
		
		ds.list(sql);
		ds.respMsg();
	}
	public void login() {
		Dataset ds = new Dataset(dblc);
	RespMsg resp = ds.respMsg();
	
	Map<String, Object> user = ds
			.get("SELECT user_id,username,password,role FROM tbl_slrad_user  WHERE user_id=${user_id}");

	if (user == null || user.get("user_id") == null) {
		resp.setErrorMessage("不存在用户【" + params.getString("user_id")
				+ "】!");
		return;
	}

	String pwd = (String) user.get("password");
	pwd = SLCrypt.uncrypt(pwd, KEY);

	if (!pwd.equals(params.getString("password"))) {
		resp.setErrorMessage("密码不正确!");
		return;
	}

	
	
	WebContext.getSession().setAttribute("username", user.get("username"));
	WebContext.setCurrentUserId((String) user.get("user_id"));
	WebContext.getSession().setAttribute("user_id",
			(String) user.get("user_id"));
	WebContext.getSession().setAttribute("user_role",
			(String) user.get("role"));
	if("admin".equals(user.get("user_id"))){
		WebContext.getSession().setAttribute("isAdmin", "1");
		
	}
	

	}
	
	public void welcomeFwd() {
		if("sys_admin".equals(WebContext.getSession().getAttribute("user_role"))){
			WebContext.forward("userlist.jsp");
		}else{
			WebContext.forward("hello.jsp");
		}
	}
	public void update() {
		// 更新用户表记录
		DataAccess daUser = new DataAccess(dblc, "tbl_slrad_user");
		Dataset dset = new Dataset(dblc);
		Map<String, Object> map=dset.get("SELECT username,role,phone"
				+ " FROM tbl_slrad_user  WHERE  user_id=${user_id}");
		String username=(String)map.get("username");
		
		Params pUser = new Params();
		pUser.set("user_id", params.get("user_id"));
		pUser.set("username", params.get("username"));
		pUser.set("phone", params.get("phone"));
		pUser.set("role", params.get("role"));
		
		daUser.setParams(pUser);
		daUser.update();
		daUser.respMsg();
	
		if (daUser.getExcuteState()) {
			// 更新 tbl_slrad_user_role表的记录
			DataAccess daRole = new DataAccess(dblc, "tbl_slrad_user_role");
			Dataset ds = new Dataset(dblc);
			daRole.deleteByCondition("user_id = ${user_id} ");
			Map<String, Object> mapcheck = ds
					.get("select user_id from tbl_slrad_user_role where user_id = ${user_id} and role_id = ${user_role}");
			if (mapcheck == null || mapcheck.get("user_id") == null) {
				Params pRole = new Params();
				pRole.set("user_id", params.getString("user_id"));
				pRole.set("role_id", params.getString("role"));
				daRole.setParams(pRole);
				daRole.append();

			}
			
			
			}
	}
	
	public void getById() {
		Dataset dataset = new Dataset(dblc);
		dataset.get("SELECT user_id,username,role,phone FROM tbl_slrad_user WHERE user_id=${user_id}");
		dataset.respMsg();
	}
	public void delete() {
		DataAccess da = new DataAccess(dblc, "tbl_slrad_user");
		
		
		da.addRule(
				"select * from tbl_slrad_user where user_id=${user_id} AND user_id='admin'",
				false, "不允许删除系统管理员帐号");
		
		da.delete();
		if (da.getExcuteState()) {
			
			DataAccess roleDa = new DataAccess(dblc, "tbl_slrad_user_role");
			roleDa.deleteByCondition("user_id=${user_id}");
			
		}
		da.respMsg();
	}
	public void create() {

		DataAccess da = new DataAccess(dblc, "tbl_slrad_user");
		da.addRule("select * from tbl_slrad_user where user_id=${user_id}",
				false, "账号已存在");
		
		
		String password = params.getString("password");
		password = SLCrypt.encrypt(password, KEY);
		params.set("password", password);
		params.set("crate_time", new java.sql.Timestamp(System.currentTimeMillis()));
		da.append();
		da.respMsg();
		// 在 tbl_slrad_user_role中新增一条信息
		if (da.getExcuteState()) {
			DataAccess daRole = new DataAccess(dblc, "tbl_slrad_user_role");
			Params p2 = new Params();
			p2.set("role_id", params.getString("role"));
			p2.set("user_id", params.getString("user_id"));
			daRole.setParams(p2);
			daRole.append();
			daRole.respMsg();
		}
	
	}
}
	

