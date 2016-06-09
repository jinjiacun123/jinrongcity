<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>www.jinrongcity.com</title>
    <meta name="keywords" content="www.jinrongcity.com">
	<meta name="description" content="www.jinrongcity.com">
	<meta name="viewport" content="width=1200, initial-scale=1"/>
    <meta property="qc:admins" content="24342314566205636" />
	    <!-- 设定根域名 -->
		<link type="text/css" rel="stylesheet" href="css/listStyle.css" />
		<link type="text/css" rel="stylesheet" href="css/Login_Page.css" />
        <link href="css/page.css" rel="stylesheet" type="text/css" />
		<!--视频部分-->
		
		<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
		<!--视频部分
		
		<script type="text/javascript" src="js/jpmIndex.js"></script>-->
		<script type="text/javascript" src="js/tools.js"></script>
		<script type="text/javascript" src="js/new2_box.js"></script>
		<script type="text/javascript" src="js/Login_Page.js"></script>
		<script type="text/javascript" src="js/popWin2.js"></script>
		<meta name="chinaz-site-verification" content="73E6F0CF-0316-E379-5664-750953378D2F" />
</head>
<body>
	<!-- new 顶部开始 -->
	<div class="header2">
		 <div class="box1_bg">
			<div class="box1">
				<a href="#"><img src="images/pcLogo.png" alt="" /></a>
				<div class="search_option_box">
					<div class="option_bg" id="show_option">文章</div>
					<select  name="options" id="options">
						<option value="title" selected="selected">文章 </option>
						<option value="author" >理财</option>
					</select>
				</div>
				<div class="header_search">
					<form action="#">
						<input  type="text" name="k" class="search_text"/>
						<input type="hidden" name="type" id="so_type" value="title" />
						<input  type="submit" class="search_btn" value="" />
					</form>
				</div>
								<div class="login_box">
					<a href="#" id="register">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" id="Login">登录</a>
				</div>
							</div>
		</div>
		
		<div class="box2_bg">
			<div class="box2">
			<div class="nav">
				<ul>
					<li class=""><a href="#">首页</a></li>
					<li class=""><a href="#" target="_blank">观点</a></li><li class=""><a href="#" target="_blank">资讯</a></li><li class=""><a href="#" target="_blank">理财</a></li><li class=""><a href="#" target="_blank">保险</a></li></ul>
				<a href="#" class="contribute_btn"><span></span></a>
			</div>
			</div >
		</div>
		 
	</div> 
	<!-- new 顶部结束 -->

<!-- 内容开始 -->
	<div class="zong jq-layerBox">
            <div class="search_tab">
                <table width="100%" cellspacing="1" cellpadding="3" align="center" class="table_style jq-tab-B">
                    <tbody>
                        <tr class="brt">
                            <td width="12%">公司名称</td>
                            <td width="19%">产品名称 </td>
                            <td width="15%"><a href="javascript:void(0)" class="duopx" onclick='sort(1, 0, 0, 0)'>金额</a></td>
                            <td width="12%"><a href="javascript:void(0)" class="duopx" onclick='sort(0, 1, 0, 0)'>期限</a></td>
                            <td width="10%"><a href="javascript:void(0)" class="duopx01" onclick='sort(0, 0, 2, 0)'>年利率</a></td>
                            <td width="16%"><a href="javascript:void(0)" class="duopx01" onclick='sort(0, 0, 0, 2)'>进度</a></td>
                            <td width="16%"></td>
                        </tr>
                        <tbody>
                            </table>
                <div>
                                <table width="100%" cellspacing="1" cellpadding="3" align="center" class="table_style jz_hide">
                                    <tbody>
                                        <tr class="btrde">
                                                <td width="140" class="pore clearfix"><p class="imgbox"><img src="/Public/Uploads/platform/429.png"/></p>
                                                    <p class="icon clearfix">
                                                        <span class="icon05">国</span>
                                                        <span class="icon05">联</span>
                                                        <span class="icon05">市</span>
                                                        <span class="icon04">投</span>
                                                    </p>
                                                </td>
                                                <td width="205" class="wodname"> 新手福利标5D2016012802</td>
                                                <td width="150">500,000.00元</td>
                                                <td width="140"> 
                                                                                                            <span>5</span>天                                                                                                        <br /><span class="zity">按月付息，到期还本</span></td>
                                                <td width="98">20.00%</td>
                                                <td width="180">
                                                    <div class="pie-wraper">
                                                        <div class="pie-percent">52.58%</div>
                                                    </div>
                                                    <p><span class="zity"> 剩余额度 : 237,100.00元 </span></p></td>
                                                <td width="180">
                                                    <a onclick='jump(this, "429", "大麦理财");' class="btn" href="javascript:void(0);">去抢标</a>
                                                    <a href="https://www.damailicai.com/factoring/1048.html?soure=jpm&cid=cpc-web-1&uid=0"  target="_blank" style="display:none;"><span class="hidden_jump">去抢标</span></a>
                                                </td>
                                            </tr>
                                                    <script>
                                                        $(function () {
                                                            var div_pieCategory = [], dataNum = [];
                                                            var dataA, dataB;
                                                            var i = 8470;
                                                            div_pieCategory[i] = echarts.init(document.getElementById('div_pieCategory_' + i));
                                                            dataA = $('.div_pieCategory_' + i).attr('data-1');
                                                            dataB = $('.div_pieCategory_' + i).attr('data-2');
                                                            dataNum[i] = [
                                                                {value: dataB, name: '剩余额度'},
                                                                {value: dataA, name: '已投金额'}
                                                            ]
                                                            SetTestStatisticsByCategory(div_pieCategory[i], dataNum[i]);
                                                        })
                                                    </script>
                                                    <p><span class="zity"> 剩余额度 : 14,000.00元 </span></p></td>
                                                <td width="180">
                                                    <a onclick='jump(this, "184", "永利宝");' class="btn" href="javascript:void(0);">去抢标</a>
                                                    <a href="http://www.yonglibao.com/p/2395.html?uid=0"  target="_blank" style="display:none;"><span class="hidden_jump">去抢标</span></a>
                                                </td>
                                            </tr>
                                                    <script>
                                                        $(function () {
                                                            var div_pieCategory = [], dataNum = [];
                                                            var dataA, dataB;
                                                            var i = 523;
                                                            div_pieCategory[i] = echarts.init(document.getElementById('div_pieCategory_' + i));
                                                            dataA = $('.div_pieCategory_' + i).attr('data-1');
                                                            dataB = $('.div_pieCategory_' + i).attr('data-2');
                                                            dataNum[i] = [
                                                                {value: dataB, name: '剩余额度'},
                                                                {value: dataA, name: '已投金额'}
                                                            ]
                                                            SetTestStatisticsByCategory(div_pieCategory[i], dataNum[i]);
                                                        })
                                                    </script>
                                                    <p><span class="zity"> 剩余额度 : 50,000.00元 </span></p></td>

                                            </tr>
                                            <tr class="ajaxLoading">
                                            <td colspan="7">
                                                <span class="nuvbk">滑动加载更多</span></td></tr> 
                                    </tbody>
                                </table>
                            </div>
             </div>
      </div>
<!-- 内容结束 -->

<div id="index_rand_link" style="display:none;">
	<a id="index_rand_linka" href="#" target="_blank">2ab3c40</a>
</div>
	
<div style="clear:both;"></div>
<!-- 底部开始 -->

<div class="footer_box">	
		<!-- 热门标签开始 -->
	<div class="footer_box_main">
		<div class="footer_otherLinks">
			<div class="footer_otherLinks_top">友情链接</div>
			<div class="footer_otherLinks_main">
				<ul>
									<li><a href="http://beijing.haodai.com" title="" target="_blank">好贷网</a></li>	
				</ul>
			<div style="height:0px; clear:both;"></div>
			</div>
			
		</div>
		<!-- 热门标签结束 -->
	
		<!-- 中间标题 开始 -->
		<div class="box_middle" >
			<span style="font-size:16px; font-weight:bold; color:#f6b72c; "></span> www.jinrongcity.com
			<br/>
			<div style="font-size:14px; font-weight:normal;margin-top:10px; text-align:left; color:#aaa; line-height:25px; padding-left:18px;">备案号</div>
		</div>
		<!-- 中间标题 结束 -->
		
		<div class="weixin_box" >
			<div class="footer_weixin_box_top">联系我们</div>
			<div class="left_box">
			  www.jinrongcity.co<br><br>
				<div class="info">公司地址：<br><br>
			    联系电话：</div>
			</div>
			<div class="right_box">
				<div class="right_box_top">扫码关注</div>
				<img src="http://static.jpm.cn/images/pc_weixin.png" alt="" />
			</div>
			<!-- <div class="weixin_box_main" >
				<img src="http://static.jpm.cn/images/pc_weixin.png" alt="" width="130" height="130"/>
				<div class="Contents">扫码关注公众微信号<br/><span style="font-style:italic;">"&nbsp;</span><span style="color:#fdb626">cooljpm</span><span style="font-style:italic;">"&nbsp;</span></div>
				
			</div> -->
		</div>
	</div>
	</div>
	
	<!-- 通栏底部 开始-->
	<div class="TheBottom">
		<div class="TheBottom_box">
		<ul>
			<li>&nbsp;&nbsp;<a href="#" target="_blank">关于我们</a>&nbsp;&nbsp;|</li>
			<li>&nbsp;&nbsp;<a href="#" target="_blank">内容合作</a>&nbsp;&nbsp;|</li>
			<li>&nbsp;&nbsp;<a href="#" target="_blank">版权声明</a>&nbsp;&nbsp;|</li>
			<li>&nbsp;&nbsp;<a href="#" target="_blank">联系方式</a>&nbsp;&nbsp;|</li>
			<li>&nbsp;&nbsp;<a href="#" target="_blank">免责条款</a>&nbsp;&nbsp;|</li>
			<li>&nbsp;&nbsp;<a href="#" target="_blank">隐私政策</a>&nbsp;&nbsp;</li>
		</ul>
		<div style="height:0px; clear:both;"></div>
		
		</div>
	</div>
<!-- 注册登录页面 弹出层  2015_6_28-->
<input type="hidden" id="jhashco" value="608d12b1f7f1b39e1873bc39971b80c6"  />
<!-- 登录部分 开始 -->
<div id="Login_Page" style="display:none;">
	
	<!-- 登录box开始 -->
	<div class="Login_Box" style="display:block;">
		<form action="">
			<div id="Login_main" >
				<input id="Username" type="text" value="请输入用户名/手机号/邮箱"/>
				<input id="Password" type="text" value="请输入密码"/>
				<div class="Login_checkbox">
					<input id="Rem_password" type="checkbox"  value='1' checked="checked"/><span>记住密码</span>
					<input id="Auto_landing" type="checkbox"   value='1' checked="checked"/><span>自动登录</span>
					<a href="javascript:void(0);" id="Forgot_password">忘记密码？</a>
				</div>
				<div class="Landing_btn_info" style="display:none;">我是错误信息提示位</div>
				<div class="Landing_btn">登&nbsp;&nbsp;&nbsp;&nbsp;录</div>
				<div style="clear:both;"></div>
			</div>
		</form>
		<div class="Login_other" >
			<div class="Login_other_title"><a href="javascript:void(0)" style="text-decoration:underline;color:#4169E1" onclick="$('#register').click();">注册</a> 或其它登录方式</div>
			<a id="qq" href="#" ><div class="icon"></div></a>
			<a id="sina" href="#"><div class="icon"></div></a>
			<a id="weixin" href="#"><div class="icon"></div></a>
		</div>
	</div>
	<!-- 登录box结束 -->
	
	<!-- 忘记密码 开始 -->
	<div class="Login_Forget" style="display:none;">
		<form action="#" name="Forget" method="post">
			<div id="Forget_main" >
				<div class="Forgetr_box">
					<span class="span1">手机号&nbsp;:</span>
					<input id="Mobile_number" class="input1 Mobile_number_Forgetr" type="text" name="mobile"/>
					
					<div style="clear:both;"></div>
				</div>
				<div class="info"></div>
				<!-- 添加图形验证 开始 -->
					<div class="ecuritycode3" ><!-- 图形 -->
						<span class="span1">验证码&nbsp;:</span>
						<div class="ecuritycode3_box">
							<input id="ecuritycode3_code" class="ecuritycode3_input" type="text" />
							<span  href="javascript:void(0);" > <img id="ecuritycode3" src="/login/verify_c"  alt="" /> </span>
						</div>
						<div style="clear:both;"></div>
						<div class="ecuritycode1_info" ></div>
					</div>
					<!-- 添加图形验证 结束 -->
				<div class="Forgetr_box ecuritycode4" style="display:none;">
					<span class="span1">验证码&nbsp;:</span>
					<div class="Security_Code_box">
						<input id="Security_Code" class="input1 Security_Code_Forgetr" type="text" name="mobilecode"/>
						<a class="Security_Code_btn" href="javascript:void(0);" forget='ecuritycode3' id='sendForgetrid'>点击发送验证码</a>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="info ecuritycode4" style="display:none;"></div>
				<div class="Forgetr_box">
					<span class="span1">输入新密码&nbsp;:</span>
					<input id="new_password" class="input1 new_password_Forgetr" type="password" name="password"/>
					<div style="clear:both;"></div>
				</div>
				<div class="info"></div>
				<div class="Forgetr_box">
					<span class="span1">再次输入密码&nbsp;:</span>
					<input id="new_password2" class="input1 new_password2_Forgetr" type="password" name="new_password2"/>
					<div style="clear:both;"></div>
				</div>
				<div class="info"></div>
				
				<div class="Landing_btn_info" style="display:none;">我是错误信息提示位</div>
				<div class="Landing_btn">确&nbsp;&nbsp;&nbsp;&nbsp;定</div>
				<div style="clear:both;"></div>
			</div>
		</form>
			<div class="Login_other" >
				<div class="Choose">
					<span>或者，您可以</span>
					<a href="javascript:void(0);" id="goto_Login">直接登录</a>
					<a href="javascript:void(0);" id="goto_Register">重新注册</a>
				</div>
				<!-- <a id="qq" href="javascript:void(0);" ><div></div></a>
				<a id="sina" href="javascript:void(0);"><div></div></a>
				<a id="weixin" href="javascript:void(0);"><div></div></a> -->
				
			</div>
	</div>
	<!-- 忘记密码 结束 -->
	
	<!-- 注册部分 开始 -->
	<div class="Login_Register" style="display:none;">
		<form action="">
			<div id="Register_main" >
				<div class="Register_box">
					<span class="span1">手机号&nbsp;:</span>
					<input id="Mobile_number" class="input1 Mobile_number_register" type="text" />
					<div style="clear:both;"></div>
				</div>
				<div class="info"></div>
               <!-- 添加图形验证 开始 -->
					<div class="ecuritycode1" ><!-- 图形 -->
						<span class="span1">验证码&nbsp;:</span>
						<div class="ecuritycode1_box">
							<input id="ecuritycode1_code" class="ecuritycode1_input" type="text" />
							<span  href="javascript:void(0);" > <img id="ecuritycode1" src="/login/verify_c"  alt="" /> </span>
						</div>
						<div style="clear:both;"></div>
						<div class="ecuritycode1_info" ></div>
					</div>
					<!-- 添加图形验证 结束 -->
				<div class="Register_box ecuritycode2" style="display:none;">
					<span class="span1"> <span style="color:#f8b62d">手机</span> 验证&nbsp;:</span>
					<div class="Security_Code_box">
						<input id="Security_Code" class="input1 Security_Code_register" type="text" />
						<a class="Security_Code_btn" href="javascript:void(0);" forget='ecuritycode1' id='sendRegisterid'>点击发送验证码</a>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="info ecuritycode2" style="display:none;"></div>
				<div class="Register_box">
					<span class="span1">用户名&nbsp;:</span>
					<input id="new_username" class="input1" type="text" />
					<div style="clear:both;"></div>
				</div>
				<div class="info"></div>
				<div class="Register_box">
					<span class="span1">密码&nbsp;:</span>
					<input id="new_password" class="input1 new_password_register" type="password" />
					<div style="clear:both;"></div>
				</div>
				<div class="info"></div>
				<div class="Register_box">
					<span class="span1">重复密码&nbsp;:</span>
					<input id="new_password2" class="input1 new_password2_register" type="password" />
					<div style="clear:both;"></div>
				</div>
				<div class="info"></div>
				
				<div class="Agreement_box">
					<input id="Agreement" class="input1" type="checkbox" />
					<a href="#" target="_blank">同意作者注册投稿协议</a>
				</div>
				<div class="Landing_btn_info" style="display:none;">我是错误信息提示位</div>
				<div class="Landing_btn">注&nbsp;&nbsp;&nbsp;&nbsp;册</div>
				<div style="clear:both;"></div>
			</div>
		</form>
		<div class="Login_other" >
			<div class="Login_other_title"><a href="javascript:void(0)" style="text-decoration:underline;color:#4169E1" onclick="$('#Login').click();">登录</a> 或其它登录方式</div>
			<a id="qq" href="#" ><div class="icon"></div></a>
			<a id="sina" href="#"><div class="icon"></div></a>
			<a id="weixin" href="#"><div class="icon"></div></a>
		</div>
	</div>
	<!-- 注册部分 结束 -->
	<input type="hidden" value="" id="isuserid" />
	
</div>
<!-- 登录部分 结束 -->
<!-- 2015.7.15 返回顶部 开始-->
	<!-- 添加返回顶部插件 -->
	<script type="text/javascript">
	(function(){
		var n= 0;//当前高度
		var p=100;//预定显示高度
		$("body").append('<div id="pageGotop" style="display:none;width:46px;height:46px;position:fixed;z-index:2500;right:20px;bottom:70px;cursor: pointer;background-image:url(images/goTop.png); background-position:0px 0px;overflow:hidden;"></div>');
		$(window).scroll(function(){
			n = $(this).scrollTop();
			if(n>p){
				$("#pageGotop").fadeIn();
			}else{
				$("#pageGotop").fadeOut();
			}
		});
		$("#pageGotop").mouseover(function(){
			$(this).css("background-position","0px -47px");
		}).mouseleave(function(){
			$(this).css("background-position","0px 0px");
		});
		$("body").on("click","#pageGotop",function(){
			$(window).scrollTop(0);
		});
	})();
	</script>
	<!-- 2015.7.15 返回顶部 结束-->
<!-- search 弹出层开始 2015_6_17-->
<div id="search_popWin" style="display:none;">
	<iframe  align="center"  id="the_pop_Win" name="the_pop_Win"  frameborder="0" scrolling="no" src="" style="width:1180px; height:750px; overflow:hidden;"></iframe> 
</div> 
<!-- 其它iframe 弹出层开始 2015_6_25-->
<div id="search_popWin2" style="display:none;">
	<iframe  align="center"  id="the_pop_Win2" name="the_pop_Win2"  frameborder="0" scrolling="yes" src="" style="width:1180px; height:750px; overflow:hidden;"></iframe> 
</div>

<!-- search 弹出层结束 -->
</body>

<script type="text/javascript">
    LoginPageActive();//注册登录遮盖层
	new2Projector();//首页轮播
	//理财搜索加载成功显示 2015.6.30
	// $("#win").load(function(){
	// 	$(this).ready(function(){
	// 		$(this).css("display","block");
	// 	});
	// });
	
	// //贷出去加载成功显示 2015.6.30
	// $("#win2").load(function(){
	// 	$(this).ready(function(){
	// 		$("#win2Box").css("display","block");
	// 	});
	// });
	$(function(){
		$('#options').change(function(){
			var text = $(this).find("option:selected").text();
			var val = $(this).find("option:selected").val();
			$('#show_option').text(text);
			$('#so_type').val(val);
		})
	})

</script>
<span style="display:none;">
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fed8052d039e8d069039547cf38bc2f02' type='text/javascript'%3E%3C/script%3E"));
</script>
</span>
<script>
//(function(){
//    var bp = document.createElement('script');
//    bp.src = '//push.zhanzhang.baidu.com/push.js';
//    var s = document.getElementsByTagName("script")[0];
//    s.parentNode.insertBefore(bp, s);
//})();
</script>
</html>