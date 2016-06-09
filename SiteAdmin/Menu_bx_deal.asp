<!--#include file="../Inc/upload_5xsoft.inc"-->
<!--#include file="../Inc/Dbconn.asp" -->

<%

			dim upload,file,formName,formPath,filesavepath
			filesavepath="/upphoto/"
			set upload=new upload_5xsoft ''建立上传对象
	
	
			set rs=server.CreateObject("adodb.recordset")
			set file1=upload.file("file1")
			
			filename_str1=file1.FileName

				 fileExt1=lcase(right(filename_str1,4))
			  if (fileEXT1<>".gif" and fileEXT1<>".jpg" and fileEXT1<>".png") then
					response.write "<font size=2>小图类型不正确[ <a href=# onclick=history.go(-1)>返回</a> ]</font>"
					response.end
			 end if 
			 
			 	randomize
 				ranNum=int(90000*rnd)+10000
				filename1=filesavepath&year(now)&month(now)&day(now)&ranNum&fileExt1
				S_filename1=year(now)&month(now)&day(now)&ranNum&fileExt1
				if file1.FileSize>0 then
'				
					rs.CursorLocation=3
					sql="select * from sq_jinrongcity.[Bx_tab] where 1=2"
					if rs.state=1 then rs.close
					rs.open sql,conn,1,3	
						rs.addnew
						rs("Server_filepath")=filename1
						rs("Server_filename")=S_filename1
						rs("Client_filename")=filename_str1
						rs("title")=upload.form("txttitle")
						rs("money")=upload.form("txtmoney")
						rs("year")=upload.form("txtyear")
						rs("big")=upload.form("txtbig")
						rs("jindu")=upload.form("txtjindu")
						rs("xingji")=upload.form("txtxingji")
						rs("content")=upload.form("txtcontent")
						rs("line")=upload.form("txtline")
						rs("indate")=now()
						rs.update
						rs.resync
						id=rs("id")
						file1.SaveAs Server.mappath(filename1)
						set file1=nothing
				end if									
					
		set upload=nothing 
		response.Redirect("Menu_bx_add.asp")
%>



