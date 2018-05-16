<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>新增用户</title>
		<link rel="stylesheet" type="text/css"
			href="js/slrad/jqueryui/css/smoothness/jquery-ui.css">
	<link href="css/a_1/style.css" rel="stylesheet" type="text/css">
	
		 <script type="text/javascript" src="js/jquery.js"></script> 
		<script type="text/javascript" src="js/jquery-migrate.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.dataeditor.js"></script>
		 <script type="text/javascript"
			src="js/slrad/jqueryui/jquery-ui.js"></script> 
		<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
		<script type="text/javascript"
			src="js/slrad/jqueryui/jquery.ui.datepicker-zh-CN.js"></script>
		

		<script type="text/javascript">
	//var SLRAD_DEBUG = true;

	
</script>

		<style type="text/css">
/* css for timepicker */
.ui-timepicker-div .ui-widget-header {
	margin-bottom: 8px;
}

.ui-timepicker-div dl {
	text-align: left;
}

.ui-timepicker-div dl dt {
	height: 25px;
}

.ui-timepicker-div dl dd {
	margin: -25px 0 10px 65px;
}

.ui-timepicker-div td {
	font-size: 90%;
}

.ui-datepicker select.ui-datepicker-month,.ui-datepicker select.ui-datepicker-year
	{
	width: 40%;
}
</style>
	</head>
	<body>
		<form id="dataEditor1" action="Controller"
			service="UserService.create" nextstep="close" class="DataEditor">
			
			<table width="100%" border="0" cellpadding="2"
				class="table_style">
				<tr>
					<td align="right">
						用户账号：
					</td>
					<td>
						<input name="user_id" type="text" validate="required" size="33,10"			
						validates="{required:true,ASCII:true,maxlength:20,messages:{required:'请输入用户账号!',ASCII:'只能输入大小写字母和数字及下划线',maxlength:'用户账号最大长度是{0}!'}}" />
					</td>
				</tr>
				<tr>
					<td align="right">
						用户姓名：
					</td>
					<td>
						<input name="username" type="text" size="33"
							validates="{required:true,maxlength:50,messages:{required:'请输入用户名!',maxlength:'用户名最大长度是{0}字符!'}}" />
				
				<tr >
					<td align="right" >
						角色：
					</td >
					<td size="33">
						<select name="role" validates="{required:true,messages:{required:'请选择角色!'}}"  datasource="RoleService.listOption">
							<option></option>
						</select>
					</td>
					
				</tr>
				<tr>
					<td align="right">
						密码：
					</td>
					<td>
						<input type="password" name="password" id="password" size="33"
							validates="{required:true,messages:{required:'请输入用户密码!'}}" />
					</td>
				</tr>
				<tr>
					<td align="right">
						重复密码：
					</td>
					<td>
						<input type="password" name="repassword" size="33"
							validates="{required:true,equalTo:'#password',messages:{required:'请输入用重复密码!',equalTo:'两次输入密码不一致!'}}" />
					</td>
				</tr>
				
				
				<tr>
					<td align="right" >
						手机号码：
					</td>
					<td>
						<input name="phone" type="text" validate="required" size="33" 
							validates="{digits:true,rangelength:[11,11],messages:{required:'请输入手机号码',digits:'请输入正确的手机号码',rangelength:'请检查手机号格式'}}" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" name="button" class="frame_sys_buttonbc"
							value="保存" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" name="button" class="frame_sys_buttonqx"
							value="重置" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>