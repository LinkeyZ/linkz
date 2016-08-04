$(document).ready(function() {
	$("#radio_search a").click(function(event) {
		$(this).addClass('checked').siblings('a').removeClass('checked');
	});

	$("#tab_yujing ul li").click(function(event) {
		$(this).addClass('cur').siblings().removeClass('cur');
		var index=$(this).index();
		if (index==0) {
			$("#xueya").css("display","block");;
			$("#xuetang").css("display","none");
		} 
		else{
			$("#xueya").css("display","none");
			$("#xuetang").css("display","block");
		}
	});

	$("#customer_tab li").click(function(event) {
		$(this).addClass('cur').siblings().removeClass('cur');
		var index=$(this).index();
		$(" .con").children('div').eq(index).addClass('cur').siblings().removeClass('cur');
	});
	$("#customer_tab li").hover(function() {
		/*$(this).children('s').css("display","block");*/
		$(this).children('ul').css("display","block");
	}, function() {
		/*$(this).children('s').css("display","none");*/
		$(this).children('ul').css("display","none");
	});

	//健康档案的一系列弹框
	$("#add_baogao").click(function(event) {
		$(".heian").css("display","block");
		$("#add_baogao_kuang").css("display","block");
	});
	$("#add_huayan").click(function(event) {
		$(".heian").css("display","block");
		$("#add_huayan_kuang").css("display","block");
	});
	$("#add_yingxiang").click(function(event) {
		$(".heian").css("display","block");
		$("#add_yingxiang_kuang").css("display","block");
	});
	$("#add_zhenliao").click(function(event) {
		$(".heian").css("display","block");
		$("#add_zhenliao_kuang").css("display","block");
	});
	$("#jibing").click(function(event) {
		$(".heian").css("display","block");
		$("#add_jibing_kuang").css("display","block");
	});
	$("#bingshi").click(function(event) {
		$(".heian").css("display","block");
		$("#add_bingshi_kuang").css("display","block");
	});

	//弹出疾病框
	$("#add_jibing_kuang .bottom table td").each(function(index, el) {
		var index_table=$(this).index();
		if(index_table%2==0){
			$(this).css("border-left","0");
		}
		else{
			$(this).css("border-right","0");
		}
	});	


	$("#add_jibing_kuang .bottom table td ul li").click(function(event) {
		var class_check=$(this).attr("class");
		if(class_check=="cur"){
			$(this).removeClass('cur');
		}
		else{
			$(this).addClass('cur');
		}
	});

	//弹出病史框
	$("#add_bingshi_kuang .bottom table td span").click(function(event) {
		var class_check=$(this).attr("class");
		if(class_check=="cur"){
			$(this).removeClass('cur');
		}
		else{
			$(this).addClass('cur');
		}
	});

	//增加疾病
	$("#btn_jibing").click(function(event) {
		$(".close").trigger('click');

		var str_jibing="";
		$("#add_jibing_kuang .bottom table td ul li").each(function(index, el) {
			var class_check=$(this).attr("class");
			if(class_check=="cur"){
				str_jibing+=$(this).html()+"，";
			}			
		});
		str_jibing=str_jibing.substring(0,str_jibing.length-1);
		$("#show_jibing span").text(str_jibing);
	});

	//增加病史
	$("#btn_bingshi").click(function(event) {
		$(".close").trigger('click');

		var str_all_bingzheng="";//循环出所有病症
		$("#add_bingshi_kuang .bottom table tr").each(function(index, el) {
			var index_tr=$(this).index();
			//不是第一行
			if(index_tr!=0){
				str_all_bingzheng+=$(this).children('td').html()+"|";
			}
		});
		str_all_bingzheng=str_all_bingzheng.substring(0,str_all_bingzheng.length-1);

		var arry_bingzheng=str_all_bingzheng.split('|');//所有病症数组
		var str_Info="";
		var str_select_bingshi="";
		var arry=["父亲","母亲","兄弟","姐妹"];
		//循环出家庭成员得病症的
		for (var i = 1; i <= arry_bingzheng.length; i++) {
			//得到病症对应的当前行的所有td里的所得病症
			$('#add_bingshi_kuang .bottom table tr:eq('+i+') td').each(function(index, el) {
				var index_td=$(this).index();

				if(index_td!=0){//判断td是否有span(即不是病症)
					var class_check=$(this).children('span').attr("class");
					if(class_check=="cur"){
						str_Info+=arry[index_td-1]+"，";//得到arry里的关系
					}
				}

				//一行循环完了
				if (index_td==4) {
					if(str_Info!=""){
						//对应病症
						if(str_Info.indexOf('|')>=0){
							arry_str_Info=str_Info.split('|');
							//高血压病（父亲，母亲）|母亲，脑卒中（高血压病（父亲，母亲）
							if(arry_str_Info[length+1]!=""){
								str_Info="";
								var name_bing="，"+$('#add_bingshi_kuang .bottom table tr:eq('+i+') td').eq(0).html()+"（";
								for (var k = 0; k < arry_str_Info.length-1; k++) {
										if (k==arry_str_Info.length-2) {
											var last_value=arry_str_Info[arry_str_Info.length-1];
											last_value=last_value.substring(0,last_value.length-1);
											arry_str_Info[arry_str_Info.length-2]+=name_bing+last_value+"），";
											str_Info+=arry_str_Info[arry_str_Info.length-2];
											str_Info=str_Info.substring(0,str_Info.length-1)+"|";
										} 
										else{
											str_Info+=arry_str_Info[k];
										}
									
								};
							}
						}
						
						else{
							var name_bing=$('#add_bingshi_kuang .bottom table tr:eq('+i+') td').eq(0).html()+"（";
							str_Info=name_bing+str_Info;
							str_Info=str_Info.substring(0,str_Info.length-1)+"）|";
						}
					}
				}
				$("#show_bingshi span").text(str_Info.substring(0,str_Info.length-1));

			});
		};
		str_info=str_Info.substring(0,str_Info.length-1);
	});

	$(".close").click(function(event) {
		$(".heian").css("display","none");
		$(".tankuang").css("display","none");
	});

	$(".a_check").click(function(event) {
		var this_class=$(this).attr("class");
		if(this_class.indexOf("check_cur")!=-1){
			$(this).removeClass('check_cur');
		}
		else{
			$(this).addClass('check_cur');
		}
	});


	//备注
	$(".edit_beizhu").click(function(event) {
		var edit=$(this).html();
		if(edit=="编辑"){
			$(".txt_beizhu").css("display","block");
			$(this).text('保存');
		}
		else{
			$(this).text('编辑');
			$(".txt_beizhu").css("display","none");
			var beizhu=$(".txt_beizhu").val();	
			$(this).prev('span').text(beizhu);		
		}		
	});
	//点击任意地方关闭备注框
	$('html,body').click(function(e){
		var edit=$(".edit_beizhu").html();
		if($(e.target).is($(".edit_beizhu"))||$(e.target).is($(".txt_beizhu"))||$(e.target).is($(".beizhu span"))){
			return;
		}
		else if(edit=="保存"){
			$(".edit_beizhu").text('编辑');
			$(".txt_beizhu").css("display","none");
		}
	});
	//限制textarea的字数
	$(".txt_beizhu").keyup(function(){
		var len = $(this).val().length;
		if(len > 20){
	   		$(this).val($(this).val().substring(0,19));
	   }
	})
		

	//动态问卷
	$(".wj_wei .da a").click(function(event) {
		$(this).addClass('cur').siblings().removeClass('cur');
	});
	 
	//健康监测——饮食管理tab切换
	$(".con_detail .ys_tab>li").click(function(event) {
		var value_li=$(this).index();
		var li_parent=$(this).parent().attr("class");
		if(li_parent.indexOf("ys_no_tab")==-1){
			$(this).addClass('cur').siblings().removeClass('cur');
			$(this).parent().next(".ys_detail").children('div').removeClass('cur');
			$(this).parent().next(".ys_detail").children('div').eq(value_li).css("display","block");
			$(this).parent().next(".ys_detail").children('div').eq(value_li).siblings().css("display","none");
		}
	});
	$(".con_detail .ys_no_tab>li").hover(function() {
		$(this).children('ul').stop().slideDown(400);
		$(this).addClass('cur').siblings().removeClass('cur');
	}, function() {
		$(this).children('ul').stop().slideUp(400);
		$(this).removeClass('cur');
	});
	$(".con_detail .ys_no_tab>li ul li").click(function(event) {
		var index_li=$(this).index();
		var index_parent_li=$(this).parent('ul').parent('li').index();
		$(this).parent('ul').parent('li').parent().next().children('div').children('div').removeClass('cur');
		$(this).parent('ul').parent('li').parent().next().children('div').eq(index_parent_li).children('div').eq(index_li).addClass('cur');
	});

	//信息发布：用户列表最后一个去掉margin-right
	$(".ys_detail .ys_user ul li").each(function(index, el) {
		if(($(this).index()+1)%4==0){
			$(this).css("margin-right","0");
		}
	});


	//展开折叠用户菜单（+-号）
	$("ul.ztree>li").each(function(index, el) {
		$(this).find('div span:eq(0)').click(function(event) {
			tree_wrap($(this));
		});
	});
	function tree_wrap(wrap_name){
		var class_name=wrap_name.attr("class");
		if(class_name.indexOf("tree_show")!=-1){
			wrap_name.removeClass('tree_show');
			wrap_name.addClass('tree_hide');
			wrap_name.closest('li').children('.tree_list').css("display","none");
		}
		else{
			wrap_name.removeClass('tree_hide');
			wrap_name.addClass('tree_show');	
			wrap_name.closest('li').children('.tree_list').css("display","block");		
		}	
	}

	//复选框
	$("ul.ztree>li").each(function(index, el) {
		$(this).find("div span:eq(1)").click(function(event) {
			check_tree($(this),1);
		});
	});
	$(".tree_list li span").click(function(event) {
		check_tree($(this),0);

	});
	var people_str1="";
	var people_str2="";
	function check_tree(cur_click,all_check){	
		var count=cur_click.parent('li').siblings().size()+1;//得到改组总共的li数量	
		var class_name=cur_click.attr("class");

		if(class_name.indexOf("tree_nocheck")!=-1){
			cur_click.removeClass('tree_nocheck');
			cur_click.addClass('tree_check');

			if(all_check==1){
				//点击大复选框，先判断大复选框中子项已选中的项，去掉显示的已选中的项
				cur_click.closest('li').find('.tree_list li').each(function(index, el) {
					var child_class=$(this).children('span').attr("class");
					if(child_class.indexOf("tree_check")!=-1){
						//点击全选，先去掉已经勾选上的客户
						var cur_value=$(this).children('a').html();						
						if($(this).parent('.tree_list').closest('ul.ztree').attr("id").indexOf("ztree_msg")!=-1){
							var div_info=$(".js_customer1").html();
							var arry=div_info.split("，");
							//大于等于2项
							if(arry.length>1){
								if(arry[arry.length-1]==cur_value){
									people_str1=div_info.replace(cur_value,"");
								}
								else{
									people_str1=div_info.replace(cur_value+"，","");
								}						
								if(people_str1.substring(people_str1.length-1,people_str1.length)=="，"){
									people_str1=people_str1.substring(0,people_str1.length-1);
								}						
							}
							else{//只有一项
								people_str1=div_info.replace(cur_value,"");
							}
							$(".js_customer1").text(people_str1);
						}
						else{
							var div_info=$(".js_customer2").html();				
							var arry=div_info.split("，");
							//大于等于2项
							if(arry.length>1){
								if(arry[arry.length-1]==cur_value){
									people_str2=div_info.replace(cur_value,"");
								}
								else{
									people_str2=div_info.replace(cur_value+"，","");
								}						
								if($.trim(people_str2.substring(people_str2.length-1,people_str2.length))=="，"){
									people_str2=people_str2.substring(0,people_str2.length-1);
								}	
							}
							else{//只有一项						
								people_str2=div_info.replace(cur_value,"");
							}
							$(".js_customer2").text($.trim(people_str2));
						}						
					}
				});

				cur_click.closest('li').find('.tree_list li span').removeClass('tree_nocheck').addClass('tree_check');

				//先判断属于信息还是资讯
				if(cur_click.closest("ul.ztree").attr("id").indexOf("ztree_msg")!=-1){
					//选中组，添加组里的所有人					
					var people_str1="";
					cur_click.closest('li').find('.tree_list li').each(function(index, el) {
						people_str1+=$(this).children('a').html()+"，";
					});
					var customer1_value=$(".js_customer1").html();
					if(customer1_value==""){
						$(".js_customer1").text(people_str1.substring(0,people_str1.length-1));
					}
					else{
						$(".js_customer1").text(customer1_value+"，"+people_str1.substring(0,people_str1.length-1));
					}
				}
				else{
					//选中组，添加组里的所有人
					var people_str2="";
					cur_click.closest('li').find('.tree_list li').each(function(index, el) {
						people_str2+=$(this).children('a').html()+"，";
					});
					var customer2_value=$(".js_customer2").html();
					if(customer2_value==""){
						$(".js_customer2").text(people_str2.substring(0,people_str2.length-1));
					}
					else{
						$(".js_customer2").text(customer2_value+"，"+people_str2.substring(0,people_str2.length-1));
					}

				}
			}

			//判断所有子项是否是选中状态，是：全选项勾上，否：去掉
			if(all_check==0){
				var k=0;
				cur_click.closest('.tree_list').children('li').each(function(index, el) {
					var class_name_in=$(this).children('span').attr("class");
					if (class_name_in.indexOf("tree_check")!=-1) {
						k++;
					}
				});
				if (count==k) {
					cur_click.closest('.tree_list').parent('li').find("div span:eq(1)").removeClass('tree_nocheck').addClass('tree_check');
				}
				else{
					cur_click.closest('.tree_list').parent('li').find("div span:eq(1)").removeClass('tree_check').addClass('tree_nocheck');
				}

				//接收客户
				if(cur_click.closest('.tree_list').closest('ul.ztree').attr("id").indexOf("ztree_msg")!=-1){
					people_str1=cur_click.next().html()+"，";
					var customer1=$(".js_customer1").html();
					if(customer1==""){
						$(".js_customer1").text(people_str1.substring(0,people_str1.length-1));
					}
					else{
						$(".js_customer1").text(customer1+"，"+people_str1.substring(0,people_str1.length-1));
					}					
				}
				else{
					people_str2=cur_click.next().html()+"，";
					var customer2=$(".js_customer2").html();
					if(customer2==""){
						$(".js_customer2").text(people_str2.substring(0,people_str2.length-1));
					}
					else{
						$(".js_customer2").text(customer2+"，"+people_str2.substring(0,people_str2.length-1));
					}
					
				}	
				
			}
		}
		else{
			cur_click.removeClass('tree_check');
			cur_click.addClass('tree_nocheck');

			if(all_check==1){
				cur_click.closest('li').find('.tree_list li span').removeClass('tree_check').addClass('tree_nocheck');

				//去掉组选项
				//先判断属于信息还是资讯
				if(cur_click.closest("ul.ztree").attr("id").indexOf("ztree_msg")!=-1){
					//选中组，添加组里的所有人
					cur_click.parent('div').next('.tree_list').children('li').each(function(index, el) {
						var cur_value=$(this).children('a').html();
						var div_info=$(".js_customer1").html();
						var arry=div_info.split("，");

						//大于等于2项
						if(arry.length>1){
							if(arry[arry.length-1]==cur_value){
								people_str1=div_info.replace(cur_value,"");
							}
							else{
								people_str1=div_info.replace(cur_value+"，","");
							}						
							if(people_str1.substring(people_str1.length-1,people_str1.length)=="，"){
								people_str1=people_str1.substring(0,people_str1.length-1);
							}						
						}
						else{//只有一项
							people_str1=div_info.replace(cur_value,"");
						}
						$(".js_customer1").text(people_str1);
					});
				}
				else{
					//选中组，添加组里的所有人
					cur_click.parent('div').next('.tree_list').children('li').each(function(index, el) {
						var cur_value=$(this).children('a').html();
						var div_info=$(".js_customer2").html();
						var arry=div_info.split("，");

						//大于等于2项
						if(arry.length>1){
							if(arry[arry.length-1]==cur_value){
								people_str2=div_info.replace(cur_value,"");
							}
							else{
								people_str2=div_info.replace(cur_value+"，","");
							}						
							if(people_str2.substring(people_str2.length-1,people_str2.length)=="，"){
								people_str2=people_str2.substring(0,people_str2.length-1);
							}						
						}
						else{//只有一项
							people_str2=div_info.replace(cur_value,"");
						}
						$(".js_customer2").text(people_str2);
					});
				}


			}

			//判断所有子项是否是全部选中状态，否：去掉
			if(all_check==0){
				cur_click.closest('.tree_list').parent('li').children('div').children('span:eq(1)').removeClass('tree_check').addClass('tree_nocheck');

				//去掉接收客户
				var cur_value=cur_click.next().html();
				if(cur_click.closest('.tree_list').closest('ul.ztree').attr("id").indexOf("ztree_msg")!=-1){
					var div_info=$(".js_customer1").html();
					var arry=div_info.split("，");
					//大于等于2项
					if(arry.length>1){
						if(arry[arry.length-1]==cur_value){
							people_str1=div_info.replace(cur_value,"");
						}
						else{
							people_str1=div_info.replace(cur_value+"，","");
						}						
						if(people_str1.substring(people_str1.length-1,people_str1.length)=="，"){
							people_str1=people_str1.substring(0,people_str1.length-1);
						}						
					}
					else{//只有一项
						people_str1=div_info.replace(cur_value,"");
					}
					$(".js_customer1").text(people_str1);
				}
				else{
					var div_info=$(".js_customer2").html();				
					var arry=div_info.split("，");
					//大于等于2项
					if(arry.length>1){
						if(arry[arry.length-1]==cur_value){
							people_str2=div_info.replace(cur_value,"");
						}
						else{
							people_str2=div_info.replace(cur_value+"，","");
						}						
						if($.trim(people_str2.substring(people_str2.length-1,people_str2.length))=="，"){
							people_str2=people_str2.substring(0,people_str2.length-1);
						}	
					}
					else{//只有一项						
						people_str2=div_info.replace(cur_value,"");
					}
					$(".js_customer2").text($.trim(people_str2));
				}
			}
		}	
	}

	

	$(".select_r option").click(function(event) {
		var size=$(this).siblings();
		var selectValue=$(this).html();
		if (typeof(selectValue) == 'string') {
			$(".select_l").append('<option value='+$(this).val()+'>' + selectValue + '</option>');
		}
		$(this).remove();
	});
	$(".select_l option").click(function(event) {
		var size=$(this).siblings()+1;
		var selectValue=$(this).html();
		if (typeof(selectValue) == 'string') {
			$(".select_r").append('<option value='+$(this).val()+'>' + selectValue + '</option>');
		}
		$(this).remove();
	});
	
	$(".fangshi_info>li span").click(function(event) {
		if ($(this).next().next().length!=0) {
			var aa=$(this).next().next().attr("class");
			if(aa!=undefined){
				if(aa.indexOf("cur")!=-1){
					$(this).next().next().stop().slideUp(400);
					$(this).next().css("background-image","url(/static/images/doctor/menu_up.png)");
					$(this).next().next().removeClass('cur');
				}		
				else{
					$(this).next().next().stop().slideDown(400);
					$(this).next().css("background-image","url(/static/images/doctor/menu_down.png)");			
					$(this).next().next().addClass('cur');
				}
			}		
			else{
				$(this).next().next().stop().slideDown(400);
				$(this).next().css("background-image","url(/static/images/doctor/menu_down.png)");			
				$(this).next().next().addClass('cur');
			}
		}
	});

});
