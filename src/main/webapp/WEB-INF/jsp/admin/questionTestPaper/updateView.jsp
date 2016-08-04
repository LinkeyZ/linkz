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
<title>修改试卷</title>

</head>
<body>
<form:form method="post" id="theForm" name="theForm" action="/questionBank/list">
<input type="hidden" id = "checked"/>
<div class="box">
	<c:import url="/WEB-INF/jsp/admin/common/left_navi.jsp"></c:import>
	<div class="right">
	<input type="hidden" id ="checkedBack" value=${checked}>
			<div class="manageChannel">
				<h1>修改试卷</h1>
				<div class="aa1" style="height: auto;" align="center">类型
					<select name="type" id = "s1">
						<option value = "-1" selected="selected">全部</option>		
						<option value = "1">单选</option>
						<option value = "2">多选</option>
						<option value = "3">判断</option>			
					</select>
				</div>
				
				<div class="aa1" style="height: auto;" align="center">科目
					<select name = "catalog" id = "s2">
						<option  value = "-1" selected="selected">全部</option>	
						<option value = "1">中医</option>
						<option value = "2">西医</option>
						<option value = "3">运动</option>		
						<option value = "4">饮食</option>	
					</select>
				</div>
				
				<div class="aa1" style="height: auto;" align="center">题目
					<input type="text" id="s3">
				</div>
				
			<div class="aa1">
				<p>发布日期</p>
				<div class="date">
					<div class="col-wrap-4 input-text" style="position: relative;">
						<input id = "s4" name="startDate" type="text" data-date-format="yyyy-mm-dd" value="${queryCondition.startDate}"
							readonly="readonly" placeholder="yyyy-mm-dd" name="txt2"
							onfocus="c.showMoreDay = false;c.show(this);"> <i
							class="icon-cal1"
							style="position: absolute; right: 1px; top: 26px; z-i00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ndex: 0;"></i>
					</div>
					<p>——</p>
					<div class="col-wrap-4 input-text"
						style="position: relative; margin-left: 5px;">
						<!-- style="position: absolute;z-index:1;" id="Calendar" -->
						<input id ="s5" name="endDate" type="text" data-date-format="yyyy-mm-dd" value="${queryCondition.endDate}"
							readonly="readonly" placeholder="yyyy-mm-dd" name="txt2"
							onfocus="c.showMoreDay = false;c.show(this);"> <i
							class="icon-cal1"
							style="position: absolute; right: 1px; top: 26px; z-index: 0;"></i>
					</div>
				</div>
			</div>
			<div class="aa1" style="height: auto; text-align: center">
				<a id = "subContion" onclick="getCondition()">查询</a>
				<a id = "getScan" onclick="getScan()">试卷预览</a>
			</div>
				
				
				<table class="viewTable">
	              	<tbody>
	              		<tr>
			                <td colspan="15" width="80%"><strong>频道列表</strong></td>
			                <td style="border-top:0px;border-right:0px; border-color:#ccc;" width="20%">&nbsp;</td>
	              		</tr>
		                <tr class="title">
		                	<td width="2%"><input type="checkbox" onclick = "addAll2Checked()">  </td>
		                	<td width="2%">编号</td>
			                <td width="2%">id</td>
			                <td width="5%">类型</td>
			                <td width="5%">科目</td>
			                <td width="8%">题目内容</td>
			                <td width="7%">选项A</td>
			                <td width="7%">选项B</td>
			                <td width="7%">选项C</td>
			                <td width="7%">选项D</td>
			                <td width="4%">选项E</td>
			                <td width="4%">选项F</td>
			                <td width="12%">录入时间</td>
			                <td width="5%">录入人</td>
			                <td width="5%">是否可用</td>
			                <td width="12%">操作</td>
		                </tr>
		                <c:forEach items="${page.items}" var="t" varStatus="status">
		                
		                <tr>
		                	<td><input type="checkbox" name ="checkName" id = "${t.id }" value="${t.id }" onclick="writeSession(${t.id})"></td>
		                	<td>${status.index +1 }</td>
		                	<td>${t.id}</td>
		                	<td>
		                	  <c:choose>
		                		<c:when test="${t.type == 1}">单选题</c:when>
		                		<c:when test="${t.type == 2}">多选题</c:when>
		                		<c:when test="${t.type == 3}">判断题</c:when>
		                		<c:otherwise>未配置</c:otherwise>
		                	  </c:choose>
		                	</td>
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
		                </tr>
		                </c:forEach>
		                <tr>
							<td colspan="14">
								<div class="page">
									<common:pageV2 url="/admin/testPaper/updateView" theQuery="" optimize="true"/>
								</div>
							</td>
						</tr>
	            	</tbody>
            	</table>
            	<div class="aa1">
            	
            	</div>
            	<div class="aa1">
            		<a onclick="getHref()" id="subHref" class="but-03">提交</a>
            	</div>
		</div>
	</div>
</div>
</form:form>

</body>
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
	});

	function getCondition(){
		
		var t = encodeURI($("#s3").val());
		var condition = "/admin/testPaper/listCondition?pn=1&type=" + $("#s1").val() + "&catalog=" + $("#s2").val()
			+"&content=" + t + "&startDate=" + $("#s4").val()
			+"&endDate=" + $("#s5").val();
		
		$("#subContion").attr("href",condition);
	};
	
	function getScan(){
		var url = "/admin/testPaper/getScan";
		$("#getScan").attr("href",url);
	};
	
	function addAll2Checked(){
		
		$(":checkbox").each(function(){
			this.checked = !this.checked;
		});
	};
	
	function getChoices(){
		debugger;
		var l = $(":checkbox:checked").length;
		for(i = 0; i < l; i++){
			$.c = $(":checkbox:checked").get(i);
			cValue = $.c.value;
			
			$("#checked").append(cValue);
			$("#checked").append(",");
		}
	};
	
	function getHref(){
		
		var t = encodeURI($("#titleName").val());
		
		var length = $(":checkbox:checked").length;
		for(i = 0; i < length; i++){
			$.s = $(":checkbox:checked").get(i);
			sValue = $.s.value;
			
			$("#checked").append(sValue);
			$("#checked").append(",");
		}
		
		$("#subHref").attr("href","/admin/testPaper/update2list?paperId=" + $.getUrlVar('paperId'));
	};
	
	function writeSession(s){

			$.ajax({ //一个Ajax过程 
				type: "post", //以post方式与后台沟通 
				url : "/admin/testPaper/writeSesstion", //与此php页面沟通 
				dataType:'json',//从php返回的值以 JSON方式 解释 
				data: "choices="+s +"&pn=" + $.getUrlVar('pn')//发给php的数据有两项，分别是上面传来的u和p 
			});
	};
	
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