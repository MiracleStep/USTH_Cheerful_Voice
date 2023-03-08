<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
<link rel="stylesheet" href="bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">
<script src="jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
<script src="bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
<!-- 表单验证 -->
<script src="bootstrapvalidator/js/bootstrapValidator.js" type="text/javascript"></script>
<title>黑科欣声</title>
<script type="text/javascript">
	$(function(){
		 validateForm();
		 
		 $(".form_datetime").datetimepicker({
		        format: 'yyyy-mm-dd',
		        minView:'month',
		        language: 'zh-CN',
		        autoclose: true,//选中自动关闭
		        startDate:'1900-01-01',
		        todayBtn: true//显示今日按钮
		    });
		 
	});
	
	function validateForm(){
		// 验证表单
		$("#registerform").bootstrapValidator({
		 	message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            /*验证*/
            fields: {
                username: {/*键名username和input name值对应*/
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        regexp: {
                        	regexp: /^[a-zA-Z0-9_\.]+$/,
                        	message: '用户名不合法, 请重新输入'
                        },
                        stringLength: {/*长度提示*/
                            min: 6,
                            max: 16,
                            message: '用户名长度必须在6到16之间'
                        },
	         /*  remote : {
							url : "userServlet?action=isExist",//请求的路径
							type : "post",
							data : {
								"username" : $("input[name='username']".val())
							},
							delay : 1000,//1s后执行Ajax请求

							dataType : "json",//请求的数控类型 
							message : "该用户名已存在!"//提示信息
						}  *//*最后一个没有逗号*/
					}
				},
				password : {
					message : '密码无效',
					validators : {
						notEmpty : {
							message : '密码不能为空'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_\.]+$/,
							message : '密码不合法, 请重新输入'
						},
						stringLength : {
							min : 6,
							max : 30,
							message : '密码长度必须在6到30之间'
						}
					}
				},
				password2 : {
					messaage : 'The two password must be consistent',
					validators : {
						notEmpty : {
							message : '确认密码不能为空'
						},
						identical : {
							field : 'password',
							message : '两次密码必须一致'
						}
					}
				},
				realname : {
					messaage : 'The realname is not valid',
					validators : {
						notEmpty : {
							message : '真实姓名不能为空'
						}
					}
				},
				sex : {
					messaage : 'The sex is not valid',
					validators : {
						notEmpty : {
							message : '性别不能为空'
						}

					}
				},
				hobbys : {
					messaage : 'The hobbys is not valid',
					validators : {
						notEmpty : {
							message : '爱好不能为空'
						}

					}
				},
				city : {
					messaage : 'The city is not valid',
					validators : {
						notEmpty : {
							message : '城市不能为空'
						}
					}
				},
				email : {
					messaage : 'The email is not valid',
					validators : {
						notEmpty : {
							message : '邮箱不能为空'
						}
					}
				},
				qq : {
					messaage : 'The QQ is not valid',
					validators : {
						notEmpty : {
							message : 'QQ不能为空'
						}
					}
				}
			}
		});
	}

	function register() {
		// 异步注册用户	
		$.ajax({
			url : "userhandler/register.action",// 请求地址
			type : "POST", // 请求类型
			async : "true", // 是否异步方式
			data : $("#registerform").serialize(), // 表单的序列化
			dataType : "json",
			success : function(data) {
				if (data.res == 1) {
					alert("注册成功");
					window.location.replace("");
				} else {
					$(".text-warning").text(data.info);
					$("input[name='username']").val("");
					$("input[name='password']").val("");
					$("input[name='password2']").val("");
					$("input[name='realname']").val("");
					$("input[name='sex']").val("");
					$("input[name='hobbys']").val("");
					$("input[name='birthday']").val("");
					$("input[name='city']").val("");
					$("input[name='email']").val("");
					$("input[name='qq']").val("");
				}
			}
		});
		return false;
	}
</script>
</head>
<body>
	<jsp:include flush="fasle" page="header.jsp" />
	<div class="container">		
		<div class="row">
			<div class="col-sm-offset-3 col-sm-6 text-center">
				<h3>用户注册</h3>
			</div>
		</div>
		<form class="form-horizontal col-sm-offset-3" id="registerform" method="post">
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">账号：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="username" placeholder="请输入账号">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">密码：</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="password" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<label for="password2" class="col-sm-2 control-label">确认密码：</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="password2" placeholder="请确认密码">
				</div>
			</div>
			<div class="form-group">
				<label for="realname" class="col-sm-2 control-label">真实姓名：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="realname" placeholder="请输入真实姓名">
				</div>
			</div>
			<div class="form-group">
				<label for="sex" class="col-sm-2 control-label">性别：</label>
				<div class="col-sm-4">
					<label class="radio-inline">
				        <input type="radio" name="sex" value="男" checked> 男
					</label>
				    <label class="radio-inline">
				        <input type="radio" name="sex" value="女"> 女
				    </label>
				</div>
			</div>
			<div class="form-group">
				<label for="hobbys" class="col-sm-2 control-label">爱好：</label>
				<div class="col-sm-4">
					<label class="checkbox-inline">
				        <input type="checkbox" name="hobbys" value="游戏">游戏
				    </label>
				    <label class="checkbox-inline">
				        <input type="checkbox" name="hobbys" value="音乐">音乐
				    </label>
				    <label class="checkbox-inline">
				        <input type="checkbox" name="hobbys" value="电影">电影
				    </label>
				</div>
			</div>
			
			<div class="form-group">
				<label for="birthday" class="col-sm-2 control-label">生日：</label>
				<div class="col-sm-4">
					<div class="input-group date form_datetime" data-date-format="dd-MM-yyyy" data-link-field="dtp_input1">
	                    <input class="form-control" size="16" type="text" name="birthday" value="2000-01-01" readonly>
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
						<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
	                </div>
                </div>
			</div>
			<div class="form-group">
				<label for="city" class="col-sm-2 control-label">城市：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="city" placeholder="请输入所在城市">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">邮箱：</label>
				<div class="col-sm-4">
					<input type="email" class="form-control" name="email" placeholder="请输入邮箱">
				</div>
			</div>
			<div class="form-group">
				<label for="qq" class="col-sm-2 control-label">QQ：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="qq" placeholder="请输入QQ">
				</div>
			</div>
			<div class="form-group has-error">
				<div class="col-sm-offset-2 col-sm-4 col-xs-6 ">
					<span class="text-warning"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4 col-xs-12">
					<button class="btn btn-success btn-block" onclick="register();">注册</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>