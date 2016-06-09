<%@Language="vbscript" Codepage="65001"%> 

<!--#include file="inc/Dbconn.asp" -->
<!--#include file="inc/page.asp" -->
<%
	function GetParaNum(str)
		if not IsNumeric(trim(Request(str))) then
			response.write "访问错误，找不到网页！"
			response.end
			GetParaNum	=	0
		else
			GetParaNum	=	clng(trim(Request(str)))
		end if
	end function
	ID=GetParaNum("id")
	
	set rs=server.CreateObject("ADODB.recordset")
		if request("butsave")<>"" then 
			sql="select * from [UserPl_tab] where ID="&ID
			rs.open sql,conn,1,3
		if not rs.eof then
			rs("dianpin")=trim(request.form("txtdianpin"))
			rs.update	
		end if
			if rs.state=1 then rs.close
			rs.open sql,conn,1,3			
		else
			sql="select * from [UserPl_tab] where ID="&ID
			if rs.state=1 then rs.close
			rs.open sql,conn,1,3
		end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎访问金融城网站</title>
    <meta name="keywords" content="www.jinrongcity.com">
	<meta name="description" content="www.jinrongcity.com">
	<meta name="viewport" content="width=1200, initial-scale=1"/>
    <meta property="qc:admins" content="24342314566205636" />
	    <!-- 设定根域名 -->
		<link type="text/css" rel="stylesheet" href="css/listStyle.css" />
		<link type="text/css" rel="stylesheet" href="css/Login_Page.css" />
        <link href="css/page.css" rel="stylesheet" type="text/css">
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
	<!--#include file="top.asp" --> 
	<!-- new 顶部结束 -->

<!-- 内容开始 -->
<div class="main">
  <!-- 内容左侧开始 -->
  <div class="main_left2">
    <!-- 内容开始 -->
    <div class="main_left2">
<form action="#" method="post" name="news_form">    
<div class="content3">
    <UL class=list_box style="line-height:20px">
  <li>
  <DIV style="HEIGHT:10px"></DIV>
  <strong style="color:#C60">点评内容：</strong><TEXTAREA id=txtdianpin class=review_box_textarea name=txtdianpin><%response.Write(rs("dianpin"))%></TEXTAREA>
   <DIV style="HEIGHT:10px"></DIV>
  <div align="center"><input name="butsave" type="submit" class="buttomw" value="保存修改" />&nbsp;&nbsp;&nbsp;&nbsp;<input name="Submit" type="button" class="buttomw" value="返回列表" onClick="window.location.href='mesay.asp'" /></div>
  </li></UL>
</div>
</form>
</div>
    <!-- 内容结束 -->
  </div>
  <!-- 内容左侧结束 -->
  <!-- 内容右侧结束 -->
  <div class="main_right">
		<!-- search -->
   <div class="search-wraper" style="padding-top:20px; font-size:15px; font-weight:bold; line-height:30px">
		<a href="meregister.asp" target="_parent">个人信息</a><br>
        <a href="mesc.asp" target="_parent">我的收藏</a><br>
        我的评论<br>
        <a href="memod.asp" target="_parent">修改密码</a><br>
        <a href="mequit.asp" target="_parent">退出登录</a>
    </div></div>
    </div></div>
  <!-- 内容右侧结束 -->
  <!-- 内容结束 -->
  <div style="clear:both;"></div>
</div>
<div style="clear:both;"></div>
<!-- 底部开始 -->

<!-- 底部开始 -->
<!--#include file="bottom.asp" -->
<!-- 底部结束 -->   
    
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
</body>
</html>