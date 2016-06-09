<%@Language="vbscript" Codepage="65001"%> 

<!--#include file="Inc/Dbconn.asp" -->

<%
set rs_gdtp_top=server.CreateObject("adodb.recordset")
	rs_gdtp_top.open "select top 1 ID,Title,Indate,author,Server_filepath,FParentID,source,NewsId from sq_jinrongcity.[Img_tab] where NewsId=1 and FParentID=0 order by Indate desc",conn,1,3

set rs_gdtp=server.CreateObject("adodb.recordset")
	rs_gdtp.open "select top 3 ID,Title,Indate,author,Server_filepath,FParentID,source,NewsId from sq_jinrongcity.[Img_tab] where NewsId=1 and FParentID=0 order by Indate desc",conn,1,3
	
set rs_gd=server.CreateObject("adodb.recordset")
	rs_gd.open "select top 3 ID,Title,Indate,author,Server_filepath,FParentID,source,NewsId from sq_jinrongcity.[Img_tab] where NewsId=2 and FParentID=0 order by Indate desc",conn,1,3		
	
set rs_news=server.CreateObject("adodb.recordset")
	rs_news.open "select top 5 ID,Title,Indate,author,Server_filepath,FParentID,source,NewsId from sq_jinrongcity.[Img_tab] where NewsId=3 and FParentID=0 order by Indate desc",conn,1,3		
	
set rs_hot=server.CreateObject("adodb.recordset")
	rs_hot.open "select top 5 ID,Title,Indate,author,Server_filepath,FParentID,source,NewsId from sq_jinrongcity.[Img_tab] where NewsId=4 and FParentID=0 order by Indate desc",conn,1,3		
	
set rs_hotc=server.CreateObject("adodb.recordset")
	rs_hotc.open "select * from sq_jinrongcity.[LmTab] where 1=1 ",conn,1,3		
	
set rs_lc=server.CreateObject("adodb.recordset")
	rs_lc.open "select top 5 * from sq_jinrongcity.[Lc_tab] where FParentID=0 order by Indate desc",conn,1,3		
	
set rs_bx=server.CreateObject("adodb.recordset")
	rs_bx.open "select top 5 * from sq_jinrongcity.[Bx_tab] where FParentID=0 order by Indate desc",conn,1,3	
	
set rs_qy=server.CreateObject("adodb.recordset")
	rs_qy.open "select top 5 * from sq_jinrongcity.[Qy_tab] where flag=0 order by Indate desc",conn,1,3	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎访问金融城</title>
    <meta name="keywords" content="www.jinrongcity.com">
	<meta name="description" content="www.jinrongcity.com">
	<meta name="viewport" content="width=1200, initial-scale=1"/>
    <meta property="qc:admins" content="24342314566205636" />
    
		<link type="text/css" rel="stylesheet" href="css/listStyle.css" />
		<link type="text/css" rel="stylesheet" href="css/Login_Page.css" />
        <link href="css/page.css" rel="stylesheet" type="text/css">
        
		<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
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
				<a href="index.asp" target="_parent"><img src="images/LOGO2.jpg" alt="" /></a>
				<!--<div class="search_option_box">
					<div class="option_bg" id="show_option">文章</div>
					<select  name="options" id="options">
						<option value="title" selected="selected">文章</option>
						<option value="author" >理财</option>
					</select>
				</div>
				<div class="header_search">
					<form action="#">
						<input  type="text" name="k" class="search_text"/>
						<input type="hidden" name="type" id="so_type" value="title" />
						<input  type="submit" class="search_btn" value="" />
					</form>
				</div>-->
					<div class="login_box">
					<a href="mereg.asp" target="_parent">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<%if session("memeber_Id")="" then%><a href="melogin.asp" target="_parent">登录</a>
                    <%else%>
                    <font color="#FFFFFF"><a href="meregister.asp" target="_parent"><%=session("txtUsername")%></a></font>
                    <%end if%>
				</div>
				</div>
		</div>
		
		<div class="box2_bg">
			<div class="box2">
			<div class="nav">
				<ul>
					<li class=""><a href="index.asp" target="_parent">首页</a></li>
					<li class=""><a href="newslist.asp?pid=2" target="_parent">观点</a></li><li class=""><a href="newslist.asp?pid=3" target="_parent">资讯</a></li><li class=""><a href="productlc.asp" target="_parent">理财</a></li><li class=""><a href="productbx.asp">保险</a></li></ul>
				<a href="jx.asp" class="contribute_btn" target="_parent"><span>合作/咨询</span></a>
			</div>
			</div >
		</div>
		 
	</div>
	<!-- new 顶部结束 -->
<!-- 内容开始 -->
<div class="main">
	<!-- 内容左侧开始 -->
	<div class="main_left">
		
		<!-- new轮播图2开始 -->
		<div class="new2_box">
			<div class="strage">
				<div id="left_btn"></div>
				<div id="right_btn"></div>
				<div class="images_box"></div>
			</div>
			<div class="info_box">
		    <div class="toggle_clear" style=""></div>
				<div class=info_contents>
					<a href="newsdetail.asp?id=<%=rs_gdtp_top("id")%>" target="_blank">
						<!-- 这里是刷入部分 开始 -->
						<h2><%=rs_gdtp_top("title")%></h2>
						<div class="the_news_info">
							<span class="writer"><%=rs_gdtp_top("author")%></span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="date"><%=rs_gdtp_top("indate")%></span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="views"></span>
							<span class="Review"><div class="Review2"></div></span>
						</div> 
						<p class="h3"><%=rs_gdtp_top("source")%></p>
						<!-- 这里是刷入部分 结束 -->
					</a>
				</div>
		  </div>
			<ul id="new2_box_ul" style="display:none;">
            <%
					do while not rs_gdtp.eof
				%>
				<li>
					<a href="newsdetail.asp?id=<%=rs_gdtp("id")%>" target="_blank"></a>
					<img src="<%=rs_gdtp("Server_filepath")%>">
					<div class="info_box">
						<h2><%=rs_gdtp("title")%></h2>
						<div class="the_news_info">
							<span class="writer"><%=rs_gdtp("author")%></span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="date"><%=rs_gdtp("indate")%></span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="views"></span>
							<span class="Review"><div class="Review2"></div></span>
						</div>
						<p class="h3"><%=rs_gdtp("source")%></p>
					</div>
				</li>
                <%
					rs_gdtp.movenext
					loop				
				%>
          </ul>
		</div>
		
		<!-- 内容A开始 -->
		<div class="contentA">
			<div class="content_left">
				<ul>
                <%
					do while not rs_gd.eof
				%>
					<li>
						<a href="newsdetail.asp?id=<%=rs_gd("id")%>" target="_blank">
						<div class="mark2"></div>
						<img src="<%=rs_gd("Server_filepath")%>" alt=""  />
						<div class="wrap"><h2><%=rs_gd("title")%></h2></div>
						<div class="h3"><%=rs_gd("source")%></div>
						<div class="writer">
							<span style="color:#747474; font-size:14px;"><%=rs_gd("author")%></span>
							<span style="color:#ccc; font-size:12px; font-weight:bold;">·</span><%=rs_gd("indate")%></span>
						</div>
						<div class="review_num"></div>
						</a>
					</li>
                    <%
					rs_gd.movenext
					loop				
				%>
                    
                    </ul>
		  </div>
			<div class="content_right">
				<!-- 内容右侧开始1 -->
				<div class="content_right_1">
					<div id="down"><span class="icon" style="cursor: default;"></span></div>
					<div id="scroll_list" class="scroll_list">
					<ul>
                    <%
					do while not rs_news.eof
				%>
						<li>
						<a href="newsdetail.asp?id=<%=rs_news("id")%>" target="_blank">
							<h2><%=rs_news("title")%></h2>
							<div class="h3"><%=rs_news("source")%></div>
							<div class="writer"><span style="color:#f8b72d;">资讯&nbsp;&nbsp;&nbsp;</span><%=rs_news("indate")%></div>
						</a>
						</li>
                   <%
					rs_news.movenext
					loop				
				%>     
                        
                        </ul>
					</div>
					<div id="up"><span class="icon"></span></div>
				</div>
				
			</div>
			<div style="clear:both;"></div>
		</div>
		<!-- 内容A结束 -->
		<!-- 内容B开始 -->
		<div class="contentB">
			<ul class="list_box">
            
            <%
					do while not rs_hot.eof
				%>
				<li>
					<a href="newsdetail.asp?id=<%=rs_hot("id")%>" target="_blank">
						<div class="list_box_left">
							<img src="<%=rs_hot("Server_filepath")%>" alt="" />
							<div class="mark1"></div>
						</div>
						<div class="list_box_right">
							<h2><%=rs_hot("title")%></h2>
							<p class="h3"><%=rs_hot("source")%></p>
                        <div class="list_box_right">
				    <div class="writer">
				      <span style="color:#747474;"><%=rs_hot("author")%></span>
				      <%=rs_hot("indate")%>
				      </div>
			    </div>
						</div>
				</a></li>
				  
			    <div style="clear:both;"></div>	
             <%
					rs_hot.movenext
					loop				
				%>    
            </ul>
		</div>

	<div style="clear:both;"></div>
	</div>
	<!-- 内容左侧结束 -->
	<div class="main_right">
	<div class="hot_tags_box">
		<div class="hot_tags_titel">
			<img src="images/hotTags.png" alt="" style="margin:0px 8px -2px 0px;" />
			<span style="font-size:18px; font-weight:bold; color:#494848;">热门词</span>
			<!-- <span style="font-size:14px; color:#b1b1b0; position:absolute; right:23px; top:0px; cursor:pointer;">所有标签 </span> -->
		</div>	
		<ul class="hot_tags_ul">
        <%
					do while not rs_hotc.eof
				%>
						<li><a href="hotclist.asp?id=<%=rs_hotc("LmId")%>" target="_blank"><%=rs_hotc("LmName")%></a></li>
                        
<%
					rs_hotc.movenext
					loop				
				%>
                        	<div id="seeAll" style="clear:both;height:0px"></div>
		</ul>
	</div>
		<!-- search -->
   <div class="search-wraper">
    <div class="search-title"></div>
    <div class="sliderSearch">
    <SELECT style="width:250px" name="txttitle"  class="inputSearch2"> 
        <OPTION value="" selected>－投资时间－</OPTION> 
        <OPTION value="产品期限（不限）">产品期限（不限） </OPTION> 
        <OPTION value="1-3个月">1-3个月</OPTION> 
        <OPTION value="3-6个月">3-6个月</OPTION> 
        <OPTION value="6-12个月">6-12个月</OPTION>
        <OPTION value="1年以上">1年以上</OPTION></SELECT>
     <div style="height:20px"></div>   
     <SELECT style="width:250px" name="txttitle"  class="inputSearch2"> 
        <OPTION value="" selected>－投资金额－</OPTION> 
        <OPTION value="投资金额（不限）">投资金额（不限）</OPTION> 
        <OPTION value="一万以下">一万以下</OPTION> 
        <OPTION value="1-5万">1-5万</OPTION> 
        <OPTION value="5-20万">5-20万</OPTION>
        <OPTION value="20万以上">20万以上</OPTION></SELECT>
      <div style="height:20px"></div>     
     <SELECT style="width:250px" name="txttitle"  class="inputSearch2"> 
        <OPTION value="" selected>－投资收益－</OPTION> 
        <OPTION value="投资收益（不限）">投资收益（不限）</OPTION> 
        <OPTION value="7%以下">7%以下</OPTION> 
        <OPTION value="7%-8.5%">7%-8.5%</OPTION> 
        <OPTION value="8.5%-9%">8.5%-9%</OPTION>
        <OPTION value="9%以上">9%以上</OPTION></SELECT> 
     <div style="height:20px"></div>       
     <SELECT style="width:250px" name="txttitle"  class="inputSearch2"> 
        <OPTION value="" selected>－星级－</OPTION> 
        <OPTION value="星级（不限）">星级（不限）</OPTION> 
        <OPTION value="一星级">一星级</OPTION> 
        <OPTION value="二星级">二星级</OPTION> 
        <OPTION value="三星级">三星级</OPTION>
        <OPTION value="四星级">四星级</OPTION>
        <OPTION value="五星级">五星级</OPTION></SELECT>          
    </div>
  </div>
  
  <div class="search-wraper">
    <div class="search-titlelc"></div>
    <div class="sliderSearch">
    <SELECT style="width:250px" name="txttitle"  class="inputSearch2"> 
        <OPTION value="" selected>－险种－</OPTION> 
        <OPTION value="险种（不限）">险种（不限） </OPTION></SELECT>
     <div style="height:20px"></div>   
     <SELECT style="width:250px" name="txttitle"  class="inputSearch2"> 
        <OPTION value="" selected>－月付金额－</OPTION> 
        <OPTION value="月付金额（不限）">月付金额（不限）</OPTION></SELECT>
      <div style="height:20px"></div>     
     <SELECT style="width:250px" name="txttitle"  class="inputSearch2"> 
        <OPTION value="" selected>－利率/价值－</OPTION> 
        <OPTION value="利率/价值（不限）">利率/价值（不限）</OPTION></SELECT> 
     <div style="height:20px"></div>       
     <SELECT style="width:250px" name="txttitle"  class="inputSearch2"> 
        <OPTION value="" selected>－星级－</OPTION> 
        <OPTION value="星级（不限）">星级（不限）</OPTION> 
        <OPTION value="一星级">一星级</OPTION> 
        <OPTION value="二星级">二星级</OPTION> 
        <OPTION value="三星级">三星级</OPTION>
        <OPTION value="四星级">四星级</OPTION>
        <OPTION value="五星级">五星级</OPTION></SELECT>          
    </div>
  </div>
      <!-- search -->
	<div style="width:100%;margin-bottom:30px;"><a href="#" target="_blank"><img src="images/zhongmei.png" width="330" /></a></div>
    <div style="width:100%;margin-bottom:30px;"><a href="#" target="_blank"><img src="images/zhongmei.png" width="330" /></a></div>    <div style="width:100%;margin-bottom:30px;"><a href="#" target="_blank"><img src="images/zhongmei.png" width="330" /></a></div>
    <div style="width:100%;margin-bottom:30px;"><a href="#" target="_blank"><img src="images/zhongmei.png" width="330" /></a></div>
	<div style="width:100%;"><a href="#" target="_blank"><img src="images/yibiindex.gif" width="330" /></a></div>
	<div style="clear:both;"></div>
</div>
<!-- 内容结束 -->
<div style="clear:both;"></div>
</div>

<div id="index_rand_link" style="display:none;">
	<a id="index_rand_linka" href="#" target="_blank">2ab3c40</a>
</div>

<div style="clear:both; height:30px"></div>
<div class="zong">
    <div class="search_tab">
        <table width="100%" cellspacing="1" cellpadding="3" align="center" class="table_style jq-tab-B">
            <tbody>
                <tr class="brt">
                    <td width="12%">公司名称</td>
                    <td width="11%">产品名称 </td>
                    <td width="11%">起购金额</td>
                    <td width="11%">年利率</td>
                    <td width="11%">期限</td>
                    <td width="11%">进度</td>
                    <td width="11%">去抢标</td>
                    <td width="11%">星级</td>
                    <td width="11%">点评</td>
                </tr>
                <%
					do while not rs_lc.eof
				%>
                    <tr class="btrde" height="60px">
                      <td align="center"><img src="<%=rs_lc("Server_filepath")%>" width="120px" height="50px"/></td>
                      <td class="wodname"><%=rs_lc("title")%></td>
                      <td><%=rs_lc("money")%></td>
                      <td><%=rs_lc("year")%></td>
                      <td><%=rs_lc("big")%></td>
                      <td><%=rs_lc("jindu")%></td>
                      <td><a href="<%=rs_lc("line")%>" target="_blank"><img src="images/qqb.jpg" width="90" height="40" /></a></td>
                      <td><%=rs_lc("xingji")%></td>  
                      <td><a href="productlcde.asp?id=<%response.Write(rs_lc("id"))%>" target="_blank">查看</a></td>
                  </tr>          
                <%
					rs_lc.movenext
					loop				
				%> 
                <tbody>
                    </table>
  </div>            
</div>
<div style="clear:both; height:50px"></div>

<div class="zong">
    <div class="search_tab">
        <table width="100%" cellspacing="1" cellpadding="3" align="center" class="table_style jq-tab-B">
            <tbody>
                <tr class="brt">
                    <td width="12%">公司名称</td>
                    <td width="11%">险种</td>
                    <td width="11%">产品名称</td>
                    <td width="11%">月付金额</td>
                    <td width="11%">利率/价值</td>
                    <td width="11%">期限</td>
                    <td width="11%">去抢标</td>
                    <td width="11%">星级</td>
                    <td width="11%">点评</td>
                </tr>
                <%
					do while not rs_bx.eof
				%>
                    <tr class="btrde" height="60px">
                    <td class="pore clearfix" align="center"><p class="imgbox"><img src="<%=rs_bx("Server_filepath")%>" width="120px" height="50px"/></p>                        
                    <td class="wodname"><%=rs_bx("jindu")%></td>
                    <td><%=rs_bx("title")%></td>
                    <td><%=rs_bx("money")%></td>
                    <td><%=rs_bx("year")%></td>
                    <td>
                        <div class="pie-wraper">
                            <div class="pie-percent"><%=rs_bx("big")%></div>
                        </div></td>
                    <td><a href="<%=rs_bx("line")%>" target="_blank"><img src="images/qqb.jpg" width="90" height="40" /></a></td>
                    <td><%=rs_bx("xingji")%></td>   
                    <td><a href="productbxde.asp?id=<%response.Write(rs_bx("id"))%>" target="_blank">查看</a></td>    
                  </tr>          
        		<%
					rs_bx.movenext
					loop				
				%>   
                <tbody>
                    </table>
  </div>            
</div>

<div style="clear:both; height:50px""></div>
<!--<DIV class=contentC_left>
<DIV class=writer_box_2>
<UL>
  <LI><A href="#" target=_blank><IMG class=writer_box_img alt="" src="images/s_56a580151200a.jpg"></A> 
  <DIV class=writer_box_info>
  <DIV class=name>企业名称</DIV>
  <DIV class=about_writer>主营产品：</DIV></DIV></LI>
  </UL></DIV>
<DIV class=contentC_left_title>
<DIV class=title>赞助企业 <A class=more href="#" target=_blank>更多...</A> </DIV></DIV></DIV>-->
<div class="zongg">
    <div class="search_tab">
        <table width="100%" cellspacing="0" cellpadding="0" align="center">
            <tbody>
            	<%
					do while not rs_qy.eof
				%>
                <tr height="70px">
                    <td width="7%"><a href="<%=rs_qy("line")%>" target="_blank"><img src="<%=rs_qy("Server_filepath")%>" width="70px" height="70px"/></A></td>
                    <td width="30%" valign="top">
                    <table cellpadding="0" cellspacing="0" border="0">
                    	<tr><td style="font-size:15px; color:#939393">企业名称：<%=rs_qy("title")%></td></tr>
                        <tr><td height="5px"></td></tr>
                        <tr><td style="font-size:15px; color:#939393">主营产品：<%=rs_qy("product")%></td></tr>
                    </table>
                    </td>
                    <td width="3%"></td>
                    <td width="60%" valign="top" style="font-size:15px; color:#939393">公司简介：<%=rs_qy("content")%></td>
                </tr>
                <tr><td height="20px" colspan="4"></td></tr>
                <%
					rs_qy.movenext
					loop				
				%>
                
                
                <tr><td height="40px" colspan="4" align="right"><A class=more href="qylist.asp" target="_parent">查阅更多优秀企业</A></td></tr>
                <tbody>
                    </table>
  </div>            
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
					<li><a href="http://beijing.haodai.com" title="" target="_blank">好贷网</a></li><li><a href="http://www.zzt9.com" title="" target="_blank">众众投</a></li><li><a href="http://www.jimubox.com?f=jimu21" title="" target="_blank">积木盒子</a></li><li><a href="http://www.jfz.com" title="" target="_blank">金斧子理财</a></li><li><a href="http://www.rong360.com/beijing/" title="" target="_blank">融360</a></li><li><a href="http://www.qianzhan.com/" title="" target="_blank">前瞻网</a></li><li><a href="http://www.tuandai.com/" title="" target="_blank">团贷网</a></li><li><a href="http://www.niutou.com/" title="" target="_blank">牛投众筹</a></li><li><a href="http://www.zhongtou8.cn/" title="" target="_blank">众投邦</a></li><li><a href="http://www.xinrong.com/" title="" target="_blank">信融财富</a></li><li><a href="http://www.daibang.com/" title="" target="_blank">贷帮网</a></li><li><a href="http://www.PPmoney.com/" title="" target="_blank">PPmoney</a></li><li><a href="http://www.zxd.com/" title="" target="_blank">在线贷</a></li><li><a href="http://www.ebp2p.com" title="" target="_blank">宜保通贷</a></li><li><a href="http://www.ucloud.cn/?utm_source=youlian&amp;utm_campaign=jpm&amp;utm_medium=display" title="" target="_blank">UCloud</a></li><li><a href="http://www.shitou.com/" title="" target="_blank">石投金融</a></li><li><a href="http://www.tzw.com/" title="" target="_blank">投资网</a></li>
				</ul>
			<div style="height:0px; clear:both;"></div>
			</div>
			
		</div>
	
		<!-- 中间标题 开始 -->
		<div class="box_middle">
			<span style="font-size:16px; font-weight:bold; color:#f6b72c;">金融城</span> — 让理财像吃饭一样简单、安全
			<br/>
			<div style="font-size:14px; font-weight:normal;margin-top:10px; text-align:center; color:#aaa; line-height:25px"><a href="SiteAdmin/logarhtin.asp" target="_blank">备案号</a>：沪ICP备16005875号</div>
		</div>
		<!-- 中间标题 结束 -->
		<div class="weixin_box" >
			<div class="right_box">
				<div class="right_box_top">扫码关注</div>
				<img src="images/pc_weixin.png" alt="" />
			</div>
		</div>
	</div>
	</div>
	
<!-- 通栏底部 开始-->
<div class="TheBottom">
		<div class="TheBottom_box">
		<ul>
			<li>&nbsp;&nbsp;<a href="#" target="_blank">关于我们</a>&nbsp;&nbsp;|</li>
			<li>&nbsp;&nbsp;<a href="#" target="_blank">商务合作</a>&nbsp;&nbsp;|</li>
			<li>&nbsp;&nbsp;<a href="#" target="_blank">联系方式</a>&nbsp;&nbsp;|</li>
			<li>&nbsp;&nbsp;<a href="#" target="_blank">免责条款</a>&nbsp;&nbsp;</li>
		</ul>
		<div style="height:0px; clear:both;"></div>
		
		</div>
	</div>
<!-- 2015.7.15 返回顶部 开始-->
	<!-- 添加返回顶部插件 -->
	<script type="text/javascript">
	(function(){
		var n= 0;//当前高度
		var p=100;//预定显示高度
	/*	$("body").append('<div id="pageGotop" style="display:none;width:46px;height:46px;position:fixed;z-index:2500;right:20px;bottom:70px;cursor: pointer;background-image:url(images/goTop.png); background-position:0px 0px;overflow:hidden;"></div>');
		$(window).scroll(function(){
			n = $(this).scrollTop();
			if(n>p){
				$("#pageGotop").fadeIn();
			}else{
				$("#pageGotop").fadeOut();
			}
		});*/
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
<script type="text/javascript">
	new2Projector();//首页轮播
	$(function(){
		$('#options').change(function(){
			var text = $(this).find("option:selected").text();
			var val = $(this).find("option:selected").val();
			$('#show_option').text(text);
			$('#so_type').val(val);
		})
	})

</script>

</html>
