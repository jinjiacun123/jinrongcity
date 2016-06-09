<!--#include file="../Inc/Dbconn.asp" -->

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
		ID=GetParaNum("id")
		
		set rs_aixin=server.CreateObject("ADODB.recordset")
		if request("butsave")<>"" then 
			aixin_sql="select * from sq_jinrongcity.[LmTab] where lmid="&request("id")
			rs_aixin.open aixin_sql,conn,1,3
		if not rs_aixin.eof then
			rs_aixin("lmname")=trim(request.form("txtlmname"))
			rs_aixin("lmorder")=trim(request.form("txtlmorder"))
			rs_aixin.update	
		end if
			if rs_aixin.state=1 then rs_aixin.close
			rs_aixin.open aixin_sql,conn,1,3			
		else
			aixin_sql="select * from sq_jinrongcity.[LmTab] where lmid="&ID
			if rs_aixin.state=1 then rs_aixin.close
			rs_aixin.open aixin_sql,conn,1,3
		end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/list.css" rel="stylesheet" type="text/css">
<title>编辑网站栏目</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	function ClearText()
	{
		news_form.reset();	
	}
</script>
<style type="text/css">
<!--
.style16 {	color: #333333;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="26" background="images/headerbg1.gif">&nbsp; <span class="headtext"><img src="images/groupq.gif" width="16" height="16" align="absmiddle"> 编辑网站栏目</span></td>
      </tr>
      <tr>
        <td height="2" bgcolor="#1061A2"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><form action="#" method="post" name="news_form">
      <table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr>
          <td width="16%" bgcolor="#E5EFF7"><div align="right" class="ltext"><span class="dot">*</span> 栏目名称：</div></td>
          <td width="84%" bgcolor="#F7F7F7"><input name="txtlmname" type="text" class="a2" id="txtlmname" value="<%=rs_aixin("lmname")%>" size="40" maxlength="200"></td>
        </tr>
        <tr>
          <td bgcolor="#E5EFF7"><div align="right" class="ltext"><span class="dot">*</span> 栏目排序：</div></td>
          <td bgcolor="#F7F7F7"><input name="txtlmorder" type="text" class="a2" id="txtlmorder" value="<%=rs_aixin("lmorder")%>" size="20" maxlength="100">
              <span class="tips"> [注:数字越小排列越靠前]</span></td>
        </tr>
        <tr>
          <td height="46" colspan="2" bgcolor="#E5EFF7"><div align="center">
                  <input name="butsave" type="submit" class="buttomw" value="保存修改" />
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input name="Submit" type="reset" class="buttomw" value="重新录入" onClick="ClearText();" />
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <input name="Submit2" type="button" class="buttomw" onClick="window.location.href='Menu_lm_list.asp'" value="返回列表" /></div></td>
        </tr>
      </table></form>
    </td>
  </tr>
</table>
</body>
</html>
