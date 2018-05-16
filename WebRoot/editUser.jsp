<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改用户</title>
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
			datasourceArgs="user_id:'${param.user_id }'"
			datasource="UserService.getById" service="UserService.update"
			nextstep="close" class="DataEditor" permissionId="eie_112">
			<table width="100%" border="0" cellpadding="2"
				class="table_style">
				<input name="role_typex" type="hidden" id="role_typex"/>
				<tr>
					<td align="right">
						用户账号：&nbsp;
					</td>
					<td>
						<input name="user_id" type="text" readonly="readonly" size="33" class="field" value="${param.user_id}"/>
						<input type="hidden" name="password" />
					</td>
				</tr>
				<tr>
					<td align="right">
						用户姓名：&nbsp;
					</td>
					<td>
						<input  id="username" name="username" type="text" size="33" class="field" value="${param.username}" 
							validates="{required:true,maxlength:50,messages:{required:'请输入用户名!',maxlength:'用户名最大长度是{0}字符!'}}" />
					</td>
				</tr>
				
					<td align="right" >
						角色：&nbsp;
					</td>
					<td >
						<select id="role" name="role" class="field" datasource="RoleService.listOption"  >
							
							<option></option>
							
						</select>
					</td>
				</tr>
				
				
				<tr>
					<td align="right">
						手机号码：
					</td>
					<td>
						<input id="phone" name="phone" type="text" validate="required" size="33" class="field" value="${param.phone}"
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