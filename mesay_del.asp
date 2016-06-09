<!--#include file="Inc/Dbconn.asp" -->

<%
   id=request("id")
   set cn=server.createobject("adodb.connection")
  cn.open conn
  cn.begintrans
  cn.execute "delete FROM [UserPl_tab] where id=" & id
  cn.committrans
  set cn=nothing
   response.Redirect(request.servervariables("http_referer"))
%>
