<!--#include file="../Inc/Dbconn.asp" -->
<!--#include file="../Inc/IsPass.asp" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/list.css" rel="stylesheet" type="text/css">
<title>发布保险信息</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	function ClearText()
	{
		news_form.reset();	
	}
	function checkvalue()
	{
		if (document.getElementById("txttitle").value=="") {
			document.getElementById("txttitle").focus();
			alert("请填写产品名称");
			return false;
		}
		
		if (document.getElementById("file1").value=="") {
			document.getElementById("file1").focus();
			alert("请选择图片");
			return false;
		}
		
			document.getElementById("sending").style.visibility="visible";
			document.news_form.submit();
			return true;
	}
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
-->
</style>

</head>

<body topmargin="0" marginheight="0">
<form action="Menu_bx_deal.asp" method="post" name="news_form" enctype="multipart/form-data">
<div id="sending" style="position:absolute; z-index:600; width: 443px; left: 212px; top: 234px; height: 148px; visibility: hidden;"> 
<table width=445 height=152 border=0 cellspacing=0 cellpadding=0 bgcolor="#8FA8E9"> 
            <tr> 
              <td bgcolor=#EBEBEB align=center><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="24" background="images/headerbg.gif" bgcolor="#0033CC" class="style19">&nbsp;<span class="style4">系统提示信息</span></td>
                </tr>
                <tr>
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#6699CC">
                      <tr>
                        <td width="100%" height="124" bgColor="#E5EFF7"><div align="center"><img src="images/sending.gif" width="32" height="32" align="absmiddle"> 正在保存内容，请稍后......</div></td>
                      </tr>
                  </table></td>
                </tr>
              </table></td> 
            </tr> 
    </table> 
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="27" background="images/headerbg1.gif">&nbsp; <span class="headtext"><img src="images/dec_1.gif" width="11" height="11" align="absmiddle"> 发布保险信息</span></td>
      </tr>
      <tr>
        <td height="2" bgcolor="#1061A2"></td>
      </tr>
    </table>
<TABLE style="BORDER-COLLAPSE: collapse" cellSpacing=1 cellPadding="4" width="100%" align="center" border=0>
			  <TBODY>
			  <TR>
				<TD align="right" width=131 bgColor="#E5EFF7">公司名称：</TD>
				<TD colspan="3" align="left" bgColor="#E5EFF7"><input type="file"  name="file1" size="45" id="file1" class="a2">				  <span class="style1">(文件类型为:".jpg"、".gif"、".png")</span></TD>
				</TR>
			  <TR>
				<TD align="right" width=131 bgColor="#E5EFF7" >产品名称：</TD>
				<TD width="363"  align="left" bgColor="#E5EFF7"><input name="txttitle" type="text"  id="txttitle" size="30" maxlength="100" title="产品名称" class="a2"></TD>
				<TD width="113" align="right" bgColor="#E5EFF7">月付金额：</TD>
				<TD width="373" height=20 align="left" bgColor="#E5EFF7"><input name="txtmoney" type="text"  id="txtmoney" size="30" maxlength="100" title="月付金额" class="a2"></TD>
			  </TR>
			  <TR>
				<TD align="right" width=131 bgColor="#E5EFF7">利率/价值：</TD>
				<TD width="363"  align="left" bgColor="#E5EFF7"><input name="txtyear" type="text"  id="txtyear" size="30" maxlength="100" title="利率/价值" class="a2"></TD>
				<TD width="113" align="right" bgColor="#E5EFF7">期限：</TD>
				<TD width="373"  align="left" bgColor="#E5EFF7"><input name="txtbig" type="text"  id="txtbig" size="30" maxlength="100" title="期限" class="a2"></TD>
			  </TR>
              <TR>
				<TD align="right" width=131 bgColor="#E5EFF7">险种：</TD>
				<TD width="363"  align="left" bgColor="#E5EFF7"><input name="txtjindu" type="text"  id="txtjindu" size="30" maxlength="100" title="险种" class="a2"></TD>
				<TD width="113" align="right" bgColor="#E5EFF7">星级：</TD>
				<TD width="373"  align="left" bgColor="#E5EFF7"><input name="txtxingji" type="text"  id="txtxingji" size="30" maxlength="100" title="星级" class="a2"></TD>
				</TR>
              <TR>
				<TD align="right" width=131 bgColor="#E5EFF7">去抢标：</TD>
				<TD colspan="3" align="left" bgColor="#E5EFF7"><input name="txtline" type="text"  id="txtline" size="50" maxlength="100" title="链接" class="a2"> <span class="style1">(请填写网址，如：http://www.baidu.com)</span></TD>
				</TR>  
			  <TR>
				<TD align="right" width=131 bgColor="#E5EFF7" height=20>公司介绍：</TD>
				<TD  colspan="3" align="left" bgColor="#E5EFF7"><IFRAME ID="eWebEditor1" SRC="eWebEditor/ewebeditor.asp?id=txtcontent&style=s_blue" FRAMEBORDER="0" SCROLLING="no" WIDTH="550" HEIGHT="350"></IFRAME><textarea name="txtcontent" cols="" rows="" id="txtcontent" style="display:none"></textarea></TD>
				</TR>
								
			  <tr>
          <td height="46" colspan="4" bgcolor="#E5EFF7"><div align="center">
              <div align="center">
                <div align="right">
                  <div align="center">
                    <input name="addnews" type="submit" class="buttomw" value="确定发布" onClick="javascript:return checkvalue();" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="Submit" type="reset" class="buttomw" value="重新录入" onClick="ClearText();" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
                </div>
              </div>
          </div></td>
        </tr></TBODY></TABLE>
</form>				
</body>
</html>
