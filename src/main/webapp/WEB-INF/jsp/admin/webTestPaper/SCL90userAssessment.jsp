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
<title>评估</title>
<link rel="stylesheet" type="text/css" href="/static/css/webTestPaper.css" />
</head>
<body>
	<div class="main">
		<h1>HCL90评估结果</h1>
		<div class="problem" id="container">
			<ul class="wenjuan" id="prob">
				
			</ul>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		doAjax();
	});
	
	function submitId(){
		$("#submitId").attr("href","/admin/web/submit");
	};

	function doAjax(){
		$.ajax({ //一个Ajax过程 
			type: "get", //以post方式与后台沟通 
			url : "/admin/assessment/release", //与此php页面沟通 
			dataType:'json',//从php返回的值以 JSON方式 解释 
			data: "userId=D2001&paperId=257",
			success:function(data){
				var score = new Array();
				score.push(100);
				score.push(100);
				score.push(100);
				score.push(100);
				score.push(100);
				score.push(100);
				score.push(100);
				score.push(100);
				score.push(100);
				
				var t = new Array();
				t.push(parseInt(data.index.a));
				t.push(parseInt(data.index.b));
				t.push(parseInt(data.index.c));
				t.push(parseInt(data.index.d));
				t.push(parseInt(data.index.e));
				t.push(parseInt(data.index.f));
				t.push(parseInt(data.index.g));
				t.push(parseInt(data.index.h));
				t.push(parseInt(data.index.i));
				
				var tAvg = new Array();
				tAvg.push(parseInt(data.index.avga));
				tAvg.push(parseInt(data.index.avgb));
				tAvg.push(parseInt(data.index.avgc));
				tAvg.push(parseInt(data.index.avgd));
				tAvg.push(parseInt(data.index.avge));
				tAvg.push(parseInt(data.index.avgf));
				tAvg.push(parseInt(data.index.avgg));
				tAvg.push(parseInt(data.index.avgh));
				tAvg.push(parseInt(data.index.avgi));
				
				debugger;

				$('#container').highcharts({
				       chart: {
				            type: 'line'
				        },
				        title: {
				            text: 'HCL90评估结果'
				        },
				        xAxis: {
				            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
				        },
				        yAxis: {
				            title: {
				                text: '因子分'
				            }
				        },
				        tooltip: {
				            enabled: false,
				            formatter: function() {
				                return '<b>'+ this.series.name +'</b><br/>'+this.x +': '+ this.y +'°C';
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
				            name: '结果',
				            data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
				        }]
			    });
				$('#container').append("<div><p>您的体质为：</div>");
				for(i = 0; i < data.assessment.length;i++){
					$('#container').append("<div>"+ data.assessment[i].name +" : " + data.assessment[i].explain + "</div>");
				}
				
				$('#container').append("<div><p>您的倾向体质为：</div>");
				for(i = 0; i < data.prefer.length;i++){
					$('#container').append("<div>"+ data.prefer[i].name +" : " + data.prefer[i].explain + "</div>");
				}
			}
		});
	};
	
	function getResult(){
		
		
		var jsonStr = "";
		if($("input:radio:checked").length < $.dataLength){
			alert("请将所有选项填写完毕再提交！！！");
		}else{
			$("input:radio:checked").each(function(){
				name = $(this).attr("name");
				val = $(this).val();
				jsonStr += "{\"" +  name + "\"" + ":" + "\"" + val + "\"}" + ",";
			});
			$.ajax({ //一个Ajax过程 
				type: "get", //以post方式与后台沟通 
				url : "/admin/web/writeInSession", //与此php页面沟通 
				dataType:'json',//从php返回的值以 JSON方式 解释 
				data: "json="+ jsonStr
			});
			//翻页
			if(parseInt($.currentPage)<parseInt($.totalPage)){
				doAjax(parseInt($.currentPage)+1);
			}else{
				$("#nextP").text("提交");
			}
		}
	}
		
</script>
</html>