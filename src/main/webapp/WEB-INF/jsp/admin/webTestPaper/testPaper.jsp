<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/static/css/webTestPaper.css" />
</head>
<body>
	<div class="main">
		<h1>调查问卷</h1>
		<div class="problem" >
			<ul class="wenjuan" id="prob">
				
			</ul>
		</div>
		<a onclick="getResult(1)" id="nextP">下一页|提交</a>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		doAjax(1);
	});
	
	$.extend({
		  getUrlVars: function(){
		    var vars = [], hash;
		    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
		    for(var i = 0; i < hashes.length; i++)
		    {
		      hash = hashes[i].split('=');
		      vars.push(hash[0]);
		      vars[hash[0]] = hash[1];
		    }
		    return vars;
		  },
		  getUrlVar: function(name){
		    return $.getUrlVars()[name];
		  }
		});
	
	function doAjax(page){
		$.ajax({ //一个Ajax过程 
			type: "get", //以post方式与后台沟通 
			url : "/admin/questionApp/list", //与此php页面沟通 
			dataType:'json',//从php返回的值以 JSON方式 解释 
			data: "userId=D2001&requestPage="+page+"&paperId="+$.getUrlVar('paperId'),
			success:function(data){
				
				//将以选中的题目隐藏
				$("input:radio:checked").parent().parent().parent().hide();
				
				
				//题目总数
				$.questionCount = data.questionCount;
				$.totalPage = data.totalPage;
				$.currentPage = data.currentPage;
				$.dataLength = data.contentList.length * parseInt($.currentPage);
				
				console.info("成功！！！");
				
				for(i = 0; i < data.contentList.length; i++){
					type = data.contentList[i].type;
					if(type == 1){
						div = "<div class=\"answer\" type=\"1\">" ;
					}else if(type == 2){
						div = "<div class=\"answer\" type=\"2\">" ;
					}else if(type ==3){
						div = "<div class=\"answer\" type=\"3\">" ;
					}else{
						alert("出错了1！！！！！！ ");
					}
					var li = "";
					for(j = 0; j < data.contentList[i].choiceList.length; j++){
						
						var choice;
						var flag;
						var choiceA = data.contentList[i].choiceList[j].A;
						var choiceB = data.contentList[i].choiceList[j].B;
						var choiceC = data.contentList[i].choiceList[j].C;
						var choiceD = data.contentList[i].choiceList[j].D;
						var choiceE = data.contentList[i].choiceList[j].E;
						
						if(typeof(choiceA) != "undefined"){
							choice = choiceA;
							flag = "A";
						}
						else if(typeof(choiceB) != "undefined"){
							choice = choiceB;
							flag = "B";
						}
						else if(typeof(choiceC) != "undefined"){
							choice = choiceC;
							flag = "C";
						}
						else if(typeof(choiceD) != "undefined"){
							choice = choiceD;
							flag = "D";
						}
						else if(typeof(choiceE) != "undefined"){
							choice = choiceE;
							flag = "E";
						}
						
						liTemp = "<li><input type=\"radio\" name="
							+ data.contentList[i].id
							+ " value="
							+ flag 
							+ ">"
							+ choice
							+ "</label></li>";
						li += liTemp;
					}
					
					$("#prob").append("<li>"
							+ "<ul id=q" + data.contentList[i].serial + ">"
							+ "<p>"
							+ data.contentList[i].serial 
							+ "." + data.contentList[i].content 
							+ "</p>"
							+ div
							+ li
							+ "</div></ul>"
					);
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
				if($("input:radio:checked").length < $.questionCount){
					alert("请将所有选项填写完毕再提交！！！");
				}else{
					$("#nextP").attr("href","/admin/web/submit");
				}
			}
			
		}
	}
		
</script>
</html>