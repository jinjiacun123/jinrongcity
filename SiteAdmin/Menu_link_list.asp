<!--#include file="../Inc/Dbconn.asp" -->
<!--#include file="../Inc/IsPass.asp" -->
<!--#include file="../Inc/toPagec.asp" -->

<%
	dim butdel,butsearch,butall
	butdel = "0"
	butsearch = "0"
	butall = "0"

	set rs_link=server.CreateObject("ADODB.recordset")
	link_sql="select * from sq_jinrongcity.[jr_link]"

	if request.Form("butall")<>"" then
		response.Redirect("Menu_link_list.asp")
	end if	


	'点搜索按钮
	if request.Form("butsearch")<>"" then
		if request.Form("Tj")<>"" then	
			news_sql=news_sql & request.Form("Tj")
		end if
	end if
		
	Set mypage0 = new xdownpage   	'创建对象
	mypage0.getconn = conn    	'得到数据库连接
	mypage0.pagesize =20     	'设置每一页的记录条数据
	mypage0.getsql = link_sql
	set rs_links = mypage0.getrs() 	'返回Recordset		
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/list.css" rel="stylesheet" type="text/css">
<title>友情链接管理</title>
<SCRIPT language=JavaScript type=text/JavaScript>
<!--
function MM_preloadImages() { //v3.0
    var d=document; 
    if(d.images){ 
	if(!d.MM_p) 
		d.MM_p = new Array();
    	var i,j=d.MM_p.length,a=MM_preloadImages.arguments; 
    	for(i=0; i<a.length; i++)
     		if (a[i].indexOf("#")!=0){ 
			d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];
	}
    }
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; 
  for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) 
	x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  
  if(!d) 
    d=document; 
  if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);
 }
 if(!(x=d[n])&&d.all) 
    x=d.all[n]; 
 for (i=0;!x&&i<d.forms.length;i++) 
    x=d.forms[i][n];
 for(i=0;!x&&d.layers&&i<d.layers.length;i++) 
	x=MM_findObj(n,d.layers[i].document);
 if(!x && d.getElementById) x=d.getElementById(n); 
	return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; 
  document.MM_sr=new Array; 
  for(i=0;i<(a.length-2);i+=3)
    if ((x=MM_findObj(a[i]))!=null){
        document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];
  }
}
//-->

function ShowRDlgRet(toLink,iW,iH)  //带返回值的框架对话框
 {  
        var nDialogWidth=iW;
        var nDialogHeight=iH;
        var nLeft=(window.screen.availWidth-nDialogWidth)/2;
        var nTop=(window.screen.availHeight-nDialogHeight)/2;
        var sFeatures="dialogLeft:"+nLeft+"px;dialogTop:"+nTop+"px;dialogHeight:"+nDialogHeight+"px;dialogWidth:"+nDialogWidth+"px;help:no;status:no;center=yes";
        var bLogged=window.showModalDialog(toLink,window,sFeatures);
		return bLogged;
 }
 
function searchrecord(){
	  var bLogged;
	  bLogged=ShowRDlgRet('Menu_news_find.asp',500,150);
	  if ((typeof(bLogged)!="undefined")&&(bLogged!="undefined")&&(bLogged!=""))  	    
	  {
		document.getElementById("butsearch").value="1";
		document.form1.Tj.value=bLogged;
		document.form1.submit();
		return true;  
	   }
	   return false;
}

function check_all(menu_all,MENU_ID)
{
 for (i=0;i<document.all(MENU_ID).length;i++)
 {
   if(menu_all.checked)
      document.all(MENU_ID).item(i).checked=true;
   else
      document.all(MENU_ID).item(i).checked=false;
 }

 if(i==0)
 {
   if(menu_all.checked)
      document.all(MENU_ID).checked=true;
   else
      document.all(MENU_ID).checked=false;
 }
}
</SCRIPT>
</head>

<body>
<form name="form1" method="post" action="Menu_ad_list.asp">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="4">
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
         <table width="100%"  border="0" cellpadding="4" cellspacing="1" bgcolor="#EBEBEB">
            <tr>
              <td width="6%" background="images/headerbg1.gif"><div align="center" class="headtext">序号</div></td>
              <td width="11%" background="images/headerbg1.gif"><div align="center" class="headtext">排序</div></td>
              <td width="30%" background="images/headerbg1.gif"><div align="center" class="headtext">标题</div></td>
			  <td width="23%" background="images/headerbg1.gif"><div align="center" class="headtext">url</div></td>
			  <td width="23%" background="images/headerbg1.gif"><div align="center" class="headtext">是否显示</div></td>
              <td width="7%" background="images/headerbg1.gif"><div align="center" class="headtext">编辑</div></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td height="1" colspan="6" bgcolor="#E3E3E3"></td>
            </tr>
		<%
		for i=1 to mypage0.pagesize 
		if not rs_links.eof then
		%>
            <tr <%if i mod 2 = 1 then response.Write("bgcolor='#FFFFFF'") else response.Write("bgcolor='#FAFAFA'")%>>              
              <td><div align="center"><%=  i+mypage0.pagesize * (mypage0.int_curpage-1) %></div></td>
              <td><div align="center"><%=rs_links("sort")%></div></td>
              <td><div align="center"><%=rs_links("title")%></div></td>
	      <td><div align="left"><%=rs_links("url")%></div></td>
              <td><div align="left"><% if rs_links("is_show") = 0 then %>是<% else %>否<% end if %></div></td>
              <td><div align="center">
                    <img src="images/del.gif" width="16" height="16" align="absmiddle">
                            <a href="Menu_link_edit.asp?id=<%=rs_links("id")%>">编辑</a>
                    </div>
    	      </td>
            </tr>
			<% rs_links.movenext
	  else
        exit for
     end if
       next
	%>
          </table>
         </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="1" colspan="4" bgcolor="#BABABA"></td>
  </tr>
  <tr bgcolor="#6B9ACE">
    <td height="28" colspan="4"><table width="99%"  border="0" align="center" cellpadding="5" cellspacing="0">
      <tr>
        <td align="center" style="color:#FFFFFF"><% response.write mypage0.page %></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="6" colspan="4"></td>
  </tr>
</table>
</form>
</body>
</html>


