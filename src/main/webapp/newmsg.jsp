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
		// Ajax 获取最新的问题
		$.ajax({
			url : "/message/topNew.action",  //请求的url地址
			type : "POST",           //请求方式
			async : "true",    		 //请求是否异步，默认为异步，这是ajax重要特征
			data : {"action" : "topNew", "pageNum": pageNum}, //参数值
			dataType : "json",  //预期服务器返回的数据类型。
			//success: 请求成功后回调函数。这个方法有两个参数：服务器返回数据，返回状态
			success : function(data) {
			//根据后台messageServlet，res显示1说明取到数据，所以可以进行下一步操作
				if (data.res==1){
				//循环，data.newMsg.data表示取messageServlet传来名字为newMsg的数据，index是索引，msgItem代表的是newMsg.data的每个元素
					$.each(data.data.list, function(index, msgItem) {
					//克隆class为template的标签
						var msg = $(".template").clone();
						msg.show(); //显示msg
						msg.removeClass("template");  //移除所有的template
						msg.find(".msg-title").text(msgItem.msgtopic); //向class为msg-title的标签添加msgItem.msgtopic的内容(追加的是文字信息)
						msg.find(".msg-title").attr("href", "message.jsp?msgid="+msgItem.msgid);
						msg.find(".author").text(msgItem.realname+" •  "+msgItem.msgtime);
						msg.find(".msgcontent").html(msgItem.msgcontents);  //添加为html格式
						msg.find(".count").text(msgItem.accessCount+"次浏览 • "+msgItem.replyCount+"个回复 • ");
						msg.find(".msglink").attr("href", "message.jsp?msgid="+msgItem.msgid); 
						$("#msgList").append(msg); //在id为msgList的标签尾部添加msg中的内容
					});
					pageNum++;
					// 加载更多
					if (parseInt(data.newMsg.pages) >= parseInt(pageNum)){
						$("#loadmore").html("加载更多...");
						$("#loadmore").removeAttr("disabled"); //移除id为loadmore的标签的disable属性
					}
					else{
						$("#loadmore").html("没有更多数据了！");
						$("#loadmore").attr("disabled","disabled");
					}
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
<body>
	<jsp:include flush="fasle" page="header.jsp" />
	<div style="width: 100%;height: 51px;"></div>
	<div class="container">
		<h2>留言</h2>
	</div>
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
			<!-- <div class="col-sm-12 msgitem" style="display: block;">
				<h3><a class="msg-title" href="#">不错哦221133</a></h3>
				<p class="author">哈哈 •  8/29</p>
				<p class="msgcontent">六个字六个字</p>
				<div class="rightinfo">
					<span class="count">11次浏览 • 0个回复 • </span>
					<a class="msglink" href="#">详细&gt;&gt;</a>
				</div>
			</div>
			<div class="col-sm-12 msgitem" style="display: block;">
				<h3><a class="msg-title" href="#">网站Bug请在此留下</a></h3>
				<p class="author">冰城小象 •  8/28</p>
				<p class="msgcontent">网站Bug请在此留下</p>
				<div class="rightinfo">
					<span class="count">4次浏览 • 0个回复 • </span>
					<a class="msglink" href="#">详细&gt;&gt;</a>
				</div>
			</div>
			<div class="col-sm-12 msgitem" style="display: block;">
				<h3><a class="msg-title" href="#">如何完全卸载MySQL数据库</a></h3>
				<p class="author">冰城小象 •  8/28</p>
				<p class="msgcontent">1.&nbsp;控制面板——》所有控制面板项——》程序和功能，卸载mysql&nbsp;server!</p>
				<div class="rightinfo">
					<span class="count">9次浏览 • 5个回复 • </span>
					<a class="msglink" href="#">详细&gt;&gt;</a>
				</div>
			</div>
			<div class="col-sm-12 msgitem" style="display: block;">
				<h3><a class="msg-title" href="#">盒子模型是怎么回事?</a></h3>
				<p class="author">冰城小象 •  8/28</p>
				<p class="msgcontent">盒子模型的四要素分别是：<br>content(内容)、<br>border(边框)、<br>padding(内边距)、<br>margin(外边距)，</p>
				<div class="rightinfo">
					<span class="count">3次浏览 • 1个回复 • </span>
					<a class="msglink" href="#">详细&gt;&gt;</a>
				</div>
			</div>
			<div class="col-sm-12 msgitem" style="display: block;">
				<h3><a class="msg-title" href="#">JDK配置环境变量</a></h3>
				<p class="author">冰城小象 •  8/28</p>
				<p class="msgcontent">如题:</p>
				<div class="rightinfo">
					<span class="count">8次浏览 • 5个回复 • </span>
					<a class="msglink" href="#">详细&gt;&gt;</a>
				</div>
			</div> -->
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