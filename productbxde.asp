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
id=GetParaNum("id")	

	set rs=Server.CreateObject("ADODB.Recordset")
		
		if request.Form("butmod")<>"" then
			sql="select * from UserPl_tab where 1=2 "
			if rs.state=1 then rs.close()
			rs.open sql,conn,1,3
			rs.addnew()
			
			rs("FUserID")=session("memeber_Id")
			rs("FTitle")=""
			rs("FNewID")=id
			rs("FIndate")=now()
			rs("FType")=2
			rs("flag")=1
			rs("dianpin")=request.Form("contentarea")
			rs.update()
			rs.close()
			response.Redirect("productbxde.asp?id="& id )
		end if
	
	sql="select * from sq_jinrongcity.[Bx_tab] where id="& id
	if rs.state=1 then rs.close()
	rs.open sql,conn,1,3	
	if not rs.eof then 
	
		if rs("clicked")="" or isnull(rs("clicked")) then
			rs("clicked")=0
		end if 
		
		rs("clicked")=rs("clicked")+1
		rs.Update()
		
		titleStr=rs("title")
		dateStr=rs("indate")
		contentStr=rs("content")
		filenameStr=rs("Server_filename")
		filepathStr=rs("Server_filepath")
		moneyStr=rs("money")
		yearStr=rs("year")
		bigStr=rs("big")
		jinduStr=rs("jindu")
		clickedStr=rs("clicked")
		xingjiStr=rs("xingji")
	
	else
		response.write "访问错误"
		response.end	
	end if 
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎访问金融城网</title>
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
<div class="content3">
    <UL class=list_box style="line-height:20px">
  <li><%=contentStr%>
  <DIV style="HEIGHT:10px"></DIV>
  <%
  	set rs2=server.CreateObject("ADODB.Recordset")
	if rs2.state=1 then rs2.close
		rs2.open "select top 10 a.dianpin,b.Username from [UserPl_tab] a inner join sq_jinrongcity.[Menber_tab] b on a.FUserID=b.id where a.FNewID="& id,conn,1,3
		alcontent=""
		t=0
		do while not rs2.eof
			if t<>0 then 
				alcontent=alcontent & "<br><br>"& rs2("Username")&"："&rs2("dianpin")
			else
				alcontent=alcontent & rs2("Username") &"："&rs2("dianpin") 
			end if
			t=t+1
			rs2.movenext
		loop
%>
  <strong style="color:#F30">点评内容：</strong><%=alcontent%>
  </li></UL>
</div>
<DIV style="HEIGHT:20px"></DIV>
<DIV class=review_box>
<DIV class=review_title><SPAN>评&nbsp;&nbsp;论</SPAN> </DIV>
<form action="#" method="post" name="form1">
<TEXTAREA id=contentarea class=review_box_textarea name=contentarea></TEXTAREA> 
<INPUT class=review_box_button value=提&nbsp;&nbsp;交 type=submit name="butmod"><input type="hidden" name="answerid" value="<%request("id")%>"></FORM>
<DIV style="CLEAR: both"></DIV></DIV>
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