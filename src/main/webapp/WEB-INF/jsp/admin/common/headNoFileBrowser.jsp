<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/static/css/info.css" />

<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>

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
	//点击添加试卷时，在后台清空Session数据
	function addTestPaper(){
		
		$("#addTestPaper").attr("href","/admin/testPaper/add?pn=1");
		
		$.ajax({ //一个Ajax过程 
			type: "post", //以post方式与后台沟通 
			url : "/admin/testPaper/delSession", //与此php页面沟通 
			dataType:'json'
		});
	};
</script>
<script type="text/javascript">
	var c = new Calendar("c");
	document.write(c);
</script>
