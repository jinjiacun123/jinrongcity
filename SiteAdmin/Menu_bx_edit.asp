<!--#include file="../Inc/Dbconn.asp" -->
<!--#include file="../Inc/upload_5xsoft.inc" -->
			
<%
server.ScriptTimeout=500000

	function GetParaNum(str)
		if not IsNumeric(trim(request(str))) then
			response.write "���ʴ����Ҳ�����ҳ��"
			response.end
			GetParaNum	=	0
		else
			GetParaNum	=	clng(trim(request(str)))
		end if
	end function
	
	dim upload,file,formName,formPath,filesavepath
		filesavepath="/upphoto/"
		set upload=new upload_5xsoft ''�����ϴ�����
	
		set rs=server.CreateObject("adodb.recordset")
		set file1=upload.file("file1")
		
	
	if upload.form("butdel")<>"" then
	'''ɾ��Сͼ
	  sql="select Server_filepath, Server_filename, Client_filename,id from sq_jinrongcity.[Bx_tab] where id="& upload.form("id")
		if rs.state=1 then rs.close
		rs.open sql,conn,1,3
		Oldfilename=rs("Server_filepath")
		if Oldfilename<>"" then
			set FSO=Server.CreateObject("Scripting.FileSystemObject")
			if  FSO.fileExists(server.MapPath(Oldfilename)) then
				 FSO.DeleteFile(server.MapPath(Oldfilename))
			end if
		end if			
		
		conn.execute "update sq_jinrongcity.[Bx_tab] set Server_filename='' , Server_filepath='' , Client_filename='' where id="& upload.form("id")
		
		response.Redirect("Menu_bx_edit.asp?id="&upload.form("id"))	
	end if


	if upload.form("butsave")<>""  then
		
		randomize
		ranNum=int(90000*rnd)+10000

		news_sql="select * from sq_jinrongcity.[Bx_tab] where id=" & upload.form("id")
		if rs.state=1 then rs.close
		rs.open news_sql,connstr,1,3
		if not rs.eof then
			rs("title")=upload.form("txttitle")
			rs("money")=upload.form("txtmoney")
			rs("year")=upload.form("txtyear")
			rs("big")=upload.form("txtbig")
			rs("jindu")=upload.form("txtjindu")
			rs("xingji")=upload.form("txtxingji")
			rs("content")=upload.form("txtcontent")
			rs("line")=upload.form("txtline")
			rs("indate")=now()
			
		if file1.FileSize>0 then
		
		filename_str1=file1.FileName
		fileExt1=lcase(right(filename_str1,4))
		if (fileEXT1<>".gif" and fileEXT1<>".jpg" and fileEXT1<>".png") then
			response.write "<font size=2>Сͼ���Ͳ���ȷ[ <a href=# onclick=history.go(-1)>����</a> ]</font>"
			response.end
		end if
		filename1=filesavepath&year(now)&month(now)&day(now)&ranNum&fileExt1
		S_filename1=year(now)&month(now)&day(now)&ranNum&fileExt1	

			rs("Server_filepath")=filename1
			rs("Server_filename")=S_filename1
			rs("Client_filename")=filename_str1
			file1.SaveAs Server.mappath(filename1)
			set file1=nothing
		end if
			rs.update
		end if
		
		news_sql="select * from sq_jinrongcity.[Bx_tab] where id=" & upload.form("id")
		if rs.state=1 then rs.close
		rs.open news_sql,connstr,1,3			
				
	else
	if upload.form("butdel")="" then
		ID= GetParaNum("id")
		news_sql="select * from sq_jinrongcity.[Bx_tab] where id=" & ID
		'response.Write(news_sql)
		'response.End()
		if rs.state=1 then rs.close
		   rs.open news_sql,connstr,1,3
		   if rs.eof then
		   response.Write("��Ϣ�Ѿ������ڻ�ɾ��")
		   response.End()
		   end if
	end if
	end if
	
	set file=nothing						
	set upload=nothing 		
	
set rs2=server.CreateObject("ADODB.Recordset")			
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="images/list.css" rel="stylesheet" type="text/css">
<meta http-equiv="pragma" content="no-cache">
<base target="_self">
<title>������Ϣ�༭</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	function ClearText()
	{
		news_form.reset();	
	}
	function checkvalue()
	{
			if (document.getElementById("txttitle").value=="") {
			document.getElementById("txttitle").focus();
			alert("����д��Ʒ����");
			return false;
		    }
			
			document.getElementById("sending").style.visibility="visible";
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
                  <td height="24" background="images/headerbg.gif" bgcolor="#0033CC" class="style19">&nbsp;<span class="style4">ϵͳ��ʾ��Ϣ</span></td>
                </tr>
                <tr>
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#6699CC">
                      <tr>
                        <td width="100%" height="124" bgcolor="#F0F0F0"><div align="center"><img src="images/sending.gif" width="32" height="32" align="absmiddle"> ���ڱ������ݣ����Ժ�......</div></td>
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
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="26" background="images/headerbg1.gif">&nbsp; <span class="headtext"><img src="images/dec_1.gif" width="11" height="11" align="absmiddle"> �༭������Ϣ</span></td>
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
				<TD align="right" width=106 bgColor="#E5EFF7">��˾���ƣ�</TD>
				<TD colspan="3" align="left" bgColor="#F7F7F7"><a href="<%=rs("Server_filepath")%>" target="_blank"><% if not rs.eof then response.Write(rs("Server_filepath"))%></a>&nbsp;&nbsp;
				<input name="butdel" type="submit" class="buttomw" value="ɾ��" />
				</TD>
				</TR><%end if%>
                
				<TR>
				<TD align="right" width=106 bgColor="#E5EFF7">ͼƬ·����</TD>
				<TD colspan="3" align="left" bgColor="#F7F7F7"><input type="file" name="file1" size="45" class="a2"></TD>
				</TR>
			  <TR>
			    <TD align="right"  width=106 bgColor="#E5EFF7" >��Ʒ���ƣ�</TD>
			    <TD colspan="3" align="left" bgColor="#F7F7F7"><input type="text" name="txttitle" size="50" class="a2" value="<%=rs("title")%>"></TD>
			  </TR>	
			  <TR>
			    <TD align="right"  width=106 bgColor="#E5EFF7">�¸���</TD>
			    <TD colspan="3" align="left" bgColor="#F7F7F7"><input type="text" name="txtmoney" size="50" class="a2" value="<%=rs("money")%>"></TD>
			  </TR>			  		
				<TR>
			      <TD align="right" bgColor="#E5EFF7">����/��ֵ��</TD>
			      <TD colspan="3" align="left" bgColor="#F7F7F7"><input type="text" name="txtyear" size="50" class="a2" value="<%=rs("year")%>"></TD>
		        </TR>
                <TR>
			      <TD align="right" bgColor="#E5EFF7">���ޣ�</TD>
			      <TD colspan="3" align="left" bgColor="#F7F7F7"><input name="txtbig" type="text"  size="25" maxlength="100" title="¼��ʱ��" value="<%response.Write(rs("big"))%>" class="a2"></TD>
		        </TR>
              <TR>
			      <TD align="right" bgColor="#E5EFF7">���֣�</TD>
			      <TD colspan="3" align="left" bgColor="#F7F7F7"><input name="txtjindu" type="text"  id="txtauthor" size="25" maxlength="100" title="¼��ʱ��" value="<%response.Write(rs("jindu"))%>" class="a2"></TD>
		        </TR>
                <TR>
			      <TD align="right" bgColor="#E5EFF7">�Ǽ���</TD>
			      <TD colspan="3" align="left" bgColor="#F7F7F7"><input name="txtxingji" type="text" size="25" maxlength="100" title="¼��ʱ��" value="<%response.Write(rs("xingji"))%>" class="a2"></TD>
		        </TR>
                <TR>
			      <TD align="right" bgColor="#E5EFF7">ȥ���꣺</TD>
			      <TD colspan="3" align="left" bgColor="#F7F7F7"><input name="txtline" type="text" size="25" maxlength="100" title="ȥ����" value="<%response.Write(rs("line"))%>" class="a2"></TD>
		        </TR>
             <TR>
			      <TD align="right" bgColor="#E5EFF7">������</TD>
                  <%
set rs2=server.CreateObject("ADODB.Recordset")		
	rs2.open "select a.id as plid,a.FNewID,a.dianpin,a.FType,b.ID from [UserPl_tab] a inner join sq_jinrongcity.[Bx_tab] b on a.FNewID=b.ID where a.FType=2 ",conn,1,3
%>
			      <TD colspan="3" align="left" bgColor="#F7F7F7" style="color:#F00">
				  	<table cellpadding="0" cellspacing="0" border="0">
                    	<%
					do while not rs2.eof
				%>
                        <tr><td height="25px" style="color:#F00"><a href="Menu_Bx_list_del.asp?id=<%=rs2("plid")%>"><%=rs2("dianpin")%></a>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">(*������ݿ�ɾ��)</font></td></tr>
                        <%
					rs2.movenext
					loop				
				%>
                    </table>
				  </TD>
		        </TR>   
			<TR>
				<TD align="right" bgColor="#E5EFF7" height=20>��˾���ܣ�</TD>
				<TD  colspan="3" align="left" bgColor="#F7F7F7"><IFRAME ID="eWebEditor1" SRC="eWebEditor/ewebeditor.asp?id=txtcontent&style=s_blue" FRAMEBORDER="0" SCROLLING="no" WIDTH="550" HEIGHT="300"></IFRAME><textarea name="txtcontent" cols="" rows="" id="txtcontent" style="display:none"><%response.Write(Server.HtmlEncode(rs("content")))%></textarea></TD>
				</TR>						
			  <tr>
          <td height="46" colspan="4" bgcolor="#E5EFF7"><div align="center">
              <div align="center">
                <div align="right">
                  <div align="center">
                    <input name="butsave" type="submit" class="buttomw" value="��&nbsp;&nbsp;��" onClick="return checkvalue();" />					                    <input type="hidden" name="id" value="<% if rs.state=1 then
					if not rs.eof then
						response.Write(rs("id"))
					end if
					end if
					%>">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="Submit" type="button" class="buttomw" value="�����б�" onClick="window.location.href='Menu_bx_list.asp'" />
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