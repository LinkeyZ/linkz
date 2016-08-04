<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="principal" />


<div class="page-header">
	<h1>
		Index Admin
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<sec:authentication property="principal" var="authentication"/>
		<p>
			<sec:authorize ifAllGranted="院长">可以访问</sec:authorize>
		</p>
		<p>
			用户名：${ authentication.username }
		</p>
		<p>
			机构ID：${ authentication.organization }
		</p>
		<p>UserSession：</p> 
		<ul>
			<li>${ authentication.userid }</li>
			<li>
				<ul class="nav nav-list" id="nav-nav-list">
				<%-- <c:forEach var="menu" items="${ authentication.menus }">
					<li class="">
						<a href="#" class="dropdown-toggle"> 
							<i class="menu-icon fa fa-cogs"></i> 
							<span class="menu-text"> ${ menu.key }</span> 
							<b class="arrow fa fa-angle-down"></b> 
						</a> 
						
						<b class="arrow"></b>
						<ul class="submenu">
						<c:forEach var="item" items="${ menu.value }">
							<li class="">
								<a href="${ item.url }">
									<i class="menu-icon fa fa-caret-right"></i> ${ item.name }
								</a>
								<b class="arrow"></b>
							</li>
						</c:forEach>
						</ul>
					</li>
				</c:forEach> --%>
				</ul>
			</li>
			<li>${ authentication.authorities }</li>
		</ul>
		<sec:authentication property="name" />
		<sec:authentication property="authorities" var="authorities" />
		
		
		
		<ul>
		    <c:forEach items="${authorities}" var="authority">
		        <li>${authority.authority}</li>
		    </c:forEach>
		</ul>
		
		<sec:authorize access="hasRole('院长')">
			<p>
		  This content will only be visible to users who have the "supervisor" authority in their list of <tt>GrantedAuthority</tt>s.
			</p>
		</sec:authorize>
		
		<sec:authorize url="/admin/homepage">
			<p>
		  This content will only be visible to users who are authorized to send requests to the "/admin" URL.
			</p>
		</sec:authorize>
		
		<sec:authorize ifAllGranted="">
		
		</sec:authorize>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>
