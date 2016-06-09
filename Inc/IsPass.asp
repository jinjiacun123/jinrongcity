<%
if session("UserID")="" or session("UserName")="" then
'response.redirect "../Login.asp"
'response.end
Response.write "<script language=JavaScript>{window.alert('访问错误：可能还没有登陆或超时己过期！\n\n请返回登陆界面进行登陆！');window.close();}</script>"
response.redirect "../SiteAdmin/logarhtin.asp"
 end if
'没有进行登陆或超时时返回登陆页面

%>