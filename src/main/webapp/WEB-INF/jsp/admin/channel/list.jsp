<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/jsp/admin/common/head.jsp"></c:import>
<title>管理新闻资讯</title>
</head>
<body>
<form:form method="post" id="theForm" name="theForm" action="/news/list">
<div class="box">
	<c:import url="/WEB-INF/jsp/admin/common/left_navi.jsp"></c:import>
	<div class="right">
			<div class="manageChannel">
				<h1>管理频道</h1>
				<table class="viewTable">
	              	<tbody>
	              		<tr>
			                <td colspan="4" width="80%"><strong>频道列表</strong></td>
			                <td style="border-top:0px;border-right:0px; border-color:#ccc;" width="20%">&nbsp;</td>
	              		</tr>
		                <tr class="title">
			                <td width="5%">编号</td>
			                <td width="20%">频道名称</td>
			                <td width="10%">是否私有</td>
			                <td width="45%">备注</td>
			                <td width="">操作</td>
		                </tr>
		                <c:forEach items="${channellist}" var="t" varStatus="status">
		                <tr>
		                	<td>${t.id}</td>
		                	<td>${t.name}</td>
		                	<td>${t.state}</td>
		                	<td>${t.remarks}</td>
		                	<td>
			                  <a href="/admin/channel/update?id=${t.id}" class="but-03">修改</a>
			                  <a href="/admin/channel/del?id=${t.id}" class="but-03">删除</a>
			                 </td>
		                </tr>
		                </c:forEach>
	            	</tbody>
            	</table>
		</div>
	</div>
</div>
</form:form>
</body>
</html>