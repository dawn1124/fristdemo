package com.shanli.lc.service;

import java.sql.Connection;

import com.shanli.slrad.plugin.PermissionPlugin;

public class PermissionImpl extends PermissionPlugin {
	public Connection dblc;
	@Override
	public Connection getConnection() {
		
		return dblc;
	}

}
