<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>
<title>试卷列表</title>
<link rel="stylesheet" type="text/css" href="/static/css/webTestPaper.css" />
</head>
<body>
	<div class="main">
		<h1>试卷列表</h1>
		<div class="problem" >
			<ul class="wenjuan" id="prob">
			</ul>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		doAjax();
	});
	
	function doAjax(){
		$.ajax({ //一个Ajax过程 
			type: "get", //以post方式与后台沟通 
			url : "/admin/questionApp/getTitle", //与此php页面沟通 
			dataType:'json',//从php返回的值以 JSON方式 解释 
			data: "userId=D201",
			success:function(data){
				for(i = 0; i < data.length; i++){
					for(var j in data[i]){
						$("#prob").append("<li><a id =\"" + j + "\" onclick=\"getChoice("+j+")\">" + data[i][j] + "</a></li>");
//						$("#prob").append("<li><a href=\"/admin/web/switchPoint\">" + data[i][j] + "</a></li>");
						
					}
				}
			}
		});
	};
	
	function getChoice(paperId){
		$("#"+paperId).attr("href","/admin/web/switchPoint?userId=D201&paperId="+paperId );
	}
</script>
</html>