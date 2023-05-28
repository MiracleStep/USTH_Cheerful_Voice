
<%@page import="com.mirac.util.Page"%>
<%-- <%@page import="com.muke.pojo.MessageCriteria"%>
<%@page import="com.muke.dao.IMessageDao"%>
<%@page import="com.muke.dao.impl.MessageDaoImpl"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="css/site.css">
<script src="jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<title>黑科欣声</title>
<script language="javascript">
$(function() {
	getNew();
	getHot();
	getTheme();
	getInfo();
});
	function getNew() {
		$.get("/message/topNew.action?action=topNew",
				function(data){
			//循环，data.newMsg.data表示取messageServlet传来名字为newMsg的数据，index是索引，msgItem代表的是newMsg.data的每个元素
			$.each(data.data.list, function(index,element){
				var msg=$(".template").clone();
				msg.show();
				msg.removeClass("template");
				msg.find(".text-limit").text(element.msgtopic);
				msg.find(".text-limit").attr("href","<%=basePath%>message.jsp?msgid="+element.msgid+"");
				msg.find(".badge").text(element.msgtime);
				$(".newList").append(msg);
			});
		
		},"json");
	}
	
	function getHot() {
		
		// Ajax异步请求最热五条,就是评论最多的五条
		$.get("/message/topHot.action?action=topHot",
				function(data){
			$.each(data.data.list ,function(index,element){
				var msg=$(".template").clone();
				msg.show();
				msg.removeClass("template");
				msg.find(".text-limit").text(element.msgtopic);
				msg.find(".text-limit").attr("href","<%=basePath%>message.jsp?msgid="+element.msgid+"");
				msg.find(".badge").text(element.replyCount);
				$(".hotList").append(msg);
			});
		
		},"json");
	}
	
	function getTheme() {
		
		// Ajax异步请求, 最热的五个主题
		$.get("/message/topTheme.action?action=topTheme",
				function(data){
			$.each(data.data.list ,function(index,element){
				var msg=$(".template").clone();
				msg.show();
				msg.removeClass("template");
				msg.find(".text-limit").text(element.msgtopic);
				msg.find(".text-limit").attr("href","<%=basePath%>message.jsp?msgid="+element.msgid+"");
				msg.find(".badge").text(element.thename);
				$(".themeList").append(msg);
			});
		
		},"json");
	}

	function getInfo() {
		// Ajax异步请求, 请求通知
		$.get("/info/getAllInfo.action?action=getAllInfo", function(data){
				console.log(data);
				$.each(data.info,function(index,element){
					console.log(element);
					var info = $(".infoTemplate").clone();
					info.show();
					info.removeClass("infoTemplate");
					info.find("#title").text(element.title);
					info.find("#content").text(element.content);
					info.find("#more").attr("href",element.targeturl);
					$(".infoShow").append(info);
				});
		},"json");
	}

</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="slide.jsp" ></jsp:include>

	<div class="container">
		<div class="infoShow">
			<div class="jumbotron infoTemplate" hidden="true">
				<h1 id="title"></h1>
				<p id="content"></p>
				<p><a class="btn btn-primary btn-lg" id="more" href="#" role="button">Learn more</a></p>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-4 ">
				<div
						style="overflow: auto; height: 60px; line-height: 40px; padding-top: 20px;">
					<div style="float: left">
						<h3 style="display: inline">最热</h3>
					</div>
					<div style="float: right; vertical-align: bottom;">
						<a href="hotmsg.jsp">更多>></a>
					</div>
				</div>

				<div>
					<ul class="list-group hotList" style="list-style-type:none">
						<!-- <li class="list-group-item" display="block">
							<span class="badge"></span>
							<a class="msgtile text-limit" href="message.jsp?msgid=5"></a>
						</li> -->
						<!--<li class="list-group-item" display="block">
							<span class="badge">5</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=3">JDK配置环境变量</a>
						</li>
						<li class="list-group-item" display="block">
							<span class="badge">1</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=4">盒子模型是怎么回事?</a>
						</li>
						<li class="list-group-item" display="block">
							<span class="badge">1</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=1">Java 命令行打印圣诞树</a>
						</li>
						<li class="list-group-item" display="block">
							<span class="badge">0</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=2">异步是啥东西</a>
						</li>-->
					</ul>
				</div>
			</div>
			<div class="col-sm-4">
				<div
					style="overflow: auto; height: 60px; line-height: 40px; padding-top: 20px;">
					<div style="float: left">
						<h3 style="display: inline">最新</h3>
					</div>
					<div style="float: right; vertical-align: bottom;">
						<a href="newmsg.jsp">更多>></a>
					</div>
				</div>
				<div>
					<ul class="list-group newList" style="list-style-type:none">
						<li class="list-group-item template">
							<span class="badge"></span>
							<a class="msgtile text-limit"></a>
						</li>
					<!-- 	<li class="list-group-item" display="block">
							<span class="badge">8/29</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=7">不错哦221133</a>
						</li>
						<li class="list-group-item" display="block">
							<span class="badge">8/28</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=6">网站Bug请在此留下</a>
						</li>
						<li class="list-group-item" display="block">
							<span class="badge">8/28</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=5">如何完全卸载MySQL数据库</a>
						</li>
						<li class="list-group-item" display="block">
							<span class="badge">8/28</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=4">盒子模型是怎么回事?</a>
						</li>
						<li class="list-group-item" display="block">
							<span class="badge">8/28</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=3">JDK配置环境变量</a>
						</li> -->
					</ul>
				</div>
				
			</div>
			<div class="col-sm-4">
				<div
					style="overflow: auto; height: 60px; line-height: 40px; padding-top: 20px;">
					<div style="float: left">
						<h3 style="display: inline">话题</h3>
					</div>
					<div style="float: right; vertical-align: bottom;">
						<a href="thememsg.jsp">更多>></a>
					</div>
				</div>
				
				  <div>
					<ul class="list-group themeList" style="list-style-type:none">
						<!-- <li class="list-group-item" display="block">
							<span class="badge"></span>
							<a class="msgtile text-limit" href="message.jsp?msgid=7"></a>
						</li> -->
			<!--			<li class="list-group-item" display="block">
							<span class="badge">BUG反馈</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=6">网站Bug请在此留下</a>
						</li>
						<li class="list-group-item" display="block">
							<span class="badge">MySQL</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=5">如何完全卸载MySQL数据库</a>
						</li>
						<li class="list-group-item" display="block">
							<span class="badge">Web前端</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=4">盒子模型是怎么回事?</a>
						</li>
						<li class="list-group-item" display="block">
							<span class="badge">Java</span>
							<a class="msgtile text-limit" href="message.jsp?msgid=3">JDK配置环境变量</a>
						</li>-->
					</ul>
				</div>  
			</div>
		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>