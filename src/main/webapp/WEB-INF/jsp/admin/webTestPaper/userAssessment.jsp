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
		<h1>评估结果</h1>
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
			data: "userId=D2001&paperId=233",
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
					credits: {
					     enabled: false
					},
			        chart: {
			            zoomType: 'xy'
			        },
			        title: {
			            text: '我的体质图表'
			        },
			        xAxis: [{
			            categories: ['平和质','气虚质', '阳虚质', '阴虚质', '痰湿质', '湿热质', '血瘀质',
			                '气郁质', '特禀质']
			        }],
			        yAxis: {
			            min: 0,
			            title: {
			                text: '分数（分）'
			            }
			        },
			        series: [{
			        	name: '总分值',
			            color: '#4572A7',
			            type: 'column',
			            data: score,
			            tooltip: {
			                valueSuffix: ' 分'
			            }

			        }, {
			        	name: '指标',
			            type: 'spline',
			            color: '#AA4643',
			            data: t,
			            marker: {
			                enabled: false
			            },
			            dashStyle: 'shortdot',
			            tooltip: {
			                valueSuffix: ' 分'
			            }

			        }, {
			            name: '平均水平',
			            color: '#89A54E',
			            type: 'spline',
			            data: tAvg,
			            tooltip: {
			                valueSuffix: ' 分'
			            }
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