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
	
	if trim(request("id"))<>"" then
			typeid=GetParaNum("id")	
		end if
		
	dim dateby
		dateby=" order by indate desc "
	set rs=Server.CreateObject("ADODB.Recordset")
	
		if rs.state=1 then rs.close()
		
			news_sql=" select a.*,b.* from sq_jinrongcity.[LmTab_Rmc] a left join sq_jinrongcity.[LmTab] b on a.NewsId=b.LmId where FParentID=0 and NewsId="& typeid
		
		news_sql=news_sql & dateby

	Set mypage0=new xdownpage   '创建对象
		mypage0.getconn=conn    '得到数据库连接
		mypage0.pagesize=12     '设置每一页的记录条数据
		mypage0.getsql=news_sql
	set rs=mypage0.getrs() '返回Recordset	
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
    <div class="main_left">
	<div class="contentB1">
			<ul class="list_box">
            
            <%
			for i=1 to mypage0.pagesize 
			if not rs.eof then
		%>
				<li>
					<a href="hotcdetail.asp?id=<%response.Write(rs("id"))%>" target="_blank">
						<div class="list_box_left">
							<img src="<%=rs("Server_filepath")%>" alt="" />
							<div class="mark1"></div>
						</div>
						<div class="list_box_right">
							<h2><%=rs("title")%></h2>
							<p class="h3"><%=rs("source")%></p>
						
							<div class="writer">
								<span style="color:#747474;"><%=rs("author")%></span>
								<span><%=rs("indate")%></span>
								
								<div class="review_num"></div>
							</div>
						
						</div>
					<div style="clear:both;"></div>	
					</a>
				</li>
         <% rs.movenext
			  else
				exit for
			 end if
			   next
		%>       
                </ul>
		</div>
    <div align="center"><br /><%response.write mypage0.page%></div>   
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