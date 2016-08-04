<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/static/js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="/static/js/highcharts/highcharts-more.js"></script>
<script type="text/javascript" src="/static/js/highcharts/exporting.js"></script>
<script type="text/javascript" src="/static/js/highcharts/solid-gauge.src.js"></script>
<script type="text/javascript" src="/static/js/highcharts/themes/grid.js"></script>
<script type="text/javascript" src="/static/js/jquery.folder.tabs.js"></script>
<link rel="stylesheet" href="/static/css/jquery-folder-tabs.css" />
<link rel="stylesheet" href="/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="/static/css/font-awesome.min.css" />
<style>
#center{ 
MARGIN-RIGHT: auto;
MARGIN-LEFT: auto;
width:200px;
vertical-align:middle;
line-height:20px;
}
</style>
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
		$("#container").highcharts({
			chart: {
				type: 'line'
			},

	        title: {
	            text: '${ title }'
	        },

	        xAxis: {
	            // categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
	        	type : 'datetime',
				dateTimeLabelFormats : {
					day : '%Y年%b%e日'
				},
				minTickInterval : 24 * 3600 * 1000,
				gridLineWidth : 0,
				labels:{ 
			        step: 1
			    }
	        },

	        yAxis: {
	            allowDecimals: false,
	            min: 0,
	            title: {
	                text: 'Number of fruits'
	            }
	        },

	        tooltip: {
	            formatter: function () {
	            	return '<b>'
						+ Highcharts.dateFormat('%Y年%b%e日', this.x)
						+ '</b><br>' + this.series.name + ': '
						+ this.y + ' 小时';
	            }
	        },

	        plotOptions: {
	            line: {
	                dataLabels: {
	                    enabled: true
	                },
	                enableMouseTracking: false
	            }
	        },

	        series: [{
	            name: '步数',
	            // [5, 3, 4, 7, 2]
	            data: eval('${ data.steps }'),
	            stack: 'male'
	        }]
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
			$("#calendar1 > span:first").text(year2);
			$("#calendar1 > span:last").text(month2);
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
            $("#calendar1 > span:first").text(year2);
			$("#calendar1 > span:last").text(month2);
		});
		
		$("#prev2").on("click",function(){
			var year = $("#calendar2 > span:first").text();
			$("#calendar2 > span:first").text(parseInt(year) - 1);
		});
		$("#next2").on("click",function(){
			var year = $("#calendar2 > span:first").text();
			$("#calendar2 > span:first").text(parseInt(year) + 1);
		});
	});
</script>
<title>${ title }</title>
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
				<span class="year">2015</span>年<span class="month">7</span>月
			<li class="next">
				<a href="#" id="next"><i class="fa fa-arrow-right"></i></a>
			</li>
		</ul>
		<ul class="pager" id="calendar2">
			<li class="previous">
				<a href="#" id="prev2"><i class="fa fa-arrow-left"></i></a>
			</li>
				<span class="year">2016</span>年
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
