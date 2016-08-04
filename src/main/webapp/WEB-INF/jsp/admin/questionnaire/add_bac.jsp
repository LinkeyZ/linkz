<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/jsp/admin/common/headNoFileBrowser.jsp"></c:import>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(".list_title div").click(
					function(event) {
						var _index = $(this).index();
						$(this).siblings('.sub').stop().slideToggle(200)
								.parent().siblings('li').children('.sub').slideUp(200);
				});
				$(".list_title .sub li").click(function(event) {
					$(this).addClass('current').siblings('li').removeClass('current');
				});
			});
</script>
<script type="text/javascript">
	var c = new Calendar("c");
	document.write(c);
</script>
<title>添加试题</title>
</head>
<body>
<form:form method="post" id="theForm" name="theForm" action="/admin/questionBank/add">
<div class="box">
	<c:import url="/WEB-INF/jsp/admin/common/left_navi.jsp"></c:import>
	<div class="right">
			<div class="addChannel">
				<h1>添加试题</h1>
				<form id="form1" action="" method="post">
	        		<div class="aa1" style="height: auto;">
	        			<p style="height:40px;">试题类型
	        			<div>
		                	<input name="type"  checked="checked" type="radio" value="1">单选题
		                    <input name="type"  type="radio" value="2">多选题
		                    <input name="type" type="radio" value="3">判断题
		                </div>
	            	</div>
		            <div class="aa1">
		            	<p>试题科别</p>
		                <div>
		                	<select name="catalog">  
							  <option value ="1">中医</option>  
							  <option value ="2">西医</option>  
							  <option value="3">运动</option>  
							  <option value="4">饮食</option>  
							</select>  
		                </div>
		            </div>
	            	<div class="aa1">
		            	<p>试题内容<br><span style="color:#3b5998;">(0-50字)</span></p>
		                <div>
		                	<textarea name="content"></textarea>
		                </div>                	
	            	</div>
	            	
	            	<div class="aa1">
		            	<p>选项A：<br>
		                <div style="width:30%;height:auto;">
		                	<input name="choiceA" class="input_public" style="width:92%;" type="text" value="没有">
		                </div>
	            	</div>
	            	
	            	<div class="aa1">
		            	<p>选项B：<br>
		                <div style="width:30%;height:auto;">
		                	<input name="choiceB" class="input_public" style="width:92%;" type="text" value="很轻">
		                </div>               	
	            	</div>
	            	
	            	<div class="aa1">
		            	<p>选项C：<br>
		                <div style="width:30%;height:auto;">
		                	<input name="choiceC" class="input_public" style="width:92%;" type="text" value="中等">
		                </div>    
	            	</div>
	            	
	            	<div class="aa1">
		            	<p>选项D：<br>
		                <div style="width:30%;height:auto;">
		                	<input name="choiceD" class="input_public" style="width:92%;" type="text" value="偏重">
		                </div>      
	            	</div>
	            	
	            	<div class="aa1">
		            	<p>选项E：<br>
		                <div style="width:30%;height:auto;">
		                	<input name="choiceE" class="input_public" style="width:92%;" type="text" value="严重">
		                </div> 
	            	</div>
	            	
	            	<div class="aa1">
		            	<p>选项F：<br>
		                <div style="width:30%;height:auto;">
		                	<input name="choiceF" class="input_public" style="width:92%;" type="text" value="">
		                </div> 
	            	</div>
	            	<div class="button">
	        			<input id="submit" class="but-02" type="submit" value="提交"></input>
					</div>
            	</form>
		</div>
	</div>
</div>
</form:form>
</body>
</html>