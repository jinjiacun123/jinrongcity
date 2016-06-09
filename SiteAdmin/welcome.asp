<!--#include file="../Inc/IsPass.asp" -->
<!--#include file="../Inc/Dbconn.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>登陆成功</title>
<link href="css/list.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	background-image: url(images/welbg.jpg);
}
.STYLE1 {color: #000000}
.STYLE2 {font-size: 12px}
.STYLE3 {font-size: 12px; color: #000000; }
.STYLE4 {color: #FF0000}
-->
</style></head>
<%
strsplit=split(Request.Servervariables("HTTP_USER_AGENT"),";")
strsplit(1)=replace(strsplit(1),"MSIE","Internet Explorer")
strsplit(2)=replace(strsplit(2),")","")
strsplit(2)=replace(strsplit(2),"NT 5.1","XP")
strsplit(2)=replace(strsplit(2),"NT 5.0","2000")
strsplit(1)=Trim(strsplit(1))
strsplit(2)=Trim(strsplit(2))

if Request.ServerVariables("HTTP_X_FORWARDED_FOR")<>"" then
remoteaddr=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
else
remoteaddr=Request.ServerVariables("REMOTE_ADDR")
end if

'Dim RsQy
'set RsQy=server.CreateObject("adodb.recordset")
'if session("adminname")<>"" then 
'RsQy.open "select  * from m_Magpeo where mag_peo_id=" & session("mag_peo_id") ,MM_Fdc_STRING
'else
'RsQy.open "select top 1 * from m_Magpeo",MM_Fdc_STRING
'end if

%>
<body>
<br>
<table width="98%" height="92%" align="center">
<tr>
<td align="center" valign="middle">
<fieldset style="padding: 2; width:440; height:190">
      
      <legend class="STYLE3">      <img src="images/welcome.gif" width="20" height="16" align="absmiddle"> 登陆成功</legend>
      <font size="5">
      <legend class="STYLE2"></legend>
      </font>
      <table width="98%" border="0" height="227">
    <tr> 
      <td align="center" valign="top"> 
        <table align="center" border="0" width=361 cellspacing="0" cellpadding="3" class="sft" height="300">
              <tr> 
                <td height="30">* 用户名称：<% =session("UserName")%>
                </td>
              </tr>
              <tr> 
                <td width="30%" height="30"><div align="left" class="STYLE1">* 当前时间：<%=now%></div></td>
              </tr>
              <tr>
                <td height="30"><div align="left">* 登陆时间：<%=session("Addtime")%></div></td>
              </tr>
              <tr> 
                <td width="30%" height="30"><div align="left" class="STYLE1">* 您的IP：<%=remoteaddr%></div></td>
              </tr>
              <tr> 
                <td width="30%" height="30"><div align="left" class="STYLE1">* 浏览器：<%=strsplit(1)%></div></td>
              </tr>
              <tr> 
                <td width="30%" height="30"><div align="left" class="STYLE1">* 您的操作系统：<%=strsplit(2)%></div></td>
              </tr>
              <tr> 
                <td height="30"><div align="left"><span class="STYLE1">* 推荐使用分辩率： 1024X768</span></div></td>
              </tr>
              <tr>
                <td height="30"><div align="left" class="STYLE1">* 现在您可从左列表中选择链接来进行系统操作</div></td>
              </tr>
            </table>
        </td>
    </tr>
</table>
  </fieldset>
      <p>&nbsp;</p>
    </td>
</tr>
</table>
</body>
</html>
