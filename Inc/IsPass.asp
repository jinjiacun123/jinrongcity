<%
if session("UserID")="" or session("UserName")="" then
'response.redirect "../Login.asp"
'response.end
Response.write "<script language=JavaScript>{window.alert('���ʴ��󣺿��ܻ�û�е�½��ʱ�����ڣ�\n\n�뷵�ص�½������е�½��');window.close();}</script>"
response.redirect "../SiteAdmin/logarhtin.asp"
 end if
'û�н��е�½��ʱʱ���ص�½ҳ��

%>