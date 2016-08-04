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
	            type: 'column'
	        },

	        title: {
	            text: 'Total fruit consumtion, grouped by gender'
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
	            column: {
	                stacking: 'normal'
	            }
	        },

	        series: [{
	            name: '清醒时长',
	            // [5, 3, 4, 7, 2]
	            data: [
	           		[Date.UTC(2015,6,6), 5], 
                	[Date.UTC(2015,6,7), 3], 
                   	[Date.UTC(2015,6,8), 5], 
                   	[Date.UTC(2015,6,9), 7], 
                   	[Date.UTC(2015,6,10), 2]
	            ],
	            stack: 'male'
	        }, {
	            name: '睡眠时长',
	            // [3, 4, 4, 2, 5]
	            data: [
	            	[Date.UTC(2015,6,6), 3], 
	            	[Date.UTC(2015,6,7), 4], 
	            	[Date.UTC(2015,6,8), 4], 
	            	[Date.UTC(2015,6,9), 2], 
	            	[Date.UTC(2015,6,10), 5]],
	            stack: 'male'
	        }, {
	            name: '深睡眠时长',
	            // [2, 5, 6, 2, 1]
	            data: [[Date.UTC(2015,6,6), 2], 
	                   [Date.UTC(2015,6,7), 5], 
	                   [Date.UTC(2015,6,8), 9], 
	                   [Date.UTC(2015,6,9), 2], 
	                   [Date.UTC(2015,6,10), 1]],
	            stack: 'female'
	        }, {
	            name: '浅睡眠时长',
	            // [3, 0, 4, 4, 3]
	            data: [[Date.UTC(2015,6,6), 3], 
	                   [Date.UTC(2015,6,7), 0], 
	                   [Date.UTC(2015,6,8), 4], 
	                   [Date.UTC(2015,6,9), 4], 
	                   [Date.UTC(2015,6,10), 2]],
	            stack: 'female'
			}]
		});
	});
</script>
<title>${ title }</title>
</head>
<body>
	<div id="container"></div>
</body>
</html>
