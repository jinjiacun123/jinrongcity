<%@Language="vbscript" Codepage="65001"%> 

<!--#include file="inc/Dbconn.asp" -->
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
		ID=GetParaNum("id")	
	end if

set rs=Server.CreateObject("ADODB.Recordset")

	if rs.state=1 then rs.close()
	news_sql=" select a.*,b.* from sq_jinrongcity.[LmTab_Rmc] a left join sq_jinrongcity.[LmTab] b on a.NewsId=b.LmId where FParentID="& ID
	rs.open news_sql,conn,1,3
	
	if rs.eof then
		response.Write("访问错误")
		response.End()
	else
		titleStr=rs("title")
		dateStr=rs("indate")
		contentStr=rs("content")
		sourceStr=rs("source")''''新闻摘要
		AuthorStr=rs("author")
		filenameStr=rs("Server_filename")
		filepathStr=rs("Server_filepath")
		LmNameStr=rs("LmName")
	end if
	
set rs_hotc=server.CreateObject("adodb.recordset")
	rs_hotc.open "select * from sq_jinrongcity.[LmTab] where 1=1 ",conn,1,3		
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
			<!-- 后缀相对于页面，如后期无改动可合并 -->
			<div class="content2">
				<h1><%=titleStr%></h1>
 
				<div class="crumbBox">
					<a href="index.asp">首页</a>
					><a href="hotclist.asp?id=<%=rs_hotc("LmId")%>"><%=LmNameStr%></a>
					>正文
				</div>
 
				<h2>【摘要】<%=sourceStr%></h2>
				<div class="writer">
					<span style="color:#000; font-size:14px; font-weight:bold;">&nbsp;&nbsp;<%=AuthorStr%></span>
					<span style="color:#747474; font-size:12px; font-weight:bold;">&nbsp;·&nbsp;&nbsp;<%=dateStr%></span>
					<!--span style="color:#747474; font-size:12px;">&nbsp;&nbsp;&nbsp;阅读(<span></span>)</span></span-->
					<div class="review_num"></div>
				</div>
				<div class="story_box">
					<div class="story_box_img">
					<img src="<%=filepathStr%>" alt="" />
						<div class="img_from"></div>
						<div style="clear:both;height:0px;"></div></div>
					<p><%=contentStr%><br/></p>
					<div class="statement">
					以上文字仅代表作者个人观点，并不代表金融城立场。
				  </div>
										
									</div>
				<!-- 其它文章开始 -->
								
								<!-- 其它文章结束 -->
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