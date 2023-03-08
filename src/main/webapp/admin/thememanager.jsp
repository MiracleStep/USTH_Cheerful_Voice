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
<script type="text/javascript">
	
	$(function(){
		getTheme(1);//查询主题信息
	});
	
	function getTheme(pageNum){
		var	key=$("#thename").val();//搜索关键字
		$("#thename").val("");
		$.ajax({
			url:"/admin/theme/searchTheme.action",
			type:"get",
			data:{"action":"searchTheme","key":key,"pageNum":pageNum},
			dataType:"json",
			success:function(data){
				$(".listTheme").empty();//清空主题信息
				$(data.theme.list).each(function(index,element){
					var theme=$(".template").clone();//复制模版
					/* theme.show();//显示模版 */
					theme.removeClass("template");//移除样式
					
					theme.find(".num").text(index+1);//编号
					theme.find(".title").text(this.thename);//主题名称
					theme.find(".delete").attr("onclick","deleteTheme("+element.theid+")");//删除按钮
					
					$(".listTheme").append(theme);
				});
				setPage(pageNum,data.theme.pages,"getTheme");
			}
		});
		
	}
	
	function add(){
		if(confirm("确认添加吗？")){
			var	thename=$("#thename1").val();//添加主题名
			if(thename.length<=0){
				alert("主题名不能为空");
				return;
			}
			$("#thename1").val("");//清空文本框中的主题名信息
			$.ajax({
				url:"/admin/theme/add.action",
				type:"get",
				data:{"action":"add","thename":thename},
				dataType:"json",
				success:function(data){
					if(data.res==1){
						//添加主题成功
						alert(data.info);
						getTheme(1);
					}else{
						//添加主题失败
						$(".text-warning").text(data.info);
					}
				}
			});
		}
	}
	
	function deleteTheme(theid){
		if(confirm("确认删除吗？")){
			$.ajax({
				url:"/admin/theme/delete.action",
				type:"get",
				data:{"action":"delete","theid":theid},
				dataType:"json",
				success:function(data){
					if(data.res==1){
						//删除主题成功
						alert(data.info);
						getTheme(1);
					}else{
						//删除主题失败
						$(".text-warning").text(data.info);
					}
				}
			});
		};
	}
	
</script>
<title>黑科欣声</title>
</head>
<body>
	<jsp:include flush="fasle" page="header.jsp" />
	<div class="container">		
		<div class="row">
			<div class="col-sm-offset-2 col-sm-8 msgtitle">
				<h3>
					<span class="title">主题管理</span>
				</h3>
				<div class="replybtn">
					<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#add">添加</button>
					<button type="button" class="btn btn-success" data-toggle="modal"
							data-target="#search">搜索</button>
					
				</div>
			</div>
		</div>
		<div class="row template" >
			<div class="col-sm-offset-2 col-sm-8 col-xs-12 msglist">
				<div class="col-sm-2 col-xs-2 num">1</div>
				<div class="col-sm-8 col-xs-7 title">Java</div>
				<div class="col-sm-2 col-xs-3 ">
					<button class="btn btn-danger delete">删除</button>
				</div>
			</div>
		</div>
		
		<div  class="listTheme">
		
		</div>
		
		<!-- 显示分页 -->
		<div class="row" style="text-align: center">
			<jsp:include  page="/page/pagetool.jsp" />
		</div>

	</div>
	
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="search" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content modalcenter">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title">搜索</h4>
	            </div>
	            <div class="modal-body">
					<form role="form">
						<div class="form-group">
							<label for="thename">主题名：</label>
							<input type="text" class="form-control" id="thename" placeholder="">
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="getTheme()">搜索</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content modalcenter">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title">添加主题</h4>
	            </div>
	            <div class="modal-body">
					<form role="form">
						<div class="form-group">
							<label for="thename">主题名：</label>
							<input type="text" class="form-control" id="thename1" placeholder="">
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="add()">添加</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	<jsp:include flush="fasle" page="footer.jsp" />
</body>
</html>