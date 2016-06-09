<!--#include file="../Inc/Dbconn.asp" -->
<%
		set rs_pass=server.CreateObject("ADODB.recordset")
			
		if request("passmod")<>"" then
				pass_sql="select * from sq_jinrongcity.[UserList] where UserName='"& session("UserName") &"' and UserPass='"&request.Form("txtoldpass")&"'"
				if rs_pass.state=1 then rs_pass.close
				rs_pass.open pass_sql,conn,1,3
		
			if rs_pass.eof then
					
					Response.Write("<script language='javascript' for='window' event='onload'>alert('原先密码不正确！');</script>")	
			else
					pass_sql="update sq_jinrongcity.[UserList] set UserPass='"& request.Form("txtnewpass") &"' where UserName='"&session("UserName")&"' "
					if rs_pass.state=1 then rs_pass.close
					rs_pass.open pass_sql,conn,1,3
					Response.Write("<script language='javascript' for='window' event='onload'>alert('密码修改成功！');</script>")					
			end if		
		end if

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/list.css" rel="stylesheet" type="text/css">
<title>用户密码修改</title>
<SCRIPT language=JavaScript type=text/JavaScript>

	function ClearText()
	{
		pass_form.reset();	
	}
	
	function checkvalue()
	{
		if (document.all("txtnewpass").value!=document.all("txtdnewpass").value)
		{
			alert("你两次输入的密码不一致！");
			return false;
		}
		document.pass_form.submit();
		return true;
	}
	
</script>
</head>

<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="26" background="images/headerbg1.gif">&nbsp; <span class="headtext"><img src="images/dec_1.gif" width="11" height="11" align="absmiddle"> 用户密码修改</span></td>
      </tr>
      <tr>
        <td height="2" bgcolor="#1061A2"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><form action="#" method="post" name="pass_form">
      <table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr>
          <td width="16%" bgcolor="#E5EFF7"><div align="right" class="ltext"><span class="dot">*</span> 用户帐号：</div></td>
          <td width="84%" bgcolor="#F7F7F7"><%=session("UserName")%></td>
        </tr>
        <tr>
          <td bgcolor="#E5EFF7"><div align="right" class="ltext"><span class="dot">*</span> 原 密 码：</div></td>
          <td bgcolor="#F7F7F7"><input name="txtoldpass" type="text" class="a2" id="txtoldpass" value="" size="20" maxlength="100"></td>
        </tr>
		<tr>
          <td bgcolor="#E5EFF7"><div align="right" class="ltext"><span class="dot">*</span> 新 密 码：</div></td>
          <td bgcolor="#F7F7F7"><input name="txtnewpass" type="text" class="a2" id="txtnewpass" value="" size="20" maxlength="100"></td>
        </tr>
		<tr>
          <td bgcolor="#E5EFF7"><div align="right" class="ltext"><span class="dot">*</span> 确认密码：</div></td>
          <td bgcolor="#F7F7F7"><input name="txtdnewpass" type="text" class="a2" id="txtdnewpass" value="" size="20" maxlength="100"></td>
        </tr>
        <tr>
          <td height="46" colspan="2" bgcolor="#E5EFF7"><div align="center">
              <div align="right">
                <div align="center">
                 <input name="passmod" type="submit" class="buttomw" value="密码修改" onClick="javascript:return checkvalue();" />
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input name="Submit" type="reset" class="buttomw" value="重新录入" onClick="ClearText();" />
                </div>
              </div>
          </div></td>
        </tr>
      </table></form>
    </td>
  </tr>
</table>
</body>
</html>
