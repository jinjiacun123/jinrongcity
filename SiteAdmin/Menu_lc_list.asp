<!--#include file="../Inc/Dbconn.asp" -->
<!--#include file="../Inc/IsPass.asp" -->
<!--#include file="../Inc/toPagec.asp" -->

<%
		dim butdel,butsearch,butall
			butdel="0"
			butsearch="0"
			butall="0"

	set rs_news=server.CreateObject("ADODB.recordset")
		news_sql="select * from sq_jinrongcity.[Lc_tab] where FParentID=0 "

		if request.Form("butall")<>"" then
			response.Redirect("Menu_lc_list.asp")
		end if	
		

	if request("butdel")<>"" then
	 for each item in request("delchoose")
	 ''''ɾ��Сͼ
	  sql="select Server_filepath from sq_jinrongcity.[Lc_tab] where id="& item
		if rs_news.state=1 then rs_news.close
		rs_news.open sql,conn,1,3
		
		Oldfilename=rs_news("Server_filepath")
		if Oldfilename<>"" then
			set FSO=Server.CreateObject("Scripting.FileSystemObject")
			if  FSO.fileExists(server.MapPath(Oldfilename)) then
				 FSO.DeleteFile(server.MapPath(Oldfilename))
			end if	
		end if	
		
		
		conn.execute "delete from sq_jinrongcity.[Lc_tab] where id="& item
		next   'ѭ��ִ��ɾ�����
		response.Redirect("Menu_lc_list.asp")
	end if

		'��������ť
		if request.Form("butsearch")<>"" then
			if request.Form("Tj")<>"" then	
				news_sql=news_sql & request.Form("Tj")
			end if
		end if
		
		Set mypage0=new xdownpage   '��������
			mypage0.getconn=conn    '�õ����ݿ�����
			mypage0.pagesize=20     '����ÿһҳ�ļ�¼������
			mypage0.getsql=news_sql
		set rs_news=mypage0.getrs() '����Recordset		
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/list.css" rel="stylesheet" type="text/css">
<title>������Ϣ�б�</title>
<SCRIPT language=JavaScript type=text/JavaScript>
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->

function ShowRDlgRet(toLink,iW,iH)  //������ֵ�Ŀ�ܶԻ���
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
	  bLogged=ShowRDlgRet('Menu_lc_find.asp',500,150);
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
<form name="form1" method="post" action="Menu_lc_list.asp">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" height="0" colspan="4"></td>
  </tr>
  <tr>
    <td colspan="4">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EBEBEB">
            <tr>
              <td width="141" height="26"><div align="center" class="select"><input type="checkbox" name="checkall" onClick="check_all(this,'delchoose')">ȫѡ/ȡ��</div></td>
              <td width="560">&nbsp;</td>
              <td width="274">
                <div align="right"><input name="butdel" type="submit" class="buttomw" value="����ɾ��">&nbsp;&nbsp;<input name="butsearch" type="submit" class="buttomw" value="��Ϣ����" title="��Ϣ����" onClick="return searchrecord();"><input type="hidden" name="Tj">&nbsp;&nbsp;<input name="butall" type="submit" class="buttomw" value="ˢ ��">&nbsp;&nbsp;</div></td>
            </tr>
          </table>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
         <table width="100%"  border="0" cellpadding="4" cellspacing="1" bgcolor="#EBEBEB">
            <tr>
              <td width="6%" height="26" background="images/headerbg1.gif"><div align="center" class="headtext">��ѡ</div></td>
              <td width="6%" background="images/headerbg1.gif"><div align="center" class="headtext">���</div></td>
              <td width="13%" background="images/headerbg1.gif"><div align="center" class="headtext">��˾����</div></td>
			  <td width="26%" background="images/headerbg1.gif"><div align="center" class="headtext">��Ʒ����</div></td>
			  <td width="9%" background="images/headerbg1.gif"><div align="center" class="headtext">�𹺽��</div></td>
              <td width="8%" background="images/headerbg1.gif"><div align="center" class="headtext">������</div></td>
              <td width="7%" background="images/headerbg1.gif"><div align="center" class="headtext">����</div></td>
              <td width="6%" background="images/headerbg1.gif"><div align="center" class="headtext">����</div></td>
              <td width="7%" background="images/headerbg1.gif"><div align="center" class="headtext">�Ǽ�</div></td>
              <td width="7%" background="images/headerbg1.gif"><div align="center" class="headtext">�������</div></td>
              <td width="5%" background="images/headerbg1.gif"><div align="center" class="headtext">�༭</div></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td height="1" colspan="7" bgcolor="#E3E3E3"></td>
            </tr>
			<%
				for i=1 to mypage0.pagesize 
				if not rs_news.eof then
			%>
            <tr <%if i mod 2 = 1 then response.Write("bgcolor='#FFFFFF'") else response.Write("bgcolor='#FAFAFA'")%>>
              <td height="24"><div align="center">
                <input name="delchoose" type="checkbox" id="delchoose" value="<%=(rs_news.Fields.Item("id").Value)%>">
              </div></td>
              <td><div align="center"><%=  i+mypage0.pagesize * (mypage0.int_curpage-1) %></div></td>
              <td align="center"><span class="line150"><img src="<% if not rs_news.eof then response.Write(rs_news("Server_filepath"))%>" width="120px" height="50px"></span></td>
			  <td><span class="line150"><%=rs_news("title")%></span></td>
              <td><div align="left"><%=rs_news("money")%></div></td>
              <td><div align="left"><%=rs_news("year")%></div></td>
              <td><div align="left"><%=rs_news("big")%></div></td>
              <td><div align="left"><%=rs_news("jindu")%></div></td>
              <td><div align="left"><%=rs_news("xingji")%></div></td>
              <td><div align="center"><%=rs_news("clicked")%>��</div></td>
              <td><div align="center"><img src="images/del.gif" width="16" height="16" align="absmiddle"><a href="Menu_lc_edit.asp?id=<%=rs_news("ID")%>">�༭</a></div></td>
            </tr>
			<% rs_news.movenext
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