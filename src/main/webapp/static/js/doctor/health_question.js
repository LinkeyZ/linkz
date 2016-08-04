 $(document).ready(function(){
	 
	      //家族史处理
	     if(''!=familyHistory&&null!=familyHistory){
	    	 var fhs = familyHistory.split(";");
	    	 for ( var k = 0; k < fhs.length; k++) {
				var fn = fhs[k].split(",");
				$("#"+fn[0]).prop("checked","checked");
			 }
	     }
	     
	     //问卷答案填充
         var ans = json[0].answerHistoryRecord;
         for ( var i = 0; i < ans.length; i++) {
        	 var code = ans[i].questionCode;
        	 //(1单选；2多选；3填空；4单选+填空；5多选+填空)
        	 var type = ans[i].type;
        	 var option = ans[i].multipleOptionsAnswers[0].option;
        	 var answer = ans[i].multipleOptionsAnswers[0].answer;
        	 
        	 //单选
        	 if(type==1){
        	     $("#"+code+"_"+option).prop("checked","checked");
        	     var showdiv = $("#"+code+"_"+option).attr("showdiv");
        	     if(showdiv=="1"){
        	    	 $("[id^="+code+"_div]").show();
        	     }
        	 }
        	 
        	 //多选
        	 if(type==2){
        		var options = ans[i].multipleOptionsAnswers;
            	 for ( var j = 0; j < options.length; j++) {
            		 $("#"+code+"_"+options[j].option).prop("checked","checked");
            		 var showdiv = $("#"+code+"_"+options[j].option).attr("showdiv");
            	     if(showdiv=="1"){
            	    	 $("[id^="+code+"_div]").show();
            	     }
				 }
        	 }
        	 
        	 //填空
        	 if(type==3){
        	     $("input[name='"+code+"']").val(answer);
        	 }
        	 
		 }

});