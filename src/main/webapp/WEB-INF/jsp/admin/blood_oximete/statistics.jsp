<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/static/js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="/static/js/highcharts/highcharts-more.js"></script>
<script type="text/javascript" src="/static/js/highcharts/exporting.js"></script>
<script type="text/javascript" src="/static/js/highcharts/solid-gauge.src.js"></script>
<script type="text/javascript" src="/static/js/highcharts/themes/gray.js"></script>
<script type="text/javascript" src="/static/js/jquery.folder.tabs.js"></script>
<link rel="stylesheet" href="/static/css/jquery-folder-tabs.css" />
<link rel="stylesheet" href="/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="/static/css/font-awesome.min.css" />
<script type="text/javascript">
	$(function() {
		Highcharts.setOptions({
			lang : {
				contextButtonTitle : "图表菜单",
				printChart : "打印图片",
				downloadJPEG : "下载JPEG 图片",
				downloadPDF : "下载PDF文档",
				downloadPNG : "下载PNG 图片",
				downloadSVG : "下载SVG 矢量图",
				exportButtonTitle : "导出图片",
				shortMonths : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月',
						'9月', '10月', '11月', '12月' ],
				weekdays : [ '星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六' ],
				printButtonTitle : '打印'
			}
		});
		chart1 = new Highcharts.Chart({
			chart : {
				renderTo : 'container', //装载图表的div容器id
			},
			title : {
				text : '血氧趋势图',
				x : -20
			},
			credits : {
				text : 'hcc.mmednet.com',
				href : 'http://hcc.mmednet.com'
			},
			xAxis : {
				type : 'datetime',
				labels: {
	                formatter: function() {
	                		if($("input[name='myTabIndex']").val() == 3){
	                			 return Highcharts.dateFormat('%Y年%b', this.value); 
	                		}else{
	                			 return Highcharts.dateFormat('%b%e', this.value);      
	                		}
	                }
	            },
				minTickInterval : 24 * 3600 * 1000
			},
			yAxis : [{
				lineWidth: 1,
            		title: {
                    text: '饱和度'
                }
			},{
				lineWidth: 1,
				opposite: true,
	        		title: {
	                text: '脉率'
	            }
			}],
			tooltip : {
				shared : true,
				xDateFormat : '%Y-%m-%d',
			},
			legend : {
				layout : 'vertical',
				align : 'right',
				verticalAlign : 'middle',
			},
			series : [ {
				name : '饱和度',
				data : eval("${data.saturation}"),
				tooltip : {
					valueSuffix : ' %'
				}
			}, {
				name : '脉率',
				data : eval("${data.pr}"),
				tooltip : {
					valueSuffix : ' 次/分'
				},
				yAxis:1
			}],
		});
		
		$("#prev").on("click",function(){
			var year = $("#calendar1 > span:first").text();
			var month = $("#calendar1 > span:last").text();
			var year2 = year;
			var month2 = parseInt(month) - 1;
			if (month2 == 0) {
	             year2 = parseInt(year2) - 1;
	             month2 = 12;
	        }
			var range = $("input[name='myTabIndex']").val()
			var startDate = year2+"-"+month2;
			window.location.href="statistics?range="+range+"&startDate="+startDate+"&year="+year2+"&month="+month2; 			
			
		});
		
		$("#next").on("click",function(){
			var year = $("#calendar1 > span:first").text();
			var month = $("#calendar1 > span:last").text();
			var year2 = year;
            var month2 = parseInt(month) + 1;
            if (month2 == 13) {
               year2 = parseInt(year2) + 1;
               month2 = 1;
            }
            var range = $("input[name='myTabIndex']").val()
			var startDate = year2+"-"+month2;
			window.location.href="statistics?range="+range+"&startDate="+startDate+"&year="+year2+"&month="+month2; 			
		});
		
		$("#prev2").on("click",function(){
			var year = $("#calendar2 > span:first").text();
			var year2 = parseInt(year) - 1;
			var range = $("input[name='myTabIndex']").val()
			window.location.href="statistics?range="+range+"&startDate="+year2+"&year="+year2; 			
		});
		$("#next2").on("click",function(){
			var year = $("#calendar2 > span:first").text();
			var year2 = parseInt(year) + 1;
			var range = $("input[name='myTabIndex']").val()
			window.location.href="statistics?range="+range+"&startDate="+year2+"&year="+year2; 			
		});
	});
</script>
<title>血糖监测</title>
</head>
<body>
	<input type="hidden" name="myTabIndex" value="${myTabIndex}" />
	<ul id="tabs">
		<li><a href="statistics?range=1" name="tab1">月</a></li>
		<li><a href="statistics?range=2" name="tab2">年</a></li>
		<li><a href="statistics?range=3" name="tab3">全部</a></li>
	</ul>
	<div id="center">
		<ul class="pager" id="calendar1">
			<li class="previous">
				<a href="#" id="prev"><i class="fa fa-arrow-left"></i></a>
			</li>
				<span class="year">${year }</span>年<span class="month">${month }</span>月
			<li class="next">
				<a href="#" id="next"><i class="fa fa-arrow-right"></i></a>
			</li>
		</ul>
		<ul class="pager" id="calendar2">
			<li class="previous">
				<a href="#" id="prev2"><i class="fa fa-arrow-left"></i></a>
			</li>
				<span class="year">${year }</span>年
			<li class="next">
				<a href="#" id="next2"><i class="fa fa-arrow-right"></i></a>
			</li>
		</ul>
	</div>
	<div id="content">
		<div id="container"></div>
	</div>
</body>
</html>
