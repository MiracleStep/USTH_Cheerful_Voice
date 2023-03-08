<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%  
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
	
	function getMsg(){
		$.ajax({
			url : "/message/topHot.action",
			type : "POST",
			async : "true",
			data : {"action" : "topHot", "pageNum": pageNum},
			dataType : "json",
			success : function(data) {
				if (data.res==1){
					$.each(data.data.list, function(index, msgItem) {
						var msg = $(".template").clone();
						msg.show();
						msg.removeClass("template");
						msg.find(".msg-title").text(msgItem.msgtopic);
						msg.find(".msg-title").attr("href", "message.jsp?msgid="+msgItem.msgid);
						msg.find(".author").text(msgItem.realname+" •  "+msgItem.msgtime);
						msg.find(".msgcontent").html(msgItem.msgcontents);
						msg.find(".count").text(msgItem.accessCount+"次浏览 • "+msgItem.replyCount+"个回复 • ");
						msg.find(".msglink").attr("href", "message.jsp?msgid="+msgItem.msgid);
						
						$("#msgList").append(msg);
					});
	
					pageNum++;
					// 加载更多
					if (parseInt(data.hotMsg.pages) >= parseInt(pageNum)){
						$("#loadmore").html("加载更多...");
					}
					else{
						$("#loadmore").html("没有更多数据了！");
					}
				} else if (data.res == -2){
					alert(data.info);
				}
			}
		});
	}
	$(function(){
		// 加载数据
		getMsg();
	});

</script>
</head>
	<jsp:include flush="fasle" page="header.jsp" />

	<div class="container">
		<div class="row" id="msgList">
			<div class="col-sm-12 msgitem template">
				<h3><a class="msg-title"></a></h3>
				<p class="author"></p>
				<p class="msgcontent"></p>
				<div class="rightinfo">
					<span class="count"></span>
					<a class="msglink">详细&gt;&gt;</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<br/>
				<button id="loadmore" type="button" class="btn btn-default btn-lg btn-block" 
				onclick="javascript:getMsg();">加载更多...</button>
			</div>
		</div>
	</div>

</body>
</html>