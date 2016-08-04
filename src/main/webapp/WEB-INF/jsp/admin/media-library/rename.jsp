<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/static/bootstrap/css/bootstrap.min.css" />
<title>重命名</title>
</head>
<body>
<div class="container">
	<div class="page-header">
		<c:import url="/WEB-INF/jsp/admin/media-library/navigational.jsp"></c:import>
	</div>
	<form class="form-horizontal" method="post" action="/admin/media-library/rename${params}">
		<input type="hidden" name="extension" value="${extension}">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">当前名称：</label>
			<div class="col-sm-4">
				<div class="input-group">
					<input value="${basename}" name="filename" 
						type="text" class="form-control" id="inputEmail3" readonly>
					<c:if test="${!empty extension}">
						<div class="input-group-addon">.${extension}</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">新名称：</label>
			<div class="col-sm-4">
				<div class="input-group">
					<input name="newname" type="text" class="form-control" id="inputEmail3" placeholder="名称">
					<c:if test="${!empty extension}">
						<div class="input-group-addon">.${extension}</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">提交</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>