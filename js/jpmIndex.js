document.domain = 'jpm.cn';
//最后修改日期2015_7_15
//document.domain = 'jpm.cn';
var publicTemp = {//传递对象
	//scrollDrag : {}

};

$(function(){
	
	function videoTitle(){
		var $videoUl = $("#video_title ul");
		var $scrollIcon = $(".video_box_right #scrollIcon");//内容滑块
		
		var ulHeight = $("#video_title ul").height();//内容高度
		var ulIndex = $("#video_title ul li").length;//li的个数
		
		var scrollHeight = $(".video_box_right .scroll").height();//滑动条高度
		var HeightTemp = 0;//下一个高度，以小数实现
		
		// $scrollIcon.click(function(){
			// //alert(13);
			// HeightTemp = HeightTemp+0.03;
			// if(HeightTemp > 1){HeightTemp=0};
			// ulSynchronous();
			// scrollIconSynchronous();
			
		// });

		function ulSynchronous(){//内容部分同步高度
			$videoUl.css("top","-"+HeightTemp*ulHeight+"px");
		}
		
		function scrollIconSynchronous(){//滚动块部分同步高度
			$scrollIcon.css("top",HeightTemp*scrollHeight+"px");
		}
		
		//scrollDrag();//拖动部分
		 publicTemp.scrollDrag = function scrollDrag() {//拖动部分
			var scrollTop = $(".video_box_right .scroll").offset();
			scrollTop = scrollTop.top;//边条距顶距离
			//alert(scrollTop);
			var mouseTop;
			// var scrollTop2 = $scrollIcon.offset();
			// scrollTop2 = scrollTop2.top;
			// alert(scrollTop2);
			$scrollIcon.mousedown(function(){
				$(".video_box_right").on("mousemove",function(e){
					
					//阻止选中
					if ( e && e.preventDefault ) 
					//阻止默认浏览器动作(W3C)
					e.preventDefault(); 
					//IE中阻止函数器默认动作的方式 
					else
					window.event.returnValue = false; 
					
					mouseTop = e.pageY - scrollTop;
					if(mouseTop > scrollHeight){
						mouseTop = scrollHeight;
					}
					if(mouseTop < 0){
						mouseTop = 0;
					}
					HeightTemp = mouseTop/scrollHeight;
					 ulSynchronous();
					 scrollIconSynchronous();
					
					
				});
			});
			
			$(".video_box_right").mouseup(function(){
				$(".video_box_right").off("mousemove");
				
			});
			
			$(".video_box_right").mouseleave(function(){
				$(".video_box_right").off("mousemove");
				
			});
			
			timeOfscroll();
			function timeOfscroll(){//滚动定时部分
				HeightTemp = HeightTemp+0.003;
				if(HeightTemp >= 1){HeightTemp=0;}
				ulSynchronous();
				scrollIconSynchronous();
				time2 = setTimeout(timeOfscroll,50);//启动定时滚动
			}
			$(".video_box_right .video_title").mouseover(function(){
				clearTimeout(time2);
			}).mouseleave(function(){
				time2 = setTimeout(timeOfscroll,50);
			});
			
		}
		
		
		
		
	}
	
//scroll_list列表滚动
	scrollListAct();
	function scrollListAct(){
		var next = 50;//每次移动的距离
		var temp2 = 40;//缓冲高度
		var listBoxHeight = $(".content_right #scroll_list").height();//窗口高度
		var listHeight = $(".content_right #scroll_list ul").height();//列表总共高度
			next = listHeight/$(".content_right #scroll_list li").length;
		var listHeightAct = listHeight-listBoxHeight;
		var topTemp;
		$(".content_right #up .icon").click(function(){
			topTemp = $(".content_right #scroll_list ul").css("top");
				topTemp = parseInt(topTemp);
				
				if((topTemp-next)>(-listHeightAct+temp2)){
					//$(".content_right #scroll_list ul").css("top",(topTemp-next));
					$(".content_right #scroll_list ul").stop();
					$(".content_right #scroll_list ul").animate({top:topTemp-next},550,mouseExterior);
				}else{
					$(".content_right #scroll_list ul").stop();
					$(".content_right #scroll_list ul").animate({top:-listHeightAct},550,mouseExterior);
					//$(this).css("cursor","default");
				}
			
		});
		
		$(".content_right #down .icon").click(function(){
			topTemp = $(".content_right #scroll_list ul").css("top");
				topTemp = parseInt(topTemp);
				
				if((topTemp+next)<(-next)){
					
					$(".content_right #scroll_list ul").stop();
					$(".content_right #scroll_list ul").animate({top:topTemp+next},550,mouseExterior);
					
				}else{
					$(".content_right #scroll_list ul").stop();
					$(".content_right #scroll_list ul").animate({top:0},550,mouseExterior);
					//$(this).css("cursor","default");
				}
			
		});
		
		//判断位置改变鼠标样式
		function mouseExterior(){
			// alert(1);
			topTemp = $(".content_right #scroll_list ul").css("top");
			topTemp = parseInt(topTemp);
			//alert(topTemp+"+"+-listHeightAct);
			if(topTemp <= (-listHeightAct)){
				$(".content_right #up .icon").css("cursor","default");
				$(".content_right #down .icon").css("cursor","pointer");
			}else if(( topTemp > -listHeightAct)&&( topTemp < 0 )){
				
				$(".content_right #up .icon").css("cursor","pointer");
				$(".content_right #down .icon").css("cursor","pointer");
			}else if(topTemp >= 0){
				$(".content_right #down .icon").css("cursor","default");
				$(".content_right #up .icon").css("cursor","pointer");
			}
			
		}
		
	}

	//热点标签鼠标移入
	hotWordsAct();
	function hotWordsAct(){
		var defColor,newColor,defSize,newSize;
		defColor = $("#hotWords li a").css("color");
		defSize = $("#hotWords li a").css("fontSize");
		newColor = "#f8b62d";
		newSize = 20;
		var widthTemp;
		$("#hotWords li").mouseover(function(){
			$(this).find("a").stop().css("color",newColor).animate({fontSize:newSize},480);
		}).mouseleave(function(){
			$(this).find("a").stop().css("color",defColor).animate({fontSize:defSize},300);
		});
	}

	//顶部登陆信息切换
	LoggedBoxAct();
	function LoggedBoxAct(){
		$("#Logged_box .user_name").click(function(){
			var $act1 = $(this).find(".user_controls2");
			if($act1.length > 0){//切换到关闭
				$act1.removeClass("user_controls2").addClass("user_controls1");
				$("#Logged_box .user_box").hide(200);
			}else{//切换到显示
				$("#Logged_box .user_controls1").removeClass("user_controls1").addClass("user_controls2");
				$("#Logged_box .user_box").show(200);
			}
		});
		
	}
	

//search专用重新设置弹出内容高度	
	//$("#the_pop_Win").load(function(){
		rePopWin("no");
	//});
	
	$(window).resize(function(){
		rePopWin("no");
	});
	
	function rePopWin(scroll){
		var wh = $(window).height();
		var newWh = wh*0.8;
		var newMt = wh*0.1;
		if(newWh>=748){
			newWh = 748;
			newMt = (wh-newWh)/2;
		}
		
		$("#the_pop_Win").attr("scrolling",scroll).css({"height" : newWh,"margin-top" : newMt});
	}
	
	
});


	
	
	
	
	
	
	
	
	
	
	
	
	