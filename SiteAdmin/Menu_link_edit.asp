<!--#include file="../Inc/Dbconn.asp" -->
<!--#include file="../Inc/upload_5xsoft.inc" -->
<!--#include file="../Inc/lib.asp" -->
			
<%
server.ScriptTimeout = 500000


dim upload
set upload = new upload_5xsoft
set rs = server.CreateObject("adodb.recordset")



if upload.form("butsave")<>"" then
	'--保存修改后数据--

	'随机数，作为文件名称
	randomize
	ran_num = int(90000 * rand) + 10000
	
	id = upload.form("id")
	link_sql = "select * from sq_jinrongcity.[jr_link] where id=" & id
	if rs.state = 1 then rs.close
	rs.open link_sql, connstr, 1, 3
	if not rs.eof then
		rs("title") 	= upload.form("title")
		rs("url")	= upload.form("url")
		rs("is_show")	= upload.form("is_show")
		rs("sort")	= upload.form("sort")
		rs("last_time")	= now()
		rs.update
		response.redirect "Menu_link_list.asp"
	end if
else
	'--查询要显示的数据
	id = get_param_num("id")
	link_sql = "select * from sq_jinrongcity.[jr_link] where id=" & id
	if rs.state = 1 then rs.close
	rs.open link_sql, connstr, 1, 3
end if
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="images/list.css" rel="stylesheet" type="text/css">
<meta http-equiv="pragma" content="no-cache">
<base target="_self">
<title>编辑友情链接</title>
<SCRIPT language=JavaScript type=text/JavaScript>
function ClearText()
{
	link_form.reset();	
}
function checkvalue()
{
	//检查标题
	if (document.getElementById("title").value=="") {
		document.getElementById("title").focus();
		alert("请填写标题");
		return false;
	}

	//检查url
	if(document.getElementById("url").value == "")
	{
		document.getElementById("url").focus();
		alert("请填写url");
		return false;
	}


	//检查排序
	if(document.getElementById("sort").value == "")
	{
		document.getElementById("sort").focus();
		alert("请填写排序值");
		return false;
	}
			
document.getElementById("sending").style.visibility = "visible";
document.ad_form.submit();
return true;
}//-->
</SCRIPT>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}

.style3 {color: #999999}
.style1 {color: #FF0000}
.style4 {
	color: #FFFFFF;
	font-weight: bold;}
.STYLE6 {color: #FF0000; font-size: 14px; }
-->
</style>

</head>

<body topmargin="0" marginheight="0">
<form action="#" method="post"  name="link_form" enctype="multipart/form-data">
<div id="sending" style="position:absolute; z-index:600; width: 443px; left: 178px; top: 54px; height: 148px; visibility: hidden;"> 
          <table width=445 height=152 border=0 cellspacing=0 cellpadding=0 bgcolor="#8FA8E9"> 
            <tr> 
              <td bgcolor=#EBEBEB align=center><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="24" background="images/headerbg.gif" bgcolor="#0033CC" class="style19">&nbsp;<span class="style4">系统提示信息</span></td>
                </tr>
                <tr>
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#6699CC">
                      <tr>
                        <td width="100%" height="124" bgcolor="#F0F0F0"><div align="center"><img src="images/sending.gif" width="32" height="32" align="absmiddle"> 正在保存内容，请稍后......</div></td>
                      </tr>
                  </table></td>
                </tr>
              </table></td> 
            </tr> 
          </table> 
  </div>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
	<TBODY>
		<tr>
		    <td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
      				<tr>
        				<td height="26" background="images/headerbg1.gif">&nbsp; <span class="headtext"><img src="images/dec_1.gif" width="11" height="11" align="absmiddle">编辑友情链接</span></td>
      				</tr>
      				<tr>
				        <td height="2" bgcolor="#1061A2"></td>
			        </tr>
		      </table></td>
		  </tr></TBODY></TABLE>
	<TABLE cellSpacing=1 cellPadding="4" width="100%" align="center" border=0>
		<TBODY>
		    
		<TR>
			<TD align="right" width=106 bgColor="#E5EFF7"><font color="#FF0000">*</font> 标题：</TD>
			<TD colspan="3" align="left" bgColor="#F7F7F7"><input type="text" id="title" name="title" size="45" class="a2" value="<%=rs("title")%>" /></TD>
		</TR>
		<TR>
			<TD align="right" width=106 bgColor="#E5EFF7"><font color="#FF0000">*</font> 眜rl：</TD>
			<TD colspan="3" align="left" bgColor="#F7F7F7">
				<input type="text" id="url" name="url" size="45" class="a2" value="<%=rs("url")%>" />
			</TD>
		</TR>
		<TR>
			<TD align="right"  width=106 bgColor="#E5EFF7"><font color="#FF0000">*</font> 是否显示：</TD>
			<TD colspan="3" align="left" bgColor="#F7F7F7">
			<input type="checkbox" name="is_show" value=1 <% if rs("is_show") = 1 then %>checked="checked"<% end if %> />是
			<input type="checkbox" name="is_show" value=0 <% if rs("is_show") = 0 then %>checked="checked"<% end if %> />否
			</TD>
		</TR>		

		<tr>
			<td align="right" width=106 gbColor="#E5EFF7"><font color="#FF0000">*<font>排序:</td>
			<td colspan="3" align="left" bgcolor="#E7F7F7">
				<input type="text" name="sort" value="<%=rs("sort")%>" />
			</td>
		</tr>

	<tr>
          <td height="46" colspan="4" bgcolor="#E5EFF7"><div align="center">
              <div align="center">
                <div align="right">
                  <div align="center">
                    <input name="butsave" type="submit" class="buttomw" value="修&nbsp;&nbsp;改" onClick="return checkvalue();" />					                    <input type="hidden" name="id" value="<% 
		    			if rs.state=1 then
						if not rs.eof then
							response.Write(rs("id"))
						end if
					end if
					%>" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="Submit" type="button" class="buttomw" value="返回列表" onClick="window.location.href='Menu_link_list.asp'" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
                </div>
              </div>
          </div></td>
        </tr></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
	<TD height="5px"></TD></TR>
  <TR>
	<TD height=3></TD></TR></TBODY></TABLE>	
</form>				
</body>
</html>
