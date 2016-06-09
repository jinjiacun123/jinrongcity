<!--#include file="../Inc/Dbconn.asp" -->


<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="pragma" content="no-cache">
<title>搜索条件</title>
<script language="javascript">
	function setwhere()
	{
		var wherestr="";
			
		if (document.getElementById("txttile").value!=""){
			wherestr=" and title like '%%"+document.getElementById("txttile").value+"%%'";
			}
		if (document.getElementById("cmbLMid").value!=""){
			wherestr=wherestr+" and NewsId="+document.getElementById("cmbLMid").value;
			}			
		
	//	alert(wherestr);									
	   parent.returnValue=wherestr;
  	   parent.close(); 	
	}

</script>
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

<body>
<table width="450" border="0"  cellpadding="0" cellspacing="0" >
  <tr>
    <td height="10px"></td>
  </tr>
  </table>
<TABLE class="font02" style="BORDER-COLLAPSE: collapse" cellSpacing=1 cellPadding="3" width="460px" align="center" border=1>
	<TBODY>
	<tr><td width="80" bgcolor="#b5c7ef" height="30px" align="right">新闻标题</td>
	  <td width="349"><input type="text" name="txttile" id="txttile" size="40" /></td>
	</tr>
	<tr><td width="80" bgcolor="#b5c7ef" height="30px" align="right">所属新闻</td>
	  <td width="349"><select name="cmbLMid" id="cmbLMid">
				<option value="1">图片滚动</option>
                <option value="2">观点一区</option>
                <option value="3">资讯一区</option>
                <option value="4">普通文章</option>
				</select>
	  </td>
	</tr>	
	<tr>
	  <td colspan="2" height="30px" ><div align="center"><input name="butSearch" type="button" class="inputbtn11" value="搜&nbsp;&nbsp;&nbsp;&nbsp;索" onClick="javascript:setwhere();" />
	  </div></td>
	  </tr>	
	</TBODY>
</TABLE>
</body>
</html>
