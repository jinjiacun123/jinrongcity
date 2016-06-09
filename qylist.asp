<%@Language="vbscript" Codepage="65001"%> 

<!--#include file="inc/Dbconn.asp" -->
<!--#include file="inc/page.asp" -->
<%
	dim dateby
		dateby=" order by indate desc "
	set rs_qy=Server.CreateObject("ADODB.Recordset")
	
		if rs_qy.state=1 then rs_qy.close()
		news_sql=" select * from sq_jinrongcity.[Qy_tab] where 1=1 "
		news_sql=news_sql & dateby

	Set mypage0=new xdownpage   '创建对象
		mypage0.getconn=conn    '得到数据库连接
		mypage0.pagesize=12     '设置每一页的记录条数据
		mypage0.getsql=news_sql
	set rs_qy=mypage0.getrs() '返回Recordset	
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
			<!-- 后缀相对于页面，如后期无改动可合并 -->
			<div class="content2">
				<div class="crumbBox">
					<a href="index.asp">首页</a>
					>
					企业专区
			  </div>
 
				<div class="story_box">
                <table width="100%" cellspacing="0" cellpadding="0" align="center">
            <tbody>
            	<%
					do while not rs_qy.eof
				%>
                <tr height="70px">
                    <td width="10%"><a href="<%=rs_qy("line")%>" target="_blank"><img src="<%=rs_qy("Server_filepath")%>" width="70px" height="70px"/></A></td>
                    <td width="27%" valign="top">
                    <table cellpadding="0" cellspacing="0" border="0">
                    	<tr><td style="font-size:15px; color:#939393">企业名称：<%=rs_qy("title")%></td></tr>
                        <tr><td height="5px"></td></tr>
                        <tr><td style="font-size:15px; color:#939393">主营产品：<%=rs_qy("product")%></td></tr>
                    </table>
                    </td>
                    <td width="3%"></td>
                    <td width="60%" valign="top" style="font-size:15px; color:#939393">公司简介：<%=rs_qy("content")%></td>
                </tr>
                <%
					rs_qy.movenext
					loop				
				%>

                <tbody>
                    </table>
                </div>
    <div align="center"><br /><%response.write mypage0.page%></div>   
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
</body>
</html>