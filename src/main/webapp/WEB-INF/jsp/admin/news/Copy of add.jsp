<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/jsp/admin/common/head.jsp"></c:import>
<title>添加新闻资讯</title>
</head>
<body>
<form:form method="post" id="theForm" name="theForm" action="/admin/news/add" enctype="multipart/form-data">
<div class="box">
	<c:import url="/WEB-INF/jsp/admin/common/left_navi.jsp"></c:import>
	<div class="right">
		<div class="addChannel">
			<h1>添加资讯</h1>
				<div class="aa1" style="height: auto;">
					<p>频道</p>
					<div>
						<select name="channelid" style="width: 92%; height: 25px; padding-top: 2px; font-size: 14px;">
							<option value="">请选择</option>
							<c:forEach items="${channelList}" var="t" varStatus="status">
							<option value="${t.id}">${t.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="aa1" style="height: auto;">
					<p>主标题</p>
					<div>
						<input name="title" class="input_public" style="width: 92%;" type="text">
					</div>
				</div>
				<div class="aa1" style="height: auto;">
					<p>副标题</p>
					<div>
						<input name="subtitle" class="input_public" style="width: 92%;" type="text">
					</div>
				</div>
				<div class="aa1" style="height: auto;">
					<p>作者</p>
					<div>
						<input name="author" value="Bruce" class="input_public" style="width: 92%;" type="text">
					</div>
				</div>
				<div class="aa1">
					<p>发布日期</p>
					<div class="date">
						<div class="col-wrap-4 input-text" style="position: relative;">
							<!-- style="position: absolute;z-index:1;" id="Calendar" -->
							<input type="text" data-date-format="yyyy-mm-dd" name="publishDate"
								readonly="readonly" placeholder="yyyy-mm-dd" name="txt2"
								onfocus="c.showMoreDay = false;c.show(this);"> <i
								class="icon-cal1"
								style="position: absolute; right: 1px; top: 26px; z-index: 0;"></i>
						</div>
					</div>
				</div>
				<div class="aa1" style="height: auto;">
					<p>logo图</p>
					<input id="id_featured_image" type="text" class="vFileBrowseField" name="logo" value="" />
					<a style="padding:5px 16px;" href="javascript:FileBrowser.show('id_featured_image', '/admin/media-library/browse/?pop=1&amp;type=Image');" class="fb_show">
					    <img src="/static/filebrowser/img/filebrowser_icon_show.gif" alt="" />
					</a>
				</div>
				<div class="aa1" style="height: auto;">
					<p>推荐产品</p>
					<div class="product">
						<input type="checkbox" name="product" id="" />产品1&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="product" id="" />产品2&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="product" id="" />产品3&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="product" id="" />产品4&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</div>

				<div class="aa1">
					<p>使用状态</p>
					<div>
						<input name="flag" checked="checked" type="radio" value="1">使用 
						<input name="flag" type="radio" value="0">未使用
					</div>
				</div>

				<!-- 表单编辑器 -->
				<div class="aa1 edit">
					<h3>资讯内容</h3>
					<textarea id="elm2" name="content" rows="15" cols="80" style="width: 80%">
					</textarea>
					<br /> 
					<input type="submit" name="save" value="提交" class="subText" />
				</div>
		</div>
	</div>
</div>
</form:form>
</body>
</html>