<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav nav-list" id="nav-nav-list">
	<li class="" id="1">
		<a href="/admin/homepage"> 
			<i class="menu-icon fa fa-tachometer"></i> 
			<span class="menu-text"> Dashboard </span> 
		</a> 
		
		<b class="arrow"></b>
	</li>
	
	<li class="" id="2">
		<!-- 一级菜单 -->
		<a href="#" class="dropdown-toggle"> 
			<i class="menu-icon fa fa-cogs"></i> 
			<span class="menu-text"> 设置 </span> 
			<b class="arrow fa fa-angle-down"></b> 
		</a> 
		
		<b class="arrow"></b>
		
		<!-- 二级菜单 -->
		<ul class="submenu">
			<li class="">
				<a href="/admin/organization/list">
					<i class="menu-icon fa fa-caret-right"></i> 机构管理
				</a>
				<b class="arrow"></b>
			</li>
			
			<li class="">
				<a href="/admin/user/manage"> 
					<i class="menu-icon fa fa-caret-right"></i> 用户管理
				</a> 
				<b class="arrow"></b>
			</li>

			<li class="">
				<a href="/admin/role/manage"> 
					<i class="menu-icon fa fa-caret-right"></i> 角色管理 
				</a> 
				<b class="arrow"></b>
			</li>
			
			<li class="">
				<a href="/admin/module/manage"> 
					<i class="menu-icon fa fa-caret-right"></i> 资源模块管理 
				</a> 
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="/admin/cronjob/manage"> 
					<i class="menu-icon fa fa-caret-right"></i> 任务计划管理 
				</a> 
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="/admin/binding/manage"> 
					<i class="menu-icon fa fa-caret-right"></i> 绑定关系管理 
				</a> 
				<b class="arrow"></b>
			</li>
		</ul>
	</li>
	
	<li class="" id="3">
		<!-- 一级菜单 -->
		<a href="#" class="dropdown-toggle"> 
			<i class="menu-icon fa fa-cogs"></i> 
			<span class="menu-text"> 内容管理 </span> 
			<b class="arrow fa fa-angle-down"></b> 
		</a> 
		
		<b class="arrow"></b>
		
		<ul class="submenu">
			<li class="">
				<a href="/admin/channel/manage">
					<i class="menu-icon fa fa-caret-right"></i> 频道管理
				</a>
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="/admin/news/manage">
					<i class="menu-icon fa fa-caret-right"></i> 资讯管理
				</a>
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="/admin/media-library/browse">
					<i class="menu-icon fa fa-caret-right"></i> 媒体管理
				</a>
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="/admin/questionBank/list">
					<i class="menu-icon fa fa-caret-right"></i> 试题管理
				</a>
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="/admin/testPaper/list?pn=1">
					<i class="menu-icon fa fa-caret-right"></i> 试卷管理
				</a>
				<b class="arrow"></b>
			</li>
		</ul>
	</li>
	<li class="" id="4">
		<!-- 一级菜单 -->
		<a href="#" class="dropdown-toggle">
			<i class="menu-icon fa fa-cogs"></i>
			<span class="menu-text">用户端 </span>
			<b class="arrow fa fa-angle-down"></b>
		</a>

		<b class="arrow"></b>

		<ul class="submenu">
			<li class="" subMenuId="1">
				<a href="/admin/bloodPressure/manager?parentMenuId=4&subMenuId=1">
					<i class="menu-icon fa fa-caret-right"></i> 血压管理
				</a>
				<b class="arrow"></b>
			</li>
			<li class="" subMenuId="2">
				<a href="/admin/weight/manager?parentMenuId=4&subMenuId=2">
					<i class="menu-icon fa fa-caret-right"></i> 体重管理
				</a>
				<b class="arrow"></b>
			</li>
			<li class="" subMenuId="3">
				<a href="/admin/bloodGlucose/manager?parentMenuId=4&subMenuId=3">
					<i class="menu-icon fa fa-caret-right"></i> 血糖管理
				</a>
				<b class="arrow"></b>
			</li>
			<li class="" subMenuId="4">
				<a href="/admin/bloodOximete/manager?parentMenuId=4&subMenuId=4">
					<i class="menu-icon fa fa-caret-right"></i> 血氧管理
				</a>
				<b class="arrow"></b>
			</li>
			<li class="" subMenuId="5">
				<a href="/admin/sleep/manager?parentMenuId=4&subMenuId=5">
					<i class="menu-icon fa fa-caret-right"></i> 睡眠管理
				</a>
				<b class="arrow"></b>
			</li>
		</ul>
	</li>
	<li class="" id="5">
		<a href="/admin/test"> 
			<i class="menu-icon fa fa-picture-o"></i> 
			<span class="menu-text"> Gallery </span> 
		</a> 
		<b class="arrow"></b>
	</li>
</ul>
<!-- /.nav-list -->