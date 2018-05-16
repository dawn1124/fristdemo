<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="css/a_1/style.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="js/slrad/jqueryui/css/smoothness/jquery-ui.css">
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery-migrate.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.dataeditor.js"></script>
	    <script type="text/javascript" src="js/slrad/jqueryui/jquery-ui.js"></script>
	    <script type="text/javascript" src="js/slrad/jqueryui/jquery.ui.datepicker-zh-CN.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.dmc.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.datagrid.js"></script>
		
		<script type="text/javascript">
		</script>
	</head>

<body>


<div class="main_site">用户列表</div>
	<div id="dmc1" class="DMC" actionurl="Controller" windowStyle="5" windowOpacity="0.85"
			datagridid="dataGrid1" permissionId="eie_11">
	
		  <span><input type="button" value="新增用户" nextview="addUser.jsp" id="dispose"
				 style="display: none;"/></span>
				
		<span><input type="button" value="修改用户" nextview="editUser.jsp"  
			        check="1" windowsize="80%,80%" style="display: none;"/></span>
			<span><input type="button"  value="删除" service="UserService.delete"
				confirm="1" check="1" style="display: none;"/></span>  
		</div>

		<div id="dataGrid1" class="DataGrid" actionUrl="Controller"
			datasource="UserService.list" databodyid="dataBody1"
			dataheaderid="dataHeader1" pagesize="15" navigatorId="dnc1">
			<table id="dataHeader1"  width="100%"  class="table_header">
				<tr>
					<td style="width: 30px"><input type="checkbox" name="selectAll" /></td>
					<td style="width: 10%" field="user_id"  type="varchar"  key="1">登录名</td>
					<td style="width: 20%" field="username" type="varchar" maxchars="16" >员工名称</td>
					<td style="width: 15%" field="role" type="varchar" maxchars="12">角色</td>
					<td style="width: 25%" field="phone" type="varchar">手机号</td>
					<td style="width: 20%" field="create_time" type="datetime">创建时间</td>		
					
				</tr>
			</table>
			<table id="dataBody1" class="table_body">
			</table>
		
			<div id="dnc1">
				<h5><input name="pageFirst" type="button"  value="首页" />
				<input name="pageUp" type="button"  value="上页" />
				<input name="pageDown" type="button"  value="下页" />
				<input name="pageLast" type="button"  value="末页" />
				<input name="pageRefresh" type="button"  value="刷新" />
				</h5>
				<h6>每页记录数
				<input name="pageSize" type="text"  size="5" />
	                                第
				<input type="text" name="pageNum" size="5"  />
				页/共
				<span name="totalPage"></span>
				页,总记录数
				<span name="totalRows"></span>
	            </h6>
			</div>			
		</div>
		
	
</body>
</html>