<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>尾巴</title>
</head>
<body>
<div class="footer">
		<div class="container">
			<div class="row footer-top">
				<div class="col-sm-6 col-lg-6">
					<h3>黑科欣声(Mirac)</h3>
				</div>
				<div class="col-sm-6  col-lg-5 col-lg-offset-1">
					<div class="row about">
						<div class="col-xs-6">
							<h4>黑科欣声提醒您：道路千万条，文明第一条，用语不规范，账号就不见。</h4>
						</div>
						<div class="col-xs-3">
							<h4>联系方式</h4>
							<ul class="list-unstyled">
								<li><a href="#"
									title="Mirac" target="_blank">Mirac:18678544100</a></li>
								<li><a href="mailto:#">电子邮件</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>