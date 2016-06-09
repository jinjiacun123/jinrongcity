<%


if session("memeber_Id")="" then

Response.write "<script language=JavaScript>alert('error')</script>"
response.redirect "/melogin.asp"
response.End()
 end if
%> 