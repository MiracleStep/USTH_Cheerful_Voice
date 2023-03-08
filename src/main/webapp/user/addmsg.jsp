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
	<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" href="../bootstrapvalidator/css/bootstrapValidator.css">
	<link rel="stylesheet" href="../css/site.css">
	<script src="../jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- 表单验证 -->
	<script src="../bootstrapvalidator/js/bootstrapValidator.js" type="text/javascript"></script>
	<title>黑科欣声</title>
<script type="text/javascript">

	
	$(function(){
		getTheme();//获取主题
		$("#addmsgform").bootstrapValidator({
		 	message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {/*验证*/
            	msgtopic: {/*键名username和input name值对应*/
                    message: 'The msgtopic is not valid',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '标题不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min: 6,
                            max: 200,
                            message: '标题长度必须在6到200之间'
                        }/*最后一个没有逗号*/
                        
                    }
                },
                msgcontents: {
                    message:'The msgcontents is not valid',
                    validators: {
                        notEmpty: {
                            message: '问题内容不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 1000,
                            message: '问题内容长度必须在6到1000之间'
                        }
                    }
                },
                theid:{//验证主题 
                	 message:'The msgcontents is not valid',
                	  validators: {
                          notEmpty: {
                              message: '主题内容不能为空'
                          },
                         callback:{
                        	 message:'请选择主题',
                        	 callback:function(value,validator,$field){
                        		 if(value==-1){
                        			 return false;
                        		 }else{
                        			 return true;
                        		 }
                        	 }
                         }
                      }
                }
            }
        });
	});
	
	function getTheme(){
		// ajax 请求servlet获取 主题数据
		$.get("/admin/theme/getAllTheme.action",{"action":"getAllTheme"},
				function(data){
			var theme=$("select[name='theid']");
			//属性选择器  append 是添加到界面显示
			theme.append("<option value='-1' selected>请选择</option>");	
			$.each(data.theme,function(index,element){
				//绑定主题列表<option value="theid">thename</option>
				theme.append("<option value='"+element.theid+"'>"+element.thename+"</option>");
						
			});
		},"json");
		
	}
	function addmsg(){
		//获取validator验证对象
		var bootstrapValidator=$("#addmsgform").data("bootstrapValidator");
		//触发验证
		bootstrapValidator.validate();
		//获取验证状态，如果通过验证，则执行ajax
		if(!bootstrapValidator.isValid()){
			return;
		}
		// ajax 请求servlet发布问题
		var msgtopic=$("input[name='msgtopic']").val();//帖子标题
		var msgcontents=$("textarea[name='msgcontents']").val();//帖子内容
		var theid=$("select[name='theid']").val();//主题ID
		$.ajax({
			url:"userMessage/add.action",
			type:"post",
			data:{
				"action":"add",
				"msgtopic":msgtopic,
				"msgcontents":msgcontents,
				"theid":theid
			},//表单序列化
			dataType:"json",
			success:function(data){
				console.log(data)
				if(data.res==1){
					alert(data.info);
					window.location.href = "<%=basePath%>user/mymsg.jsp";
				}else{
					alert(data.info);
					window.location.href = "<%=basePath%>login.jsp";
				}

			}
		});
		return false;
	}
</script>
</head>
<body>
	<jsp:include  page="../header.jsp" />
	<div class="container">		
		<div class="row">
			<div class="col-sm-12 text-center">
				<h3>我要发帖</h3>
			</div>
		</div>
		<form class="form-horizontal col-sm-offset-2" id="addmsgform" method="post">
			<div class="form-group">
				<label  class="col-sm-2 control-label">标题：</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="msgtopic" placeholder="请输入标题">
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label">主题：</label>
				<div class="col-sm-6">
					<select class="form-control" name="theid">
				
				    </select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">内容：</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="5" name="msgcontents"></textarea>
				</div>
			</div>
			<div class="form-group has-error">
				<div class="col-sm-offset-2 col-sm-4 col-xs-6 ">
					<span class="text-warning"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-3 col-xs-12">
					<button class="btn btn-success" onclick="addmsg();">发帖</button>
					<button type="reset" class="btn btn-default">重置</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>