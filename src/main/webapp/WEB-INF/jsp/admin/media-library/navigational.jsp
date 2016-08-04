<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mmednet.project.media.param.MediaParam"%>
<ol class="breadcrumb">
<%
MediaParam mediaParam = (MediaParam) request.getAttribute("param");
if ("".equals(mediaParam.getDir()) && !mediaParam.isOperate()) {
	out.print("<li class='active'>媒体库</li>");
} else {
	out.print("<li><a href='/admin/media-library/browse" + mediaParam.index() + "'>媒体库</li></a>");
	if (!"".equals(mediaParam.getDir())) {
		String[] dirs = mediaParam.getDir().split("/");
		String temp = "";
		for (int i = 0; i < dirs.length; i++) {
			if (i == (dirs.length - 1) && !mediaParam.isOperate()) {
				out.print("<li>" + dirs[i] + "</li>");
			} else {
				temp = temp + dirs[i];
				mediaParam.setDir(temp);
				out.print("<li><a href='/admin/media-library/browse" + mediaParam.toString() + "'>");
				out.print(dirs[i] + "</a></li>");
				temp = temp + "/";
			}
		}
	}
	if (mediaParam.isOperate()) {
		out.print("<li>" + mediaParam.getOperateName() + "</li>");
	}
}
%>
</ol>