<!--#include file="../Inc/Dbconn.asp" -->
<!--#include file="../Inc/upload_5xsoft.inc" -->
			
<%
server.ScriptTimeout = 500000

function GetParaNum(str)
	if not IsNumeric(trim(request(str))) then
		response.write "访问错误，找不到网页！"
		response.end
		GetParaNum = 0
	else 
		GetParaNum = clng(trim(request(str)))
	end if
end function
	
dim upload,file,formName,formPath,filesavepath
filesavepath = "/upphoto/"
set upload = new upload_5xsoft ''建立上传对象
	
set rs = server.CreateObject("adodb.recordset")
set file1 = upload.file("file1")
set file2 = upload.file("file2")

if upload.form("butdel")<>"" then
	if rs("Server_filepath")<>"" then
		sql="select Server_filepath, Server_filename, Client_filename,id from sq_jinrongcity.[Img_tab] where FParentID="& upload.form("id")
		if rs.state=1 then rs.close
		rs.open sql,conn,1,3		
	else
		conn.execute "update sq_jinrongcity.[Img_tab] set Server_filename='' , Server_filepath='' , Client_filename='' where id="& upload.form("id")
	end if
	response.Redirect("Menu_photo_edit.asp?id="&upload.form("id"))	
end if

if upload.form("butsave")<>""  then		
	randomize
	ranNum=int(90000*rnd)+10000

	news_sql="select * from sq_jinrongcity.[Img_tab] where id=" & upload.form("id")
	if rs.state=1 then rs.close
	rs.open news_sql,connstr,1,3
	if not rs.eof then
		rs("title") = upload.form("txttitle")
		rs("source") = upload.form("txtsource")
		rs("author") = upload.form("txtauthor")
		rs("NewsId") = upload.form("cmbLMid")
		rs("content") = upload.form("txtcontent")
		rs("indate") = now()
		rs("FParentID") = 0
			
		if file1.FileSize>0 then		
			filename_str1 = file1.FileName
			fileExt1 = lcase(right(filename_str1,4))
			if (fileEXT1<>".gif" and fileEXT1<>".jpg" and fileEXT1<>".png") then
				response.write "<font size=2>小图类型不正确[ <a href=# onclick=history.go(-1)>返回</a> ]</font>"
				response.end
			end if
			filename1 = filesavepath&year(now)&month(now)&day(now)&ranNum&fileExt1
			S_filename1 = year(now)&month(now)&day(now)&ranNum&fileExt1	

			rs("Server_filepath")=filename1
			rs("Server_filename")=S_filename1
			rs("Client_filename")=filename_str1
			file1.SaveAs Server.mappath(filename1)
			set file1=nothing
		end if
			rs.update
	end if
		
	news_sql="select * from sq_jinrongcity.[Img_tab] where FParentID=" & upload.form("id")
	if rs.state=1 then rs.close
		rs.open news_sql,connstr,1,3
		response.write("test")
		if not rs.eof then 
			rs("title")=upload.form("txttitle")
		  	rs("source")=upload.form("txtsource")
		  	rs("author")=upload.form("txtauthor")
		  	rs("NewsId")=upload.form("cmbLMid")
			rs("content")=upload.form("txtcontent")
		  	rs("indate")=now()		
			if file2.FileSize>0 then
				filename_str2=file2.FileName
				fileExt2=lcase(right(filename_str2,4))

				filename2=filesavepath&year(now)&month(now)&day(now)&ranNum&"b"&fileExt2
				S_filename2=year(now)&month(now)&day(now)&ranNum&"b"&fileExt2
				
				rs("Server_filepath")=filename2
				rs("Server_filename")=S_filename2
				rs("Client_filename")=filename_str2
				file2.SaveAs Server.mappath(filename2)
				set file2=nothing
			end if	
			rs.update
		end if
		
		news_sql="select * from sq_jinrongcity.[Img_tab] where id=" & upload.form("id")
		if rs.state=1 then rs.close
		rs.open news_sql,connstr,1,3			
				
	else
		if upload.form("butdel")="" then
			ID= GetParaNum("id")
			news_sql="select * from sq_jinrongcity.[Img_tab] where id=" & ID
			'response.Write(news_sql)
			'response.End()
			if rs.state=1 then rs.close
			rs.open news_sql,connstr,1,3
		   	if rs.eof then
		   		response.Write("信息已经不存在或被删除")
		   		response.End()
		   	end if
		end if
	end if
	
	set file=nothing						
	set upload=nothing 			
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="images/list.css" rel="stylesheet" type="text/css">
<meta http-equiv="pragma" content="no-cache">
<base target="_self">
<title>广告编辑</title>
<SCRIPT language=JavaScript type=text/JavaScript>
function ClearText()
{
	news_form.reset();	
}
function checkvalue()
{
	if (document.getElementById("txttitle").value=="") {
	document.getElementById("txttitle").focus();
	alert("请填写新闻标题");
	return false;
}
			
document.getElementById("sending").style.visibility = "visible";
document.news_form.submit();
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
<form action="#" method="post"  name="news_form" enctype="multipart/form-data">
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
        				<td height="26" background="images/headerbg1.gif">&nbsp; <span class="headtext"><img src="images/dec_1.gif" width="11" height="11" align="absmiddle"> 编辑广告</span></td>
      				</tr>
      				<tr>
				        <td height="2" bgcolor="#1061A2"></td>
			        </tr>
		      </table></td>
		  </tr></TBODY></TABLE>
	<TABLE cellSpacing=1 cellPadding="4" width="100%" align="center" border=0>
		<TBODY>
		<% if rs("Server_filepath")<>"" then %>
		<TR>
			<TD align="right" width=106 bgColor="#E5EFF7">图片路径：</TD>
			<TD colspan="3" align="left" bgColor="#F7F7F7"><a href="<%=rs("Server_filepath")%>" target="_blank"><% if not rs.eof then response.Write(rs("Server_filepath"))%></a>&nbsp;&nbsp;
			<input name="butdel" type="submit" class="buttomw" value="删除" />
			</TD>
		</TR>
		<%end if%>
                
		<TR>
			<TD align="right" width=106 bgColor="#E5EFF7"><font color="#FF0000">*</font> 位置：</TD>
			<TD colspan="3" align="left" bgColor="#F7F7F7"><input type="location" name="location" size="45" class="a2"></TD>
		</TR>
		<TR>
			<TD align="right" width=106 bgColor="#E5EFF7"><font color="#FF0000">*</font> 简要描述：</TD>
			<TD colspan="3" align="left" bgColor="#F7F7F7"><input type="title" name="title" size="45" class="a2"></TD>
		</TR>
		<TR>
			<TD align="right"  width=106 bgColor="#E5EFF7"><font color="#FF0000">*</font> url：</TD>
			<TD colspan="3" align="left" bgColor="#F7F7F7">
			<input type="text" name="url" size="50"/>
			</TD>
		</TR>		
			  <tr>
          <td height="46" colspan="4" bgcolor="#E5EFF7"><div align="center">
              <div align="center">
                <div align="right">
                  <div align="center">
                    <input name="butsave" type="submit" class="buttomw" value="修&nbsp;&nbsp;改" onClick="return checkvalue();" />					                    <input type="hidden" name="id" value="<% if rs.state=1 then
					if not rs.eof then
						response.Write(rs("id"))
					end if
					end if
					%>">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="Submit" type="button" class="buttomw" value="返回列表" onClick="window.location.href='Menu_photo_list.asp'" />
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
