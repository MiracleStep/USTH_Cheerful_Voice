<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrapvalidator/css/bootstrapValidator.css">
    <link rel="stylesheet" href="../css/site.css">
    <script src="../jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 表单验证 -->
    <script src="../bootstrapvalidator/js/bootstrapValidator.js" type="text/javascript"></script>
    <title>黑科欣声</title>
    <script type="text/javascript">

        // $(function () {
        //     $("#addmsgform").bootstrapValidator({
        //         message: 'This value is not valid',
        //         feedbackIcons: {/*输入框不同状态，显示图片的样式*/
        //             valid: 'glyphicon glyphicon-ok',
        //             invalid: 'glyphicon glyphicon-remove',
        //             validating: 'glyphicon glyphicon-refresh'
        //         },
        //         fields: {/*验证*/
        //             title: {/*键名username和input name值对应*/
        //                 message: 'The message is not valid',
        //                 validators: {
        //                     notEmpty: {/*非空提示*/
        //                         message: '标题不能为空'
        //                     },
        //                     stringLength: {/*长度提示*/
        //                         min: 1,
        //                         max: 200,
        //                         message: '标题长度必须在1到200之间'
        //                     }/*最后一个没有逗号*/
        //
        //                 }
        //             },
        //             content: {
        //                 message: 'The content is not valid',
        //                 validators: {
        //                     notEmpty: {
        //                         message: '内容不能为空'
        //                     },
        //                     stringLength: {
        //                         min: 6,
        //                         max: 1000,
        //                         message: '内容必须在6到1000之间'
        //                     }
        //                 }
        //             },
        //             targeturl: {//验证主题
        //                 message: 'The targeturl is not valid',
        //                 validators: {
        //                     notEmpty: {
        //                         message: '网址不能为空'
        //                     },
        //                     stringLength: {
        //                         min: 4,
        //                         max: 1000,
        //                         message: '网址不能为空，网址长度4-1000'
        //                     }
        //                 }
        //             }
        //         }
        //     });
        // });

        function addInfo() {
            // //获取validator验证对象
            // var bootstrapValidator = $("#addmsgform").data("bootstrapValidator");
            // //触发验证
            // bootstrapValidator.validate();
            // //获取验证状态，如果通过验证，则执行ajax
            // if (!bootstrapValidator.isValid()) {
            //     return;
            // }
            // ajax 请求servlet发布问题
            var title = $("input[name='title']").val();//帖子标题
            var content = $("textarea[name='content']").val();//帖子内容
            var url = $("input[name='targeturl']").val();//帖子的url
            $.ajax({
                url: "admin/addInfo.action",
                type: "post",
                data: {
                    "action": "add",
                    "title": title,
                    "content": content,
                    "targeturl": url
                },//表单序列化
				dataType:"json",
				success:function(data){

                    if (data.res == 1) {
                        alert(data.info);
                        window.location.href = "<%=basePath%>admin/index.jsp";
                    } else {
                        alert(data.info);
                    }

                }
            });
            return false;
        }
    </script>
</head>
<body>
	<jsp:include page="./header.jsp"/>
	<div class="container">
    <div class="row">
        <div class="col-sm-12 text-center">
            <h3>我要提问</h3>
        </div>
    </div>
    <form class="form-horizontal col-sm-offset-2" id="addmsgform" method="post">
        <div class="form-group">
            <label class="col-sm-2 control-label">标题：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="title" placeholder="请输入标题">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">源网址：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="targeturl" placeholder="请输入网址">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">内容：</label>
            <div class="col-sm-6">
                <textarea class="form-control" rows="5" name="content"></textarea>
            </div>
        </div>
        <div class="form-group has-error">
            <div class="col-sm-offset-2 col-sm-4 col-xs-6 ">
                <span class="text-warning"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-3 col-xs-12">
                <button class="btn btn-success" onclick="addInfo();">发布</button>
                <button type="reset" class="btn btn-default">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>