<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>头部</title>
<script type="text/javascript">
	function logout(){
		// Ajax 异步请求退出登录
		$.ajax({
			url:"userhandler/logout.action",
			type : "POST",
			async : "true",
			dataType : "json",
			success : function(data) {
				if (data.res == 1){
					alert("退出登录！");
					window.location.replace("login.jsp");
				}
			}
		});
	}
</script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
	<div class="container-fluid"> 
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
			<span class="sr-only">切换导航</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="">黑科欣声交流平台</a>
		<a class="navbar-brand" href="./admin/login.jsp">后台管理(管理员)</a>
	</div>
	<div class="collapse navbar-collapse" id="example-navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="./user/addmsg.jsp">我要发帖</a></li>
			
			<c:if test="${sessionScope.user == null}">
				<li><a href="login.jsp">登录</a></li>
				<li><a href="register.jsp">注册</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null}">
				<li><a href="msgResearch.jsp">查询</a></li>
				<li class="dropdown">
			    	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
			        	${sessionScope.user.realname}<span class="caret"></span>
			    	</a>
			    	<ul class="dropdown-menu">
			     		<li><a href="user/mymsg.jsp">我的问题</a></li>
			     		<li><a href="user/center.jsp">信息修改</a></li>
			        	<li><a href="user/modifypw.jsp">修改密码</a></li>
			        	<li><a href="javascript:logout()">退出</a></li>
			      	</ul>
				</li>
			</c:if>
		</ul>
	</div>
	</div>
	</div>
</nav>
<div style="weight: 100%;height: 52px">

</div>
</body>
</html>