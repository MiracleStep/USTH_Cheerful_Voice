<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<% 
	String msgId = request.getParameter("msgid");
	if (msgId == null || msgId.equals("")){
		msgId = "1";
	}
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="bootstrapvalidator/css/bootstrapValidator.css">
<link rel="stylesheet" href="css/site.css">
<script src="jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 表单验证 -->
<script src="bootstrapvalidator/js/bootstrapValidator.js" type="text/javascript"></script>
<title>黑科欣声</title>
<script type="text/javascript">
	var pageNum = 1;
	var msgId =${param.msgid};
	$(function(){
		getMsg();//查询帖子详细信息
	
		$("#replyform").bootstrapValidator({
			message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            field:{
            	replycontent:{
            		message:"The reply is not valid",
            		validators:{
            			notEmpty:{
            				message:"回复内容不能为空"
            			},
            			stringLength:{
            				min:6,
            				max:1000,
            				message:"回复内容必须在6到1000之间"
            			}
            		}
            	}
            }
		});
	});
	function validateForm(){
		// 验证表单
		validateForm();
	}
	
	function getMsg(){
		// Ajax 获取问题信息
	   $.get("/message/getMsg.action",
			   {
		    "action":"getMsg",
		    "msgId":msgId
			   },
		 function(data){
		 var message=data.data;
		$(".title").html(message.msgtopic);//帖子标题
		$(".badge").html(message.thename);//主题名称
		var msg=$(".template").clone();//复制模版
		msg.show();
		msg.removeClass("template");
		msg.find(".order").text("楼主");
		msg.find(".author").text(message.realname);
		msg.find(".sex").text(message.sex);//性别
		msg.find(".city").text(message.city);
		msg.find(".msgcontent").html(message.msgcontents);
		msg.find(".time").text(message.msgip+"•"+message.msgtime);
		$("#msgList").append(msg);
		getReply();//查询帖子回复信息
			   },"json");
		
	}
	function getReply(){
		// Ajax 获取回复信息
		$.get("/message/getReply.action",
				{
			"action":"getReply",
			"msgId":msgId,//帖子ID
			"pageNum":pageNum
		},
		function(data){
			$.each(data.reply.list,function(index,element){
			var reply=$(".template").clone();
			reply.show();
			reply.removeClass("template");
			var number=(index+1+data.reply.pageSize*(data.reply.pageNum-1))+"楼";
			reply.find(".order").text(number);//楼层
			reply.find(".author").text(this.realname);//真实姓名
			reply.find(".sex").text(this.sex);//性别
			reply.find(".city").text(this.city);//城市
			reply.find(".msgcontent").html(this.replycontents);//回复内容
			reply.find(".time").text(this.replyip + "•" + this.replytime);//IP和时间
			$("#msgList").append(reply);
			});
			//加载更多
			pageNum++;
			if(parseInt(data.reply.pages)>=parseInt(pageNum)){
				$("#loadmore").html("加载更多...");
				$("#loadmore").removeAttr("disabled");
				
			}else{
				$("#loadmore").html("没有更多数据了！");
				$("#loadmore").attr("disabled","disabled");
			}
			},"json");
	}
	
	function replyMsg(){
		//获取validator对象
		/* var nv=$("#replyfrom").data("bootstrapValidator");
		//触发验证
		bv.validate();
		if(!bv.isValid()){
			return;
		} */
		var replycontents=$("textarea[name='replycontent']").val();
		$("textarea[name='replycontent']").val("");
		if(replycontents.length>0){
			$.post("userMessage/replyMsg.action",
					{
				"action":"replyMsg",
				"msgId":msgId,
				"replycontent":replycontents
					},
			 function (data) {
				if(data.res==1){
					alert(data.info 

);
					location.reload();//重新加载页面
				}else{
					alert(data.info 

);
				}
				//加载更多
				pageNum++;
				if(parseInt(data.reply.totalPage)>=parseInt(pageNum)){
					$("#loadmore").html("加载更多...");
					$("#loadmore").removeAttr("disabled");
					
				}else{
					$("#loadmore").html("没有更多数据了！");
					$("#loadmore").attr("disabled","disabled");
				}
			},"json");
		}
		// Ajax 回复问题
		
		return false;
	}
</script>
</head>
<body>
	<jsp:include  page="header.jsp" />
	<div class="container" id="msgList">
		<div class="row">
			<div class="col-sm-12 msgtitle">
				<h3>
					<span class="title">Java 命令行打印圣诞树</span>&nbsp;&nbsp;<span class="badge">Java</span>
				</h3>
				<div class="replybtn">
					<c:if test="${sessionScope.user == null}">
				  		<button type="button" class="btn btn-success" data-toggle="modal"
							onclick="alert('请先登录！')">回复</button>
					</c:if>
					<c:if test="${sessionScope.user != null}">
						<button type="button" class="btn btn-success" data-toggle="modal"
							data-target="#reply">回复</button>
					</c:if>
					
				</div>
			</div>
		</div>
		<div class="row reply template">
			<div class="col-sm-12" style="overflow: hidden;">
				<div class="rightinfo order">0楼</div>
			</div>
			<div class="col-sm-2 col-xs-2">
				<div class="author"></div>
				<div class="sex"></div>
				<div class="city"></div>
			</div>
			<div class="col-sm-10 col-xs-10">
				<div class="msgcontent"></div>
			</div>
			<div class="col-sm-12" style="overflow: hidden;">
				<div class="rightinfo time"></div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<br/>
				<button id="loadmore" type="button" class="btn btn-default btn-lg btn-block"
				onclick="javascript:getReply();" disabled="disabled">加载更多...</button>
			</div>
		</div>
	</div>

					
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="reply" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content modalcenter">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="replyLabel">回复：</h4>
	            </div>
	            <div class="modal-body">
	    			<!-- 
	    			<textarea style="width:100%" rows="5" cols="" id="replycontent"></textarea>
	    			 -->
	    			 <form id="replyform">
	    			 	<div class="form-group">
	    			 		<textarea style="width:100%" rows="5" cols="" name="replycontent" id="replycontent"></textarea>
	    			 	</div>
	    			 	<div class="text-right">
	    			 		<span id="returnMessage" class="glyhicon"></span>
	    			 		<p></p>
			                <button class="btn btn-default" data-dismiss="modal" >关闭</button>
	    			 		<button class="btn btn-primary" data-dismiss="modal"  onclick="replyMsg();">提交</button>
	    			 	</div>
	    			 </form>
	            </div>
	            <div class="modal-footer">
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>

</body>
</html></html>