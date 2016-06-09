/*
*popWin2获取父级弹出函数2015_6_25
*这个JS用于除了search以外的，iframe弹出层控制，
*
*
*
*/



$(function(){
	//弹出框控制
	var parentJpm2 = {
		popWin : function(url){
			$("#search_popWin2 #the_pop_Win2").attr("src",url);
		},
		toggle : function(){
			$("#search_popWin2").toggle(200);
			$("html").toggleClass("overflowfidden");
			
		}
	};
	
	//调整弹出窗口高度 函数
	function rePopWin(scroll){
		var wh = $(window).height();
		var newWh = wh*0.8;
		var newMt = wh*0.1;
		if(newWh>=748){
			newWh = 748;
			newMt = (wh-newWh)/2;
		}
		
		$("#the_pop_Win2").attr("scrolling",scroll).css({"height" : newWh,"margin-top" : newMt});
	}
	
	//调整弹出窗口高度 函数调用
	$("#the_pop_Win2").load(function(){
		rePopWin("yes");
	});
	
	$(window).resize(function(){
		rePopWin("yes");
	});
	
	//提示语言部分
	var iframeREG = [
		"请输入要查询的公司名称",//贷出去
		""
	];
	
	
	//弹出控制调用部分
	//贷出去 开始
	$(".win2_btn_box input").focus(function(){
		var text = $(this).val(); 
		if(text == iframeREG[0] )$(this).val(""); 
	});
	
	$(".win2_btn_box input").blur(function(){
		var text = $(this).val(); 
		if(text.length == 0){$(this).val(iframeREG[0]);}
	});
	
	
	$(".win2_btn_box .btn").click(function(){
		var text = $(".win2_btn_box input").val();
		if(text != iframeREG[0]){
			parentJpm2.popWin("http://www.daichuqu.com/Comdata/comindex/name/"+text);
			parentJpm2.toggle();
		}else{
			//$(".win2_btn_box input").val(iframeREG[0]);
		}
		
	});
	////贷出去 结束
	
	$("#search_popWin2").click(function(){
		parentJpm2.toggle();
	});

	
 });
