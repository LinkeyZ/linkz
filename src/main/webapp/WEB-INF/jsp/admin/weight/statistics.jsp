<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/static/js/highcharts/highcharts.js"></script>
<script type="text/javascript"
	src="/static/js/highcharts/highcharts-more.js"></script>
<script type="text/javascript" src="/static/js/highcharts/exporting.js"></script>
<script type="text/javascript"
	src="/static/js/highcharts/solid-gauge.src.js"></script>
<script type="text/javascript"
	src="/static/js/highcharts/themes/gray.js"></script>
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
		$("#container").highcharts(
				{
					/* chart : {
						events : {
							load : function() {
								var seriesWrin = this.series[0];
								var isDo = false;
								var warn = setInterval(function() {
									seriesWrin.points[0].update({
										marker : {
											symbol : 'url(/static/images/rd.gif)'
										}
									});
									isDo = true;
									if (isDo) {
										clearInterval(warn);
									}
								}, 1000);
							}
						}
					}, */
					title : {
						text : '体重趋势图',
						x : -20
					//center
					},
					credits : {
						text : 'hcc.mmednet.com',
						href : 'http://hcc.mmednet.com'
					},

					xAxis : {
						type : 'datetime',
						dateTimeLabelFormats : {
							day : '%Y年%b%e日'
						},
						minTickInterval : 24 * 3600 * 1000,
						showFirstLabel: true,
						gridLineWidth : 0

					//纵向网格线宽度
					},
					yAxis : {
						title : {
							text : 'kg'
						},
						plotLines : [ {
							value : 0,
							width : 1,
							color : '#808080'
						} ]
					},
					legend : {
						layout : 'vertical',
						align : 'right',
						verticalAlign : 'middle',
						borderWidth : 0
					},
					series : [ {
						name : '体重(kg)',
						data : eval("${weightdata.weightArr}")
					} ],
					tooltip : {
						formatter : function() {
							return '<b>'
									+ Highcharts.dateFormat('%Y年%b%e日', this.x)
									+ '</b><br>' + this.series.name + ': '
									+ this.y;
						}
					},
				});
	});
</script>
<title>体重监测</title>
</head>
<body>
	<div id="container"></div>
</body>
</html>
