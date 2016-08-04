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
<title>管理试题库</title>
</head>
<body>
<form:form method="post" id="theForm" name="theForm" action="/admin/questionTestPaper/list">
<div class="box">
	<c:import url="/WEB-INF/jsp/admin/common/left_navi.jsp"></c:import>
	<div class="right">
			<div class="manageChannel">
				<h1>管理问卷</h1>
				<table class="viewTable">
	              	<tbody>
	              		<tr>
			                <td colspan="8" width="80%"><strong>问卷列表</strong></td>
			                <td style="border-top:0px;border-right:0px; border-color:#ccc;" width="20%">&nbsp;</td>
	              		</tr>
		                <tr class="title">
		                	<td width="5%">编号</td>
			                <td width="5%">id</td>
			                <td width="20%">名称</td>
			                <td width="12%">类别</td>

			                <td width="12%">录入时间</td>
			                <td width="10%">录入人</td>
			                <td width="7%">是否可用</td>
			                <td width="20%">操作</td>
		                </tr>
		                <c:forEach items="${page.items}" var="t" varStatus="status">
		                
		                <tr>
		                	<td>${status.index +1 }</td>
		                	<td>${t.id}</td>
		                	<td>${t.title}</td>
		                	<td>
		                	  <c:choose>
		                	    <c:when test="${t.catalog == 1}">中医</c:when>
		                	    <c:when test="${t.catalog == 2}">西医</c:when>
		                	    <c:when test="${t.catalog == 3}">运动</c:when>
		                	    <c:when test="${t.catalog == 4}">饮食</c:when>
		                	    <c:otherwise>未配置</c:otherwise>
		                	  </c:choose>
		                	</td>
		                	<td>${t.createTime}</td>
		                	<td>${t.createMan}</td>
		                	<td>
		                	  <c:choose>
		                	    <c:when test="${t.isvalid == -1}">不可用</c:when>
		                	    <c:when test="${t.isvalid == 0 }">可用</c:when>
		                	    <c:otherwise>未配置</c:otherwise>
		                	  </c:choose>
		                	</td>
		                	
		                	<td>
		                	  <a href="/admin/testPaper/paperDetail?id=${t.id }" class="but-03">试题详情</a>
			                  <a id="updateId${t.id }" onclick="getHref(${t.id})" class="but-03">修改</a>
			                  <a href="/admin/testPaper/del?id=${t.id}" class="but-03">删除</a>
			                 </td>
		                </tr>
		                </c:forEach>
		                <tr>
							<td colspan="8">
								<div class="page">
									<common:pageV2 url="/admin/testPaper/list" theQuery="" optimize="true"/>
								</div>
							</td>
						</tr>
	            	</tbody>
            	</table>
		</div>
	</div>
</div>
</form:form>
</body>
<script type="text/javascript">
	function getHref(paperId){
		var href = "/admin/testPaper/updateQuestions?paperId="+paperId;
		$("#updateId"+paperId).attr("href",href);
		$.ajax({ //一个Ajax过程 
			type: "post", //以post方式与后台沟通 
			url : "/admin/testPaper/writePaperIdSesstion", //与此php页面沟通 
			dataType:'json',//从php返回的值以 JSON方式 解释 
			data: "paperId="+paperId
			});
	};
</script>

</html>