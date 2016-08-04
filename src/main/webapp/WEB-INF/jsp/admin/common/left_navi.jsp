<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="left">
	<ul class="list_title">
		<li class="first">
			<div>
				<a href="#" target="_self">资讯管理</a>
			</div>
			<ul class="sub">
				<li><a href="/admin/channel/add" target="_self">添加频道</a></li>
				<li><a href="/admin/channel/list" target="_self">管理频道</a></li>
				<li><a href="/admin/news/add" target="_self">添加资讯</a></li>
				<li><a href="/admin/news/list" target="_self">管理资讯</a></li>
			</ul>
			<div>
				<a href="#" target="_self">问卷管理</a>
			</div>
			<ul class="sub">
				<li><a href="/admin/questionBank/add" target="_self">添加试题</a></li>
				<li><a href="/admin/questionBank/list?pn=1" target="_self">管理试题</a></li>
				<li><a id = "addTestPaper" onclick="addTestPaper()" target="_self">添加问卷</a></li>
				<li><a href="/admin/testPaper/list?pn=1" target="_self">管理问卷</a></li>
			</ul>
			<div>
				<a href="#" target="_self">答题书签</a>
			</div>
			<ul class="sub">
				<li><a href="/admin/web/getTitle" target="_self">试卷列表</a></li>
				<li><a href="/admin/web/getTestList" target="_self">试卷233</a></li>
				<li><a href="/admin/web/submit" target="_self">评估结果</a></li>
			</ul>
		</li>				
	</ul>
</div>