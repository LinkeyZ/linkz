<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>${ title } - 健康之星</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/static/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/static/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="//fonts.useso.com/css?family=Open+Sans:400,300" />
		

		<!-- ace styles -->
		<link rel="stylesheet" href="/static/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="/static/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="/static/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/static/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="/static/js/html5shiv.min.js"></script>
		<script src="/static/js/respond.min.js"></script>
		<![endif]-->
		
		<script src="/static/js/jquery-1.9.1.min.js"></script>
	</head>

	<body class="login-layout light-login">
		<sec:authentication property="principal" var="principal"/>
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">Ace</span>
									<span class="white" id="id-text2">Application</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; 经纶世纪医疗网络技术（北京）有限公司</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												请您选择机构
											</h4>

											<div class="space-6"></div>
											
											<c:if test="${ not empty principal.multipleRoles }">
											<c:if test="${ fn:length(principal.multipleRoles) == 1 }">
											<script type="text/javascript">
											location.href = "/admin/homepage?orgaid=${ principal.multipleRoles[0].orgaid }";
											</script>
											</c:if>
											<c:forEach items="${ principal.multipleRoles }" var="item">
											<p>
												<a href="/admin/homepage?orgaid=${ item.orgaid }" class="btn btn-link">${ item.organame }</a>
												担任的角色： 
												<c:forEach items="${ item.roleList }" var="role">
												${ role }
												</c:forEach>
											</p>
											</c:forEach>
											</c:if>
										</div><!-- /.widget-main -->
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->
							</div><!-- /.position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
	</body>
</html>
