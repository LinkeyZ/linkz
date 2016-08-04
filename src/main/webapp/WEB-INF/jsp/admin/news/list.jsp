<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="common" uri="http://javass.cn/common/" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/jsp/admin/common/head.jsp"></c:import>
<title>管理新闻资讯</title>
</head>
<body>
<form:form method="post" id="theForm" name="theForm" action="/admin/news/list">
<div class="box">
	<c:import url="/WEB-INF/jsp/admin/common/left_navi.jsp"></c:import>
	<div class="right">
		<div class="manageChannel">
			<h1>管理资讯</h1>
			<div class="aa1" style="height: auto;">
				<p>频道</p>
				<div>
					<select name="channel" style="width: 92%; height: 25px; padding-top: 2px; font-size: 14px;">
						<option value="">请选择</option>
						<c:forEach items="${channelList}" var="t" varStatus="status">
						<option value="${t.name}">${t.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="aa1" style="height: auto;">
				<p>主标题</p>
				<div>
					<input name="title" value="${queryCondition.title}" class="input_public" style="width: 92%;" type="text">
				</div>
			</div>
			<div class="aa1" style="height: auto;">
				<p>副标题</p>
				<div>
					<input name="subtitle" value="${queryCondition.subtitle}" class="input_public" style="width: 92%;" type="text">
				</div>
			</div>
			<div class="aa1" style="height: auto;">
				<p>作者</p>
				<div>
					<input name="author" value="${queryCondition.author}" class="input_public" style="width: 92%;" type="text">
				</div>
			</div>
			<div class="aa1">
				<p>发布日期</p>
				<div class="date">
					<div class="col-wrap-4 input-text" style="position: relative;">
						<input name="startDate" type="text" data-date-format="yyyy-mm-dd" value="${queryCondition.startDate}"
							readonly="readonly" placeholder="yyyy-mm-dd" name="txt2"
							onfocus="c.showMoreDay = false;c.show(this);"> <i
							class="icon-cal1"
							style="position: absolute; right: 1px; top: 26px; z-index: 0;"></i>
					</div>
					<p>——</p>
					<div class="col-wrap-4 input-text"
						style="position: relative; margin-left: 5px;">
						<!-- style="position: absolute;z-index:1;" id="Calendar" -->
						<input name="endDate" type="text" data-date-format="yyyy-mm-dd" value="${queryCondition.endDate}"
							readonly="readonly" placeholder="yyyy-mm-dd" name="txt2"
							onfocus="c.showMoreDay = false;c.show(this);"> <i
							class="icon-cal1"
							style="position: absolute; right: 1px; top: 26px; z-index: 0;"></i>
					</div>
				</div>
			</div>
			<div class="aa1" style="height: auto;">
				<input name="" value="查询" class="but-02" type="submit">
			</div>
			<table class="viewTable manageTable">
				<tbody>
					<tr>
						<td colspan="5" width="80%"><strong>资讯列表</strong>
						</td>
						<td
							style="border-top: 0px; border-right: 0px; border-color: #ccc;"
							width="20%">&nbsp;</td>
					</tr>
					<tr class="title">
						<td width="5%">编号</td>
						<td width="15%">标题</td>
						<td width="10%">作者</td>
						<td width="8%">频道</td>
						<td width="14%">发布日期</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${page.items}" var="t" varStatus="status">
					<tr>
						<td>${t.id}</td>
						<td>${t.title}</td>
						<td>${t.author}</td>
						<td>${t.channel.name}</td>
						<td><fmt:formatDate value="${t.publishDate}" pattern="yyyy-MM-dd"/></td>
						<td>
							<a href="/admin/news/update?id=${t.id}">修改</a>
							<a href="/admin/news/del?id=${t.id}">删除</a>
						</td>
					</tr>
					</c:forEach>
					
					<tr>
						<td colspan="5">
							<div class="page">
								<common:pageV2 url="/admin/news/list" theQuery="&title=${title}&subtitle=${subtitle}&channel=${channel}&startDate=${startDate}&endDate=${endDate}&author=${author}" optimize="true"/>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</form:form>
</body>
</html>