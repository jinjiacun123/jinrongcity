<!--#include file="../Inc/Dbconn.asp" -->
<!--#include file="../Inc/IsPass.asp" -->
<%
		
		dim addnews,news_sql
			addnews="0"
		set rs_news=server.CreateObject("ADODB.recordset")
		if (request.Form("addnews")<>"") then
			news_sql="select * from sq_jinrongcity.[LmTab] where 1=2"
			rs_news.open news_sql,conn,1,3
			rs_news.addnew()	
			rs_news("lmname")=trim(request.form("txtlmname"))
			rs_news("lmorder")=trim(request.form("txtlmorder"))
			rs_news.Update
			response.write "<script language=javascript for=window event=onload>alert('保存成功！')</script>"				
		end if
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/list.css" rel="stylesheet" type="text/css">
<title>新增网站栏目</title>
<SCRIPT language=JavaScript type=text/JavaScript>

	function ClearText()
	{
		news_form.reset();	
	}
	function checkvalue()
	{
		
		if (document.getElementById("txtlmname").value=="") {
			document.getElementById("txtlmname").focus();
			alert("请填写栏目名称");
			return false;
		}
		
			document.news_form.submit();
			return true;
	}
</SCRIPT>
</head>

<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="26" background="images/headerbg1.gif">&nbsp; <span class="headtext"><img src="images/dec_1.gif" width="11" height="11" align="absmiddle"> 新增网站栏目</span></td>
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
          <td width="84%" bgcolor="#F7F7F7"><input name="txtlmname" type="text" class="a2" id="txtlmname" size="40" maxlength="200"></td>
        </tr>
        <tr>
          <td bgcolor="#E5EFF7"><div align="right" class="ltext"><span class="dot">*</span> 栏目排序：</div></td>
          <td bgcolor="#F7F7F7"><input name="txtlmorder" type="text" class="a2" id="txtlmorder" value="0" size="20" maxlength="100">
              <span class="tips"> [注:数字越小排列越靠前]</span></td>
        </tr>
        <tr>
          <td height="46" colspan="2" bgcolor="#E5EFF7"><div align="center">
              <div align="right">
                <div align="center">
                 <input name="addnews" type="submit" class="buttomw" value="保存添加" onClick="javascript:return checkvalue();" />
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
