<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/favicon.ico">
<title>简单的登录展示</title>

<!-- Bootstrap core CSS -->
<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/static/css/signin.css" rel="stylesheet">
</head>
<body>

	<div class="container">
		<form class="form-signin" action="/admin/login" method="post">
			<c:choose>
				<c:when test="${!empty message}">
					<h2 class="form-signin-heading">${message}</h2>
				</c:when>
				<c:otherwise>
					<h2 class="form-signin-heading">Please sign in</h2>
				</c:otherwise>
			</c:choose>
			<label for="inputEmail" class="sr-only">用户名：</label> 
			<input name="username" class="form-control" placeholder="User name" required autofocus> 
			<label for="inputPassword" class="sr-only">密码：</label> 
			<input type="password" name="password" class="form-control" placeholder="Password" required>
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					记住我 </label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
		</form>
	</div>
	<!-- /container -->
</body>
</html>
