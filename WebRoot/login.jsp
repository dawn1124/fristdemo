<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
//重置session
session.invalidate(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		

		<title>用户登陆</title>
 
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery-migrate.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.dataeditor.js"></script>
		<script type="text/javascript">
			 var SLRAD_DEBUG = true;
              if (window != top)top.location.href = location.href;
		</script>
		
		<style type="text/css">
			.login_button {
			background: url(image/loginbutton.jpg) no-repeat;
			width: 116px;
			height: 30px;
			border: 0;
			margin:25px 0 120px 80px;}
			body {      
		        background-image:  url(image/2.jpg);      
		        background-size:cover;    
		     }
		     
	.login {
	margin:0 auto; 
		margin-top:23%;
		border:1px solid white;
		text-align:center; /* 文字等内容居中 */ 
		width: 350px;
		height: 150px;
	}
	
		</style>
	</head>

	<body style="background-color:#FFFFFF;">		
           

            <div class="login" >
                 
                  <div class="login_right">

                      <div class="login_user">
                      
                           <form id="loginForm" action="Controller" method="post" class="DataEditor" service="UserService.login" nextstep="window.location='index.jsp'">
                           <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
									<tr>
								    <td width="30%" height="30" align="right">用户账号：</td>
								    <td width="70%"><input name="user_id" id="user_id" type="text"  size="20" class="login_textbox" validate="required" validates="{maxlength:20,messages:{required:'请输入用户名',maxlength:'最大长度不能超过{0}字'}}" /></td>
								    </tr>
								    <tr>
								    <td height="30" align="right">密码：</td>
								    <td height="30"><input name="password" id="password" type="password"  class="login_textbox" size="20" validate="required" validates="{maxlength:50,messages:{required:'请输入密码',maxlength:'最大长度不能超过{0}字'}}" /></td>
								    </tr>  
								    <tr>
								    <td colspan="2"><input type="submit" class="login_button" value="" /></td>
								    </tr>
                           </table>

	                       </form>
	                   
                   </div> 
                </div>
          </div>
         
     
	</body>
</html>
