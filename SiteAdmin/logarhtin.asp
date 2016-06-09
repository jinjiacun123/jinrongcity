<!--#include file="../Inc/Dbconn.asp" -->
<%
if request("butok")<>"" then
	set rs_login=server.CreateObject("adodb.recordset")
	rs_login.open "select * from sq_jinrongcity.[UserList] where Username='" &request("user_name")&"'",connstr,1,3
	if rs_login.eof then
	response.Write "<script language=javascript for=window event=onload> alert('没有该管理员!') </script>"
	else 
	if rs_login("UserPass") <> request("user_pass") then
		response.write "<script language=javascript for=window event=onload> alert('输入的密码不正确!') </script>"
	else
		session("userid")=rs_login("UserId")
		session("username")=rs_login("UserName")
		session("Addtime")=now()
		session("QX")= rs_login("Qxflag")
		Response.Redirect "index.asp"	
	end if
	end if
	rs_login.close
	set rs_login=nothing
end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>金融城网站后台管理系统！</title>
<SCRIPT language=JavaScript>
	function checkok(){
		if (document.all("user_name").value=='') {
		alert('请输入您的帐号');
		document.form1.user_name.focus();
		return false;
		}
		if (document.all("user_pass").value=='') {
		alert('请输入账号密码');
		document.form1.user_pass.focus();
		return false;
		}
		
		return true;	
	}
</SCRIPT>

</head>

<body bottommargin="0" topmargin="0" rightmargin="0" leftmargin="0">
<table cellpadding="0" cellspacing="0" align="center" width="823px">
	<tr><td height="80px"></td></tr>
	<tr><td>
		<table cellpadding="0" cellspacing="0" border="0" bgcolor="#D5D3D6" width="823px" height="436px">
			<tr><td height="400px" width="815px" align="center" style="padding-left:3px">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#E7E7E7" height="400px" align="center">
					<tr><td valign="top" align="center" height="301px">
					<img src="images/getImage6.gif" border="0" height="301px" width="801" /></td></tr>
					<tr><td height="99px" align="center" width="801px">
					<form action="#" method="post" name="form1">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
							<TD width="56" vAlign=center><DIV align=center><font style="font-size:13px; font-weight:bold">用户名：</font></DIV></TD>
						    <TD width="159" vAlign=center><DIV align=center><INPUT id=user name=user_name></DIV></TD>
						    <TD width="74"><DIV align=right><font style="font-size:13px; font-weight:bold">密&nbsp;&nbsp;码：</font></DIV></TD>
						    <TD><INPUT id=pass type=password name=user_pass>&nbsp;&nbsp;<INPUT class=button type=submit value="  登 录  " name=butok onClick="return checkok();"></TD></tr>
					  </table>
					  </form>
					</td></tr>
				</table>
			</td></tr> 
		</table>
	</td></tr>
</table>
</body>
</html>
