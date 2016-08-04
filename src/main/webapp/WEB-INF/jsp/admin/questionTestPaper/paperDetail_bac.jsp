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
<title>试题详情</title>
</head>
<body>
<form:form method="post" id="theForm" name="theForm" action="/admin/questionTestPaper/list">
<div class="box">
	<c:import url="/WEB-INF/jsp/admin/common/left_navi.jsp"></c:import>
	<div class="right">
			<div class="manageChannel">
				<h1>试题详情</h1>
				<table class="viewTable">
	              	<tbody>
	              		<tr>
			                <td colspan="14" width="80%"><strong>试题列表</strong></td>
			                <td style="border-top:0px;border-right:0px; border-color:#ccc;" width="20%">&nbsp;</td>
	              		</tr>
		                <tr class="title">
		                	<td width="2%">编号</td>
			                <td width="2%">id</td>
			                <td width="5%">名称</td>
			                <td width="15%">题目内容</td>
			                <td width="5%">选项A</td>
			                <td width="5%">选项B</td>
			                <td width="5%">选项C</td>
			                <td width="5%">选项D</td>
			                <td width="4%">选项E</td>
			                <td width="4%">选项F</td>
			                <td width="12%">录入时间</td>
			                <td width="5%">录入人</td>
			                <td width="7%">是否可用</td>
			                <td width="10%">操作</td>
		                </tr>
		                <c:forEach items="${paperDetail.questionBankList}" var="t" varStatus="status">
		                
		                <tr>
		                	<td>${status.index +1}</td>
		                	<td>${t.id}</td>
		                	
		                	<td>
		                	  <c:choose>
		                	    <c:when test="${t.catalog == 1}">中医</c:when>
		                	    <c:when test="${t.catalog == 2}">西医</c:when>
		                	    <c:when test="${t.catalog == 3}">运动</c:when>
		                	    <c:when test="${t.catalog == 4}">饮食</c:when>
		                	    <c:otherwise>未配置</c:otherwise>
		                	  </c:choose>
		                	</td>
		                	<td>${t.content}</td>
		                	<td>${t.choiceA}</td>
		                	<td>${t.choiceB}</td>
		                	<td>${t.choiceC}</td>
		                	<td>${t.choiceD}</td>
		                	<td>${t.choiceE}</td>
		                	<td>${t.choiceF}</td>
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
			                  <a href="/admin/questionBank/update?id=${t.id}" class="but-03">修改</a>
			                  <a id="delquestion${t.id}" onclick="getDelHref(${t.id})" class="but-03">删除</a>
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
<script type="text/javascript">
	function getDelHref(questionId){
		debugger;
		var href="/admin/testPaper/delQuestion?questionId=" + questionId +"&paperId=" + $.getUrlVar('id');
		$("#"+"delquestion"+questionId).attr("href",href);
		
	}
	
	$.extend({
		  getUrlVars: function(){
		    var vars = [], hash;
		    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
		    for(var i = 0; i < hashes.length; i++)
		    {
		      hash = hashes[i].split('=');
		      vars.push(hash[0]);
		      vars[hash[0]] = hash[1];
		    }
		    return vars;
		  },
		  getUrlVar: function(name){
		    return $.getUrlVars()[name];
		  }
		})
</script>
</html>