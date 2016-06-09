<!--#include file="memberinc.asp" -->
<!--#include file="inc/Dbconn.asp" -->
<%
	function GetParaNum(str)
		if not IsNumeric(trim(Request(str))) then
			response.write "Error"
			response.end
			GetParaNum	=	0
		else
			GetParaNum	=	clng(trim(Request(str)))
		end if
	end function
	
	id=GetParaNum("id")
'	session("memeber_Id")=1
set rs=Server.CreateObject("ADODB.Recordset")
	
		if rs.state=1 then rs.close()
		news_sql=" select * from [UserSc_tab] where FUserID="& session("memeber_Id") & " and FType=1 and FNewID="& trim(Request("id"))
		rs.open news_sql,conn,1,3
		if rs.recordcount=0 then 
		rs.addnew()
			rs("FUserID")=session("memeber_Id")
			rs("FType") =  1
			rs("FTitle") = ""
			rs("FNewID") =  id
			rs("FMemo") =  ""
			rs("FIndate")=now()
			rs.update
			rs.close
		end if
		 set rs=nothing
		Response.write "<script language=JavaScript>history.go(-1)/script>"
		response.redirect "/mesc.asp"
		response.End()
%>