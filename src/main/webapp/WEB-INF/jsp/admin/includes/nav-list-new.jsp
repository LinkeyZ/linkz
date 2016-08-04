<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="authentication"/>
<ul class="nav nav-list" id="nav-nav-list">
	<li class="" id="-1">
		<a href="/admin/homepage?orgaid=${ authentication.organization }&parentMenuId=-1&subMenuId=-1" > 
			<i class="menu-icon fa fa-desktop"></i>
			<span class="menu-text"> 控制平台 </span> 
		</a> 
		
		<b class="arrow"></b>
	</li>
	<c:forEach var="parentMenu" items="${ authentication.menus }" >
		<li class='<c:if test="${parentMenu.id == sessionScope.parentMenuId}">active open</c:if>' id="${parentMenu.id }">
			<a href="#" class="dropdown-toggle"> 
				<i class="menu-icon fa fa-cogs"></i> 
				<span class="menu-text"> ${parentMenu.name } </span> 
				<b class="arrow fa fa-angle-down"></b>
			</a> 
			<b class="arrow"></b>
			<ul class="submenu">
			<c:forEach var="subMenu" items="${parentMenu.children }">
				<li class='<c:if test="${subMenu.id == sessionScope.submenuId}">active</c:if>' submenuid="${subMenu.id}">
					<a href="${subMenu.url}?parentMenuId=${parentMenu.id }&subMenuId=${subMenu.id}">
						<i class="menu-icon fa fa-caret-right"></i>${subMenu.name }
					</a>
					<b class="arrow"></b>
				</li>
			</c:forEach>
			</ul>
		</li>
	</c:forEach>
</ul>
<!-- /.nav-list -->