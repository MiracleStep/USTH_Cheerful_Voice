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
<link rel="stylesheet" href="bootstrapvalidator/css/bootstrapValidator.css">
<link rel="stylesheet" href="css/site.css">
<script src="jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 表单验证 -->
<script src="bootstrapvalidator/js/bootstrapValidator.js" type="text/javascript"></script>
<title>黑科欣声</title>

<script type="text/javascript">
	//$(function()是一个jQuery函数，是当文档载入完成的时候执行的，也就是说文档载入完成后执行该语句
	$(function(){	
		validateForm();
	});
	
	function validateForm(){

		$("#loginform").bootstrapValidator({
		    /*提示信息*/
		 	message: 'This value is not valid', 
		 	/*输入框不同状态，显示图片的样式,初始化input状态样式图标*/
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            /*验证*/
            fields: {
                username: {/*键名username和input name值对应*/
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '用户名不能为空'
                        },
                        regexp: { 
                        /*
                                                                       匹配规则：regexp正则表达式
                        */
                        	regexp: /^[a-zA-Z0-9_\.]+$/, 
                        	message: '用户名不合法, 请重新输入'
                        },
                        stringLength: {/*长度限制*/
                            min: 6,
                            max: 30,
                            message: '用户名长度必须在6到30之间'
                        }/*最后一个没有逗号*/
                        
                    }
                },
                password: {
                    message:'密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        regexp: {
                        	regexp: /^[a-zA-Z0-9_\.]+$/,
                        	message: '密码不合法, 请重新输入'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '密码长度必须在6到30之间'
                        }
                    }
                }
            }
        });
	}
	
	function login(){
		// Ajax 异步请求登录
		if(!validate())return;
		//获取username和password的值
		var username = $("input[name='username']").val();
		var password = $("input[name='password']").val();
		var remPwd = $("input[name='remPwd']").val();
		$.ajax({
			url : "/userhandler/login.action",
			type : "POST",
			async : "true",
			data : {"action" : "login", "username": username, "password": password,"remPwd":remPwd},
			dataType : "json",
			success : function(data) {
				if (data.res == 1){
					window.location.replace("");
				}
				else {
					$(".text-warning").text(data.info);
					$("input[name='username']").val("");
					$("input[name='password']").val("");
				}
			}
		});
		
		return false;
	}
</script>
<style type="text/css">
	.code {
		font-family: Arial;
		font-style: italic;
		font-weight: bold;
		border: 0;
		letter-spacing: 3px;
		color: blue;
		height: 34px;
	}
</style>
<script type="text/javascript" >
	var code; //在全局定义验证码
	//产生验证码
	window.onload = function() {
		createCode();
	}

	function createCode() {
		code = "";
		var codeLength = 5; //验证码的长度
		var checkCode = document.getElementById("checkCode");
		var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
				'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //随机数
		for(var i = 0; i < codeLength; i++) { //循环操作
			var charIndex = Math.floor(Math.random() * 36); //取得随机数的索引
			code += random[charIndex]; //根据索引取得随机数加到code上
		}
		checkCode.value = code; //把code值赋给验证码
	}
	//校验验证码
	function validate() {
		var inputCode = document.getElementById("code").value.toUpperCase(); //取得输入的验证码并转化为大写
		if(inputCode.length <= 0) { //若输入的验证码长度为0
			alert("请输入验证码！"); //则弹出请输入验证码
			return false;
		} else if(inputCode != code) { //若输入的验证码与产生的验证码不一致时
			alert("验证码输入错误！"); //则弹出验证码输入错误
			createCode(); //刷新验证码
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<%
		String username = "";
		String password = "";
		boolean checked = false;
		Cookie[] c = request.getCookies();
		if (c != null) {
			for (int i = 0; i < c.length; i++) {
				if ("username".equals(c[i].getName())) {
					username = c[i].getValue();
				} else if ("password".equals(c[i].getName())) {
					password = c[i].getValue();
				}
			}
			checked = true;
		} else {
			username = "";
			password = "";
		}
	%>
	<jsp:include  page="header.jsp" />


	<div class="container">
		<div class="row">
			<div class="col-sm-offset-3 col-sm-6 text-center">
				<h3>用户登录</h3>
			</div>
		</div>
		<!-- Bootstrap Forms -->
		<form class="form-horizontal col-sm-offset-3" id="loginform" method="post">
			<div class="form-group">
				<label  class="col-sm-2 control-label">账号：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="username" value="<%=username%>" placeholder="请输入账号">
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label">密码：</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="password" value="<%=password%>" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="code" placeholder="验证码">
				</div>
				<div class="col-sm-3">
					<input type="button" id="checkCode" class="code" onclick="createCode()" />
					<a href="#" onclick="createCode()">看不清楚</a><br>
				</div>
			</div>
			<div class="checkbox">
				<div class="col-sm-offset-2 col-sm-4 col-xs-6 ">
					<label>
						<input type="checkbox" name="remPwd" checked="<%=checked%> %>" value="1">记住密码
					</label>
				</div>
			</div>

<%--			<div>--%>
<%--				<input type="text" id="input" />--%>
<%--				<input type="button" id="checkCode" class="code" onclick="createCode()" />--%>
<%--				<a href="#" onclick="createCode()">看不清楚</a><br>--%>
<%--				<input type="button" value="验证" onclick="validate()" />--%>
<%--			</div>--%>

			<div class="form-group has-error">
				<div class="col-sm-offset-2 col-sm-4 col-xs-6 ">
					<span class="text-warning"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-2  col-xs-6">
					<a class="btn btn-warning btn-block" href="register.jsp">注册</a>
				</div>
				<div class="col-sm-2 col-xs-6">
					<button class="btn btn-success btn-block" onclick="login();">登录</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>