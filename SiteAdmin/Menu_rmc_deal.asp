<!--#include file="../Inc/upload_5xsoft.inc"-->
<!--#include file="../Inc/Dbconn.asp" -->

<%

			dim upload,file,formName,formPath,filesavepath
			filesavepath="/upphoto/"
			set upload=new upload_5xsoft ''建立上传对象
	
	
			set rs=server.CreateObject("adodb.recordset")
			set file1=upload.file("file1")
			set file2=upload.file("file2")
			
			filename_str1=file1.FileName
			filename_str2=file2.FileName
'				'response.Write(filename_str)
'			'response.End()				
'			
				' if (file1.filesize)>10000000 then
					'response.write "<font size=2>文件总大小不能超过1M[<a href=# onclick=history.go(-1)>返回</a>]</font>"
					'response.end
				' end if
				 fileExt1=lcase(right(filename_str1,4))
				  fileExt2=lcase(right(filename_str2,4))
			  if (fileEXT1<>".gif" and fileEXT1<>".jpg" and fileEXT1<>".png") then
					response.write "<font size=2>小图类型不正确[ <a href=# onclick=history.go(-1)>返回</a> ]</font>"
					response.end
			 end if 
			'  if (fileEXT2<>".gif" and fileEXT2<>".jpg" and fileEXT2<>".png") then
			'		response.write "<font size=2>大图类型不正确[ <a href=# onclick=history.go(-1)>返回</a> ]</font>"
			'		response.end
			' end if 			 
			 
			 	randomize
 				ranNum=int(90000*rnd)+10000
				filename1=filesavepath&year(now)&month(now)&day(now)&ranNum&fileExt1
				S_filename1=year(now)&month(now)&day(now)&ranNum&fileExt1
				filename2=filesavepath&year(now)&month(now)&day(now)&ranNum&"b"&fileExt2
				S_filename2=year(now)&month(now)&day(now)&ranNum&"b"&fileExt2		
				
				if file1.FileSize>0 then
'				
					rs.CursorLocation=3
					
					sql="select * from sq_jinrongcity.[LmTab_Rmc] where 1=2"
					if rs.state=1 then rs.close
					rs.open sql,conn,1,3	
					
						rs.addnew
						
						rs("Server_filepath")=filename1
						
						rs("Server_filename")=S_filename1
						rs("Client_filename")=filename_str1
						
						rs("title")=upload.form("txttitle")
						
						rs("source")=upload.form("txtsource")

						rs("author")=upload.form("txtauthor")
						rs("NewsId")=upload.form("cmbLMid")
						rs("content")=upload.form("txtcontent")
						rs("indate")=now()
						rs("FParentID")=0
						
						rs.update
						rs.resync
						id=rs("id")
						file1.SaveAs Server.mappath(filename1)
						set file1=nothing
				end if									
				if file2.FileSize>0 then
						if rs.state=1 then rs.close 
							rs.open sql,conn,1,3
						rs.addnew
						rs("Server_filepath")=filename2
						rs("Server_filename")=S_filename2
						rs("Client_filename")=filename_str2
						rs("title")=upload.form("txttitle")
						rs("source")=upload.form("txtsource")
						rs("author")=upload.form("txtauthor")
						rs("NewsId")=upload.form("cmbLMid")
						rs("content")=upload.form("txtcontent")
						rs("indate")=now()
						rs("FParentID")=id
						rs.update
						file2.SaveAs Server.mappath(filename2)
						set file2=nothing						
			  end if	

		set upload=nothing 
		response.Redirect("Menu_rmc_add.asp")
%>



