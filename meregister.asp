<%@Language="vbscript" Codepage="65001"%> 

<!--#include file="inc/Dbconn.asp" -->
<!--#include file="memberinc.asp" -->
<%
		dim rs 
		set rs=server.CreateObject("adodb.recordset")
		
			if cstr(request.Form("SumbitOk"))="1" then
			sql="select * from sq_jinrongcity.[Menber_tab] where [ID]="& session("memeber_Id")
			rs.open sql,conn,1,3
			if not rs.eof then
				rs("Name")=request.Form("txtName")
				rs("Sex")=request.Form("txtSex")
				rs("Years")=request.Form("txtYears")
				rs("City")=request.Form("txtCity")
				
				rs("Tel")=request.Form("txtTel")
				rs("Email")=request.Form("txtEmail")
				
				rs("Tel2")=request.Form("txtTel2")
				rs("Email2")=request.Form("txtEmail2")
				rs("Adder")=request.Form("txtAdder")
				
				rs("Adder2")=request.Form("txtAdder")
				rs("Money")=request.Form("txtMoney")
				rs("Like")=request.Form("txtLike")
				rs("Marry")=request.Form("txtMarry")
	
				rs.update
				rs.close
		   end if
		 set rs=nothing
		 response.redirect "meregister.asp"	
		end if
		
		
		sql="select * from sq_jinrongcity.[Menber_tab] where [ID]="& session("memeber_Id")
			if rs.state=1 then rs.close()
			rs.open sql,conn,1,3
			if not rs.eof then
				txtName=rs("Name")
				txtSex=rs("Sex")
				txtYears=rs("Years")
				txtCity=rs("City")
				
				txtTel=rs("Tel")
				txtEmail=rs("Email")
				
				txtTel2=rs("Tel2")
				txtEmail2=rs("Email2")
				txtAdder=rs("Adder")
				
				txtAdder2=rs("Adder2")
				txtMoney=rs("Money")
				txtLike=rs("Like")
				txtMarry=rs("Marry")
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
            <form action="meregister.asp" method="post" name="form1">
                <table width="778px" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td align="center">
				  
                  <table width="778px" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#3D8ADB">
                      <tr> 
                        <td valign="top" bgcolor="#FFFFFF">
						<TABLE cellSpacing=0 cellPadding=0 width="770" align=center border=0>
                            <TBODY>
                              <TR> 
                                <TD bgColor="#f5f5f5" height=21>
								<FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#000000>
								<strong>基本资料</strong></FONT></TD>
                              </TR>
                              <TR><TD bgColor=#e2e2e2 height=2></TD></TR>
                            </TBODY>
                          </TABLE>
                        <table width="770px" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="17%" height="30" align="right">姓名：</td>
                              <td height="30" align="left"><input name="txtName" type="text" id="txtName" style="width:200px;" value="<%=txtName%>"></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">性别：</td>
                              <td height="30" align="left"><input type="radio" <% if txtSex="1" then %> checked <%end if%>  value="1" name="txtSex">男
									<input type="radio" <% if txtSex="2" then %> checked <%end if%> value=2 name="txtSex">女</td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">年龄：</td>
                              <td height="30" align="left"><input type="text" name="txtYears" id="txtYears" style="width:200px;" value="<%=txtYears%>"></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">城市：</td>
                              <td height="30" align="left"><input type="text" name="txtCity" id="txtCity" style="width:200px;" value="<%=txtCity%>"></td>
                            </tr>
                          </table>
                        <TABLE cellSpacing=0 cellPadding=0 width="770" align=center border=0>
                            <TBODY>
                              <TR> 
                                <TD bgColor=#f5f5f5 height=21>
								<FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#000000>
								<strong>注册信息</strong></FONT></TD>
                              </TR>
                              <TR><TD bgColor=#e2e2e2 height=2></TD></TR>
                            </TBODY>
                          </TABLE>
                        <table width="770px" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="17%" height="30" align="right">手机号：</td>
                              <td height="30" align="left"><input type="text" name="txtTel" id="txtTel" style="width:200px;" value="<%=txtTel%>"></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">注册邮箱：</td>
                              <td height="30" align="left"><input type="text" name="txtEmail" id="txtEmail" style="width:200px;" value="<%=txtEmail%>"></td>
                            </tr>
                          </table>  
                          <TABLE cellSpacing=0 cellPadding=0 width="770px" align=center border=0>
                            <TBODY>
                              <TR> 
                                <TD height=21 bgColor=#f5f5f5>
								<FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#000000><strong>联系方式</strong></FONT></TD>
                              </TR>
                              <TR><TD bgColor=#e2e2e2 height=2></TD></TR>
                            </TBODY>
                          </TABLE>
                          <table width="770px" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="17%" height="30" align="right">手机号：</td>
                              <td height="30" align="left">
							  <input type="text" name="txtTel2" id="txtTel2" style="width:200px;" value="<%=txtTel2%>"></td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right">邮箱：</td>
                              <td height="30" align="left"><input type="text" name="txtEmail2" id="txtEmail2" style="width:200px;" value="<%=txtEmail2%>"></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">地址：</td>
                              <td height="30" align="left"><input type="text" name="txtAdder" id="txtAdder" style="width:200px;" value="<%=txtAdder%>"></td>
                            </tr>
                          </table>
                          <TABLE cellSpacing=0 cellPadding=0 width="770px" align=center border=0>
                            <TBODY>
                              <TR> 
                                <TD height=21 bgColor=#f5f5f5>
								<FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#000000><strong>详细信息</strong></FONT></TD>
                              </TR>
                              <TR><TD bgColor=#e2e2e2 height=2></TD></TR>
                            </TBODY>
                          </TABLE>
                          <table width="770px" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="17%" height="30" align="right">地址：</td>
                              <td height="30" align="left"><input type="text" name="txtAdder2" id="txtAdder2" style="width:200px;" value="<%=txtAdder2%>"></td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right">平均月收入：</td>
                              <td height="30" align="left"><input type="text" name="txtMoney" id="txtMoney" style="width:200px;" value="<%=txtMoney%>"></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">爱好/兴趣：</td>
                              <td height="30" align="left"><input type="text" name="txtLike" id="txtLike" style="width:200px;" value="<%=txtLike%>"></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">婚否：</td>
                              <td height="30" align="left"><input type="radio" <% if txtMarry="1" then %> checked <%end if%> value="1" name="txtMarry">是
									<input type="radio" <% if txtMarry="2" then %> checked <%end if%> value=2 name="txtMarry">否</td>
                            </tr>
                          </table>
                          </td>
                      </tr>
                    </table>
                  
                  </td></tr>
                <tr> 
                  <td align="center" height="50px"><INPUT type="image" src="Images/an6.gif" border=0 onClick="return checkok();"><input type="hidden" name="SumbitOk" value="0" ></td>
                </tr>
            </table>
            </form>
			</div>
			<!-- 内容结束 -->
		</div>
	<!-- 内容左侧结束 -->
	
    <!-- 内容右侧结束 -->
    <div class="main_right">
		<!-- search -->
   <div class="search-wraper" style="padding-top:20px; font-size:15px; font-weight:bold; line-height:30px">
		个人信息<br>
        <a href="mesc.asp" target="_parent">我的收藏</a><br>
        <a href="mesay.asp" target="_parent">我的评论</a><br>
        <a href="memod.asp" target="_parent">修改密码</a><br>
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