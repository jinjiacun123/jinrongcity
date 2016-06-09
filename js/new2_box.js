/*
*首页的轮播控件 2015.7.25
*放在页面
*
*/
function new2Projector(){
	var imgWide = 788;//图片舞台宽度
	var new2_li =  $(".new2_box #new2_box_ul li");
	var nums = $(".new2_box #new2_box_ul li").length;
	var $images_box = $(".images_box");
	var maxWide = imgWide*nums;//最大宽度
	var j=0;//j为当前播放序号
	var textTemp;
	var img=[];
	var infos=[];
	var links=[];
	//定时器
	var new2Time;
	//读入数据
	for(i=0;i<nums;i++){
		img[i]= $(new2_li.eq(i)).find("img").attr("src");
		infos[i]= $(new2_li.eq(i)).find(".info_box").html();
		links[i] = $(new2_li.eq(i)).find("a").attr("href");
		textTemp = '<a class="images_box_a" href="'+links[i]+'" style="left:'+i*imgWide+'px" target="_blank"><img src="'+img[i]+'" alt="" /></a>';
		$images_box.append(textTemp);
	}
	 
	$(".new2_box").on("click","#right_btn",function(){
		clearTimeout(new2Time); 
			$(".new2_box .images_box_a").css({"z-index":1000});
			$(".new2_box .images_box_a").eq(j).css("z-index",1100);
		if( j == nums-1 ){//最后一张
				j = 0;
			}else{
				j = j+1;
			}
			$(".new2_box .images_box_a").eq(j).css({"left":imgWide,"z-index":1200}).animate({"left" :0},500);
			$(".new2_box .toggle_clear").css("display","block").fadeOut(500);
			$(".new2_box .info_contents a").attr("href",links[j]).html(infos[j]);
		new2Time = setTimeout(timedCount,4000);	
	});
	
	$(".new2_box").on("click","#left_btn",function(){
		clearTimeout(new2Time);
			$(".new2_box .images_box_a").css({"z-index":1000});
			$(".new2_box .images_box_a").eq(j).css("z-index",1100);
		if( j == 0 ){
				j = nums-1;
			}else{
				j = j-1;
			}
			$(".new2_box .images_box_a").eq(j).css({"left":-imgWide,"z-index":1200}).animate({"left" :0},500);
			$(".new2_box .toggle_clear").css("display","block").fadeOut(500);
			$(".new2_box .info_contents a").attr("href",links[j]).html(infos[j]);
		new2Time = setTimeout(timedCount,4000);	
	});
	
	
	
	function timedCount(){
		$(".new2_box #right_btn").click();
	}
	
	new2Time = setTimeout(timedCount,4000);
	
}