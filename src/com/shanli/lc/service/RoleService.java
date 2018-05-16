package com.shanli.lc.service;

import java.sql.Connection;

import com.shanli.slrad.Params;
import com.shanli.slrad.data.DataAccess;
import com.shanli.slrad.data.Dataset;

public class RoleService {
	public Connection dblc;
	public Params params;
	

	public void listOption(){
		Dataset ds=new Dataset(dblc);
		ds.list("SELECT role_id,role_name FROM tbl_slrad_role");
		ds.toOptionRespMsg();
	}
	

}
