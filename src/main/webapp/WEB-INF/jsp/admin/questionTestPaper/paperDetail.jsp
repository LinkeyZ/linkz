<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="common" uri="http://javass.cn/common/" %>

<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link href="/static/jquery-easyui-1.3.4/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="/static/jquery-easyui-1.3.4/themes/icon.css" rel="stylesheet" type="text/css" />
<script src="/static/js/jquery-1.9.1.min.js"></script>
<script src="/static/jquery-easyui-1.3.4/jquery.easyui.min.js" type="text/javascript"></script>
<script src="/static/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>

<script type="text/javascript">

	$(function(){
		var checkedBack = $("#checkedBack").val();
		var cbArr = checkedBack.split(",");
		var name = $("input[name=checkName]");
		console.info(cbArr);
		for(var i = 0; i < cbArr.length; i++){
			for(var j = 0 ; j < name.length;j++){
				
				if(cbArr[i] == name[j].value){
					name[j].checked = true;
				}
			}
			
		}
	})

	function getCondition(){
		
		var t = encodeURI($("#s3").val());
		var condition = "/admin/testPaper/listCondition?pn=1&type=" + $("#s1").val() + "&catalog=" + $("#s2").val()
			+"&content=" + t + "&startDate=" + $("#s4").val()
			+"&endDate=" + $("#s5").val();
		
		$("#subContion").attr("href",condition);
	}
	
	function getScan(){
		var url = "/admin/testPaper/getScan";
		$("#getScan").attr("href",url);
	}
	
	function addAll2Checked(){
		
		$(":checkbox").each(function(){
			this.checked = !this.checked;
		});
	}
	
	function getChoices(){
		debugger;
		var l = $(":checkbox:checked").length;
		for(i = 0; i < l; i++){
			$.c = $(":checkbox:checked").get(i);
			cValue = $.c.value;
			
			$("#checked").append(cValue);
			$("#checked").append(",");
		}
	}
	
	function getHref(){
		
		var t = encodeURI($("#titleName").val());
		
		var length = $(":checkbox:checked").length;
		for(i = 0; i < length; i++){
			$.s = $(":checkbox:checked").get(i);
			sValue = $.s.value;
			
			$("#checked").append(sValue);
			$("#checked").append(",");
		}
		
		
		$("#subHref").attr("href","/admin/testPaper/add2list?checked=" + $("#checked").text() +
			"&titleName=" + t );
	}
	
	function writeSession(s){
		

			$.ajax({ //一个Ajax过程 
				type: "post", //以post方式与后台沟通 
				url : "/admin/testPaper/writeSesstion", //与此php页面沟通 
				dataType:'json',//从php返回的值以 JSON方式 解释 
				data: "choices="+s +"&pn=" + $.getUrlVar('pn')//发给php的数据有两项，分别是上面传来的u和p 
			});
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

<div class="page-header">
	<h1>
		试卷预览
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->

<form:form method="post" id="theForm" name="theForm" action="/questionBank/list">
<input type="hidden" id = "checked"/>
<div class="box">
	<div class="right">
	<input type="hidden" id ="checkedBack" value=${checked}>
			<div class="manageChannel">
				<table border="1px solid  #aaa" background="transparent" class="table table-striped table-bordered table-hover">
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
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>