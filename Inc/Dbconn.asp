<%
dim conn
dim connstr
Set conn = Server.createobject("ADODB.Connection")
'connstr="PROVIDER=MSDASQL;Driver=SQLserver;Server=mssql.sql126.cdncenter.net;UID='sq_jinrongcity';PWD='jinrong78';Database='sq_jinrongcity';"
'connstr="PROVIDER=MSDASQL;Driver=SQL server;Server=222.76.213.138;UID=743333;PWD=743333321;Database=743333;"


'connstr="driver={SQL Server};"&"server=mssql.sql126.cdncenter.net;"&"Database=sq_jinrongcity;"&"UID=sq_jinrongcity;PWD=jinrong78;"
connStr="Provider=SQLOLEDB.1;Password='jinrong78';Persist Security Info=True;User ID='sq_jinrongcity';Initial Catalog='sq_jinrongcity';Data Source='mssql.sql126.cdncenter.net'" 
conn.Open connstr
newsconn=connstr
Session.Timeout=30

'set rs_gdtp_top=server.CreateObject("adodb.recordset")
'	rs_gdtp_top.open "select top 1 ID,Title,Indate,author,Server_filepath,FParentID,source,NewsId from sq_jinrongcity.[Img_tab] where NewsId=1 and FParentID=0 order by Indate desc",conn,1,3


%>