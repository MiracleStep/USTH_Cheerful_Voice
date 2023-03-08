<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="css/site.css">
<script src="jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<title>黑科欣声</title>
<script type="text/javascript">
	var pageNum = 1;
	
	$(function(){
		getMyMsg();//获取我的问题 
	});

	
	function getMyMsg(){
		// ajax 异步获取我的问题
		$.get("userMessage/getMyMsg.action",
				{
			"action":"getMyMsg",
			"pageNum":pageNum
			},
			function(data){
			
				if(data.res==1){
					$.each(data.data.list,function(index,element){
						var msg=$(".template").clone();//复制模版
						msg.show();//显示
						msg.removeClass("template");//移除模版
						msg.find(".title").text(element.msgtopic);//帖子标题
						 //添加href属性
						msg.find(".title").attr("href","<%=basePath%>message.jsp?msgid="+element.msgid);
						msg.find(".time").text(element.msgtime);//发帖时间
						msg.find(".count").text(element.accessCount+" • "+element.replyCount);//浏览量和回复量
						$(".list").append(msg);//将帖子信息添加到list中
					});
					//加载更多
					pageNum++;
					if(parseInt(data.data.pages)>=parseInt(pageNum)){
						
						$("#loadmore").html("加载更多...");
						$("#loadmore").removeAttr("disabled");
					}else{
						$("#loadmore").html("没有更多数据了");
						$("#loadmore").attr("disabled","disabled");
					}
				}
			
			},"json");
	}
</script>
</head>
<body>
	<jsp:include  page="../header.jsp" />
	<div class="container">		
		<div class="row">
			<div class="col-sm-12 msgtitle"><h3>我的问题</h3></div>
		</div>
		<div class="row">
			<div class="col-sm-8 col-xs-8"><h4>标题</h4></div>
			<div class="col-sm-2 col-xs-4 text-center"><h4>时间</h4></div>
			<div class="col-sm-2 hidden-xs text-center"><h4>浏览 • 回复</h4></div>
		</div>
		<div class="row msglist template">
			<div class="col-sm-12">
				<div class="col-sm-8 col-xs-8 text-limit">
					<a class="title">标题标题标题标题标题标题</a>
				</div>
				<div class="col-sm-2  col-xs-4 text-center time">时间</div>
				<div class="col-sm-2 hidden-xs text-center count">浏览/回复</div>
			</div>
		</div>
		<div class="list">
		
		</div>
	
		<div class="row p">
			<div class="col-sm-12">
				<br/>
				<button id="loadmore" disabled="disabled" type="button" class="btn btn-default btn-lg btn-block" 
				onclick="javascript:getMyMsg();">加载更多...</button>
			</div>
		</div>
	</div>
</body>
</html>