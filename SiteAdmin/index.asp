<html>
<head>
<title>���ڳ���վ��̨����ϵͳ��</title>
<script type="text/javascript">
function switchSysBar(){
  var obj = document.getElementById("switchPoint");
  if (obj.alt == "�ر�����"){
    obj.alt = "������";
    obj.src = "images/nav_show.gif";
    document.getElementById("frmTitle").style.display="none";
  }
  else{
    obj.alt = "�ر�����";
    obj.src = "images/nav_hide.gif";
    document.getElementById("frmTitle").style.display="";
  }
}
</SCRIPT>
<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
<link href="css/maincss.css" rel="stylesheet" type="text/css">
<link href="css/secondfw.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
.STYLE3 {color: #FFFFFF}
-->
</style></head>
<body style="MARGIN: 0px" scroll="no">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" background="images/top_bg.gif"><img src="images/adminlogo.gif" width="550" height="47"></td>
    <td height="50" background="images/top_bg.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="95%" height="36" valign="top"><div align="right" class="STYLE1"><span class="STYLE3">��ǰʱ�䣺</span>
            <SCRIPT language=JavaScript><!--- 
today=new Date();var hours=today.getHours();var minutes=today.getMinutes();var seconds=today.getSeconds();var timeValue="<FONT COLOR=black>"+((hours>12)?hours-12:hours);timeValue+=((minutes<10)?"<BLINK><FONT COLOR=black>:</FONT></BLINK>0":"<BLINK><FONT COLOR=black>:</FONT></BLINK>")+minutes+"</FONT></FONT>";timeValue+=(hours>=12)?"<FONT COLOR=black>pm</FONT>":"<FONT COLOR=black>am</FONT>";function initArray(){this.length=initArray.arguments.length
for(var i=0;i<this.length;i++) 
this[i+1]=initArray.arguments[i]}var d=new initArray("������","<font color=white>����һ","<font color=white>���ڶ�","<font color=white>������","<font color=white>������","<font color=white>������","<font color=#FFFF00>������");document.write("<font color=white><font color=white>",today.getYear(),"��","<font color=white>",today.getMonth()+1,"��","<font color=white>",today.getDate(),"�� </FONT>",d[today.getDay()+1]);//--></SCRIPT>
          <script language="JavaScript1.2">
<!--
if (document.layers)
document.write('<ilayer id="clockmain" height=20><layer id="clock" width="100%"></layer></ilayer>');
else
document.write("<span id='clock' title='��ǰʱ��'></span>");
var now,hours,minutes,seconds,timeValue;
function showtime(){
if (!document.layers&&!document.all) return;
now = new Date();
hours = now.getHours();
minutes = now.getMinutes();
seconds = now.getSeconds();
timeValue = (hours >= 12) ? "���� " : "���� ";
timeValue += ((hours > 12) ? hours - 12 : hours) + ":";
timeValue += ((minutes < 10) ? "0" : "") + minutes + ":";
timeValue += ((seconds < 10) ? "0" : "") + seconds + "";
if (document.layers){
document.clockmain.document.clock.document.write(timeValue);
document.clockmain.document.clock.document.close();
}
else if (document.all)
clock.innerHTML = timeValue;
setTimeout("showtime()",100);
}
window.onload=showtime;
//-->
              </script>
        </div></td>
        <td width="5%">&nbsp;</td>
      </tr>
      
    </table></td>
  </tr>
  <tr>
    <td height="1" colspan="2" bgcolor="#055391"></td>
  </tr>
  <tr>
    <td width="68%" height="22" bgcolor="#B7CFE7"><span style="font-family:����;color:#404080;filter:glow(color=#FFFFFF, strength=1); WIDTH: 100%; ">&nbsp;&nbsp;<img src="images/wel.gif" width="16" height="16" align="absmiddle"> ��ӭ���� 
    <% =session("UserName")%>&nbsp;<img src="images/week.gif" width="18" height="18" align="absmiddle">��½ʱ�䣺<%=session("Addtime")%></span></td>
    <td width="32%" bgcolor="#B7CFE7" class="STYLE1">&nbsp;</td>
  </tr>
</table>
<TABLE height="87%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
    <TR>
      <TD align=middle vAlign=center noWrap id=frmTitle><iframe id=contents name=contents scrolling=auto frameborder=0 hspace=0 vspace=0 marginheight=0 margintop=0 src=Sysmenu.asp style="HEIGHT:100%; VISIBILITY: inherit; WIDTH:160;"></iframe></TD>
      <TD bgColor=#B7CFE7 style="width: 10"><TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
          <TBODY>
            <TR>
              <TD style="HEIGHT: 100%" onClick="switchSysBar()"><BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <a href="#" onFocus="this.blur()"><img src="images/nav_hide.gif" alt="�ر�����" name="switchPoint" width="13" height="13" border="0" id="switchPoint"></a><BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
              <BR></TD>
            </TR>
          </TBODY>
      </TABLE></TD>
      <TD style="WIDTH: 100%"><iframe id="main" name="ContFrame" style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1" scrolling="auto" frameborder="0" src="welcome.asp" allowtransparency></iframe></TD>
    </TR>
  </TBODY>
</TABLE>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12" bgcolor="#B7CFE7"></td>
  </tr>
  <tr>
    <td height="3" bgcolor="#E0E0E0"></td>
  </tr>
</table>
</body>
</html>