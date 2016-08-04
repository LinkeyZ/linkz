 $(document).ready(function(){
	     //问卷答案填充
         var ans = json[0].answerHistoryRecord;
         for ( var i = 0; i < ans.length; i++) {
        	 var code = ans[i].questionCode;
        	 //(1单选；2多选；3填空；4单选+填空；5多选+填空)
        	 var type = ans[i].type;
        	 var option = ans[i].multipleOptionsAnswers[0].option;
        	 var answer = ans[i].multipleOptionsAnswers[0].answer;
        	 option = option.toUpperCase();
        	 $("#"+code+"_div").show();
        	 //单选
        	 if(type==1){
        	     $("#"+code+"_"+option).prop("checked","checked");
        	 }
        	 
        	 //多选
        	 if(type==2){
        		var options = ans[i].multipleOptionsAnswers;
            	 for ( var j = 0; j < options.length; j++) {
            		 $("#"+code+"_"+options[j].option).prop("checked","checked");
				 }
        	 }
        	 
        	 
		 }
         //设置显示出来的DIV的编号（动态设置题目编号）
         var j = 1;
         $(".txt_select").each(function(){
        	 if(!$(this).is(":hidden")){
        		 var _p = $(this).find("p");
            	 $(_p).html(j+"."+$(_p).html());
            	 j++;
        	 }
         });

});