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
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="css/site.css">
<script src="jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="page/pagetool.js" type="text/javascript"></script>
<title>黑科欣声</title>
<script type="text/javascript">
	var page = 1;
	var username = "";

	$(function(){
		getUser(page);
	});
	
	function getUser(pageNum){
		$.ajax({
			url : "/admin/adminUser/getUser.action",
			type : "post",
			async : "true",
			data : {"action" : "getUser", "pageNum" : pageNum, "username" : username},
			dataType : "json",
			success : function(data){
				if (data.res==1){
					$(".list").html("");
					$.each(data.data.list, function(index, userItem) {
						var user = $(".template").clone();
						user.show();
						user.removeClass("template");
						user.find(".num").text(index+1);
						user.find(".name").text(userItem.username);
						user.find(".realname").text(userItem.realname);
						user.find(".name").text(userItem.username);
						user.find(".sex").text(userItem.sex);
						user.find(".hobbys").text(userItem.hobbys);
						user.find(".birthday").text(userItem.birthday);
						user.find(".city").text(userItem.city);
						user.find(".qq").text(userItem.qq);
						user.find(".email").text(userItem.email);
						user.find(".time").text(userItem.createtime);
						
						user.find(".delete").attr("onclick", "deleteUser("+userItem.userid+")");
						user.find(".restore").attr("onclick", "restoreUser("+userItem.userid+")");
						
						if (userItem.state == -1){
							user.find(".delete").hide();
							user.find(".restore").show();
						}
						else {

							user.find(".delete").show();
							user.find(".restore").hide();
						}
						
						$(".list").append(user);
					});
					page = setPage(pageNum, data.data.pages, "getUser");
										
				} else if (data.res==-2){
					alert(data.info);
				}
			}
		});
	}
	function deleteUser(userid){
		$.ajax({
			url : "/admin/adminUser/deleteUser.action",
			type : "post",
			async : "true",
			data : {"action" : "deleteUser", "userid" : userid},
			dataType : "json",
			success : function(data){
				if (data.res == 1){
					alert ("删除成功");
					getUser(page);
				}
				else {
					alert(data.info);
				}
			}
		});
	}
	

	function restoreUser(userid){
		$.ajax({
			url : "/admin/adminUser/restoreUser.action",
			type : "post",
			async : "true",
			data : {"action" : "restoreUser", "userid" : userid},
			dataType : "json",
			success : function(data){
				if (data.res == 1){
					alert ("恢复成功");
					getUser(page);
				}
				else {
					alert(data.info);
				}
			}
		});
	}

	function searchUser(){
		username = $("#username").val();
		getUser(1);
	}
	
</script>
</head>
<body>
	<jsp:include flush="fasle" page="header.jsp" />
	<div class="container">		
		<div class="row">
			<div class="col-sm-12 msgtitle">
				<h3 class="pull-left">用户管理
				</h3>
				<div class="replybtn">
					<button type="button" class="btn btn-success" data-toggle="modal"
							data-target="#search">搜索</button>
				</div>
			</div>
		</div>
		<div class="col-sm-12">
			<table class="table table-striped">
				<tbody class="list">
				</tbody>
			</table>
		</div>
		<table class="table table-striped">
		<tr class="template">
				<td class="userinfo num">1</td>
				<td class="title name">用户名</td>
				<td class="userinfo realname">昵称</td>
				<td class="userinfo sex">性别</td>
				<td class="userinfo hobbys">爱好</td>
				<td class="userinfo birthday">生日</td>
				<td class="userinfo city">城市</td>
				<td class="userinfo qq">QQ</td>
				<td
					class="userinfo text-limit email tooltip-test"
					data-toggle="tooltip" title="zhuangzhuangzhuang@foxmail.com">zhuangzhuangzhuang@foxmail.com</td>
				<td class=" userinfo time">2017-01-01</td>
				<td>
					<button class="btn btn-danger delete">删除</button>
					<button class="btn btn-warning restore">恢复</button>
				</td>
		</tr>
		</table>
		<div class="row" style="text-align: center">
			<jsp:include page="/page/pagetool.jsp"></jsp:include>
		</div>

	</div>
	
		<!-- 模态框（Modal） -->
	<div class="modal fade" id="search" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content modalcenter">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="replyLabel">搜索</h4>
	            </div>
	            <div class="modal-body">
					<form role="form">
						<div class="form-group">
							<label for="username">账号：</label>
							<input type="text" class="form-control" id="username" placeholder="">
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="searchUser()">搜索</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	<jsp:include flush="fasle" page="footer.jsp" />
</body>
</html>