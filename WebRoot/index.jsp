<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%if(session.getAttribute("sl.current_user")==null){
	response.sendRedirect("login.jsp");
} %>
<!DOCTYPE html>
<html>
	<head>
		<title>后台管理</title>
		<link href="css/a_1/style.css" rel="stylesheet" type="text/css">
		<link type="text/css" href="css/a_1/custom-theme/jquery-ui-1.8.18.custom.css" rel="stylesheet" />	
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery-migrate.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.menu.js"></script>
		<script type="text/javascript" src="js/jquery.layout.js"></script>
		<script type="text/javascript" src="js/slrad/slrad.dmc.js"></script>
		<script type="text/javascript">
			
	
			function logout(){
			  return window.confirm("确定退出系统？");
			}
        </script>
	</head>

	<body>


		<!-- 头部 -->
		<div class="ui-layout-north">
           <div class="header">
               <div class="header_top">
                   <div class="header_logo">${applicationScope.project_title}</div>
                   <div class="header_user">
                       <div class="header_user_con">
                          <span>您好<a>[ ${sessionScope.username } ]</a>，欢迎您的登录！</span>今天是<c:out value="<%=DateFormat.getDateInstance(DateFormat.FULL).format(new Date()) %>"></c:out>
                       </div>
                       <div class="header_user_button">
                       <ul>
                           <li><a href="login.jsp" onClick="return logout();" target="_top">退出系统</a></li>
                         </ul>
                     </div>
                   </div>
               </div>
           </div>
		</div>

		<!-- 底部 -->
		<div class="ui-layout-south" style="font-size: 12px;">
			
		</div>

		<!-- 功能菜单 -->
		<div class="ui-layout-west">
			<div class="Menu" id="menu1" actionUrl="Controller"	style="display: none; padding:5px;" itemEnableClass="itemEnable"	itemDisableClass="itemDisable"	itemSelectedClass="itemSelected">
				<ul>
					<li permissionid="eie_1">
						<h3>
							用户管理
						</h3>
						<ul>
							<li permissionid="eie_11">
								<a xhref="userlist.jsp" target="mainFrame">员工管理</a>
							</li>
							<li permissionid="eie_12">
								<a xhref="customer_type_list.jsp" target="mainFrame">机密</a>
							</li>
						
						</ul>
					</li>
					<li permissionid="eie_2">
						<h3>
							没有权限
						</h3>
						<ul>
							<li permissionid="eie_21">
								<a xhref="sms_task_add.jsp" target="mainFrame">机密1</a>
							</li>
							<li permissionid="eie_22">
								<a xhref="holiday_bless_list.jsp" target="mainFrame">机密2</a>
							</li>
							
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<iframe class="ui-layout-center" name="mainFrame" frameborder="0"
			src="welcome_fwd.jsp"  allowTransparency="true" width="98%" height="400px"></iframe>

	</body>
</html>
