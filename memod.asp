<%@Language="vbscript" Codepage="65001"%> 

<!--#include file="inc/Dbconn.asp" -->
<%
set rs_pass=server.CreateObject("adodb.recordset")

if cstr(request.Form("SumbitOk"))="1" then
	pass_sql="select * from sq_jinrongcity.[Menber_tab] where Username='"& session("txtUsername") &"' and Passer='"&request.Form("txtoldpass")&"'"
	if rs_pass.state=1 then rs_pass.close
	rs_pass.open pass_sql,conn,1,3

if rs_pass.eof then
		
		Response.Write("<script language='javascript' for='window' event='onload'>alert('原先密码不正确！');</script>")	
else
		pass_sql="update sq_jinrongcity.[Menber_tab] set Passer='"& request.Form("txtnewpass") &"' where Username='"&session("txtUsername")&"' "
		if rs_pass.state=1 then rs_pass.close
		rs_pass.open pass_sql,conn,1,3
		Response.Write("<script language='javascript' for='window' event='onload'>alert('密码修改成功！');</script>")					
end if		
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
        <script language="javascript">
		function checkok()
		{	
			var form1=document.form1;
			var _txtnewpass=document.all("txtnewpass").value;
			if (_txtnewpass=='')
			  { 
			  alert('请输入新密码!');
			  document.all("txtnewpass").value='';
				form1.txtnewpass.focus();
				return false;
			 }

			if (document.all("txtnewpass").value!=document.all("txtdnewpass").value)
		{
			alert("你两次输入的密码不一致！");
			return false;
		}
			 
			document.all("SumbitOk").value="1";
			return true; 			 			 			 			 
			 	
		}

</script>
        
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
    <div class="content2">
      <form action="memod.asp" method="post" name="form1">
        <table width="778px" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center"><table cellspacing=0 cellpadding=0 width="770" align=center border=0>
              <tbody>
                <tr>
                  <td bgcolor="#f5f5f5" height=30><font style="font-size:15px" color=#000000> <strong>修改密码</strong></font></td>
                </tr>
                <tr>
                  <td bgcolor=#e2e2e2 height=2></td>
                </tr>
              </tbody>
            </table>
              <table width="770px" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="2" height="20px"></td>
                </tr>
                <tr>
                  <td width="17%" height="40" align="right"> 用户名：</td>
                  <td align="left"><%=session("txtUsername")%></td>
                </tr>
                <tr>
                  <td height="40" align="right">原密码：</td>
                  <td align="left"><input name="txtoldpass" type="password" id="txtoldpass" size="50" maxlength="50" style="width:200px;" /></td>
                </tr>
                <tr>
                  <td height="40" align="right">新密码：</td>
                  <td align="left"><INPUT class=boxbb type="password" id="txtnewpass" size=50 name="txtnewpass" maxlength="50" style="width:200px;"></td>
                </tr>
                <tr>
                  <td height="40" align="right">确认密码：</td>
                  <td align="left"><INPUT class=boxbb id=txtdnewpass size=50 name=txtdnewpass type="password" maxlength="50" style="width:200px;"></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td align="center" height="60px"><input id=submit1 type=image src="images/hopegyzx-10.jpg" name=submit1 onclick="return checkok();" />
              <input name="SumbitOk" type="hidden" value="" /></td>
          </tr>
        </table>
      </form>
      <div style="clear:both;"></div>
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
        <a href="mesay.asp" target="_parent">我的评论</a><br>
        修改密码<br>
        <a href="mequit.asp" target="_parent">退出登录</a>
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