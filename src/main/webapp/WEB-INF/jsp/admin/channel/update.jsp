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
<link rel="stylesheet" type="text/css" href="/static/css/info.css" />
<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/static/filebrowser/js/AddFileBrowser.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>添加新闻资讯</title>
</head>
<body>
<form:form method="post" id="theForm" name="theForm" action="/admin/channel/update">
<input type="hidden" name="id" value="${channel.id}">
<div class="box">
	<c:import url="/WEB-INF/jsp/admin/common/left_navi.jsp"></c:import>
	<div class="right">
			<div class="addChannel">
				<h1>添加频道</h1>
				<form id="form1" action="" method="post">
	        		<div class="aa1" style="height: auto;">
		            	<p style="height:40px;">频道名称<span style="color:#F00;">*</span><br><span style="color:#3b5998;">（1-20字）</span></p>
		                <div style="width:30%;height:auto;">
		                	<input value="${channel.name}" name="name" class="input_public" style="width:92%;" type="text">
		                </div>
		                <div class="onShow" id="nameTip" style="width: 20%; color: rgb(255, 0, 0); float: left; line-height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% transparent;"></div>
		                <div></div>
	            	</div>
		            <div class="aa1">
		            	<p>是否为私有频道</p>
		                <div>
		                	<input name="state" type="radio" value="0">是
		                    <input name="state" checked="checked" type="radio" value="1">否
		                </div>
		            </div>
		            <div class="aa1">
		            	<p>logo图</p>
					<input id="id_featured_image" type="text" class="vFileBrowseField" name="logo" value="${channel.logo}" />
					<a style="padding:5px 16px;" href="javascript:FileBrowser.show('id_featured_image', '/admin/media-library/browse/?pop=1&amp;type=Image');" class="fb_show">
					    <img src="/static/filebrowser/img/filebrowser_icon_show.gif" alt="" />
					</a>
		            </div>
	            	<div class="aa1">
		            	<p>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注<br><span style="color:#3b5998;">(0-50字)</span></p>
		                <div>
		                	<textarea name="remarks">${channel.remarks}</textarea>
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