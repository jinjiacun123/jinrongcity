<%@Language="vbscript" Codepage="65001"%> 

<!--#include file="inc/Dbconn.asp" -->
<%
	if cstr(request.Form("SumbitOk"))="1" then
		dim rs 
		set rs=server.CreateObject("adodb.recordset")
			sql="select * from sq_jinrongcity.[Menber_tab] where 1=2"
			rs.open sql,conn,1,3
			rs.addnew()
			rs("Username")=request.Form("txtUsername")
			rs("Passer")=request.Form("txtPasser")
			'rs("Passerto")=request.Form("txtPasserto")
			rs("indate")=now()
			rs.update
			rs.close
		 set rs=nothing
		 response.redirect "Index.asp"	
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

			var _txtUsername=document.all("txtUsername").value;
			if (_txtUsername=='')
			  { 
			  alert('请填写用户名!');
			  document.all("txtUsername").value='';
				form1.txtUsername.focus();
				return false;
			 }
			 
			 var _txtPasser=document.all("txtPasser").value;
			if (_txtPasser=='')
			  { 
			  alert('请设置密码!');
			  document.all("txtPasser").value='';
				form1.txtPasser.focus();
				return false;
			 }
			 
			    if (form1.txtPasser.value!=form1.txtPasserto.value)
			   {
				 alert("两次填写的用户密码不一致");
				 form1.txtPasser.focus();
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
            <form action="mereg.asp" method="post" name="form1">
                    <table width="778px" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td align="center">
						<TABLE cellSpacing=0 cellPadding=0 width="770" align=center border=0>
                            <TBODY>
                              <TR> 
                                <TD bgColor="#f5f5f5" height=30>
								<FONT style="font-size:15px" color=#000000>
								<strong>注册信息</strong></FONT></TD>
                              </TR>
                              <TR><TD bgColor=#e2e2e2 height=2></TD></TR>
                            </TBODY>
                          </TABLE>
                        <table width="770px" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr><td colspan="2" height="20px"></td></tr>
                            <tr> 
                              <td width="17%" height="40" align="right"> 用户名：</td>
                              <td align="left"><input name="txtUsername" type="text" id="txtUsername" size="50" maxlength="50" style="width:200px;"><font color="#50463d">(使用手机号或邮箱)</font></td>
                            </tr>
                            <tr> 
                              <td height="40" align="right"> 手机验证码：</td>
                              <td align="left"><input name="txtTel" type="text" id="txtTel" size="50" maxlength="50" style="width:200px;"><font color="#50463d">(仅限用户名为手机号)</font></td>
                            </tr>
                            <tr> 
                              <td height="40" align="right"> 邮件验证码：</td>
                              <td align="left"><input name="txtEmail" type="text" id="txtEmail" size="50" maxlength="50" style="width:200px;"><font color="#50463d">(仅限用户名为邮箱)</font></td>
                            </tr>
                            <tr> 
                              <td height="40" align="right">设置密码：</td>
                              <td align="left"><input name="txtPasser" type="password" id="txtPasser" size="50" maxlength="50" style="width:200px;"> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="17%" height="40" align="right"> 再次输入密码：</td>
                              <td align="left"><input name="txtPasserto" type="password" id="txtPasserto" size="50" maxlength="50" style="width:200px;"></td>
                            </tr>
                          </table>
                  </td></tr>
                <tr> 
                  <td align="center" height="60px"><INPUT type="image" src="Images/an5.gif" border=0 onClick="return checkok();"><input type="hidden" name="SumbitOk" value="0" ></td>
                </tr>
            </table>
            </form>
				<div style="clear:both;"></div>
			</div>
			<!-- 内容结束 -->
		</div>
	<!-- 内容左侧结束 -->
	
    <!-- 内容右侧结束 -->
    <!--#include file="right.asp" -->
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