<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="principal" />
<div class="navbar-container" id="navbar-container">
	<button type="button" class="navbar-toggle menu-toggler pull-left"
		id="menu-toggler" data-target="#sidebar">
		<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

		<span class="icon-bar"></span> <span class="icon-bar"></span>
	</button>

	<div class="navbar-header pull-left">
		<a href="#" class="navbar-brand"> 
			<small>
				<i class="fa fa-leaf"></i> ${ principal.orgaInfo.name } 
			</small>
		</a>
	</div>
	
	<div class="navbar-buttons navbar-header pull-right" role="navigation">
		<ul class="nav ace-nav">
			<li class="light-blue">
				<a data-toggle="dropdown" href="#" class="dropdown-toggle"> 
					<img class="nav-user-photo" src="/linkz/static/avatars/user.jpg" alt="Jason's Photo" /> 
					<span class="user-info"> 
					<small>欢迎,</small> ${ principal.user.username } 
					</span> 
					<i class="ace-icon fa fa-caret-down"></i> </a>
				<ul
					class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
					<li>
						<a href="#"> 
							<i class="ace-icon fa fa-cog"></i>
							Settings
						</a>
					</li>

					<li>
						<a href="profile.html"> 
							<i class="ace-icon fa fa-user"></i>
							Profile 
						</a>
					</li>

					<li class="divider"></li>

					<li>
						<a href="/j_spring_security_logout"> 
							<i class="ace-icon fa fa-power-off"></i>
							登出 
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<!-- /.navbar-container -->