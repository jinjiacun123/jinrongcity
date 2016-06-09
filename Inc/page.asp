<%

Class Xdownpage
Private XD_PageCount,XD_Conn,XD_Rs,XD_SQL,XD_PageSize,Str_errors,str_URL,int_totalPage,int_totalRecord,str_error,SW_Error,mhNo
private XD_fj
Public int_curpage

Public Property Let PageSize(int_PageSize)
 If IsNumeric(Int_Pagesize) Then
  XD_PageSize=CLng(int_PageSize)
 Else
  str_error=str_error & "PageSize的参数不正确"
  ShowError()
 End If
End Property
Public Property Get PageSize
 If XD_PageSize="" or (not(IsNumeric(XD_PageSize))) Then
  PageSize=10     
 Else
  PageSize=XD_PageSize
 End If
End Property

Public Property Get GetRs()
 XD_Rs.PageSize=PageSize
 XD_Rs.Open XD_SQL,XD_Conn,1,3
 If not(XD_Rs.eof and XD_RS.BOF) Then
  If int_curpage>XD_RS.PageCount Then
   int_curpage=XD_RS.PageCount
  End If
  XD_Rs.AbsolutePage=int_curpage
 End If
  Set GetRs=XD_RS 
End Property

Public Property Get GetRsst()

 XD_Rs.PageSize=PageSize
 XD_Rs.Open XD_SQL,XD_Conn,1,1
 If not(XD_Rs.eof and XD_RS.BOF) Then
  If int_curpage>XD_RS.PageCount Then
   int_curpage=XD_RS.PageCount
  End If
  XD_Rs.AbsolutePage=int_curpage
 End If
  Set GetRsst=XD_RS 

End Property

Public Property Let GetConn(obj_Conn)
 Set XD_Conn=obj_Conn
End Property

'=======================================
Public Property Let GetSQL(str_sql)
 if request("page")<>"" then
    XD_SQL=request.Cookies("XD_SQL"&mhNo)
 end if
 if request("page")="" then
   XD_SQL=str_sql
   response.Cookies("XD_SQL"&mhNo)=XD_SQL 
  end if 

End Property
Public Property Let Setcs(fjcs)
  XD_fj=fjcs
End Property
Public Property Let hNo(x)
  mhNo=x
End Property
Public Property Get curPage()
 
  curPage=int_curpage

End Property
Private Sub Class_Initialize
 XD_PageSize=10
  If request("page")="" Then
  int_curpage=1
 ElseIf not(IsNumeric(request("page"))) Then
  int_curpage=1
 ElseIf CInt(Trim(request("page")))<1 Then
  int_curpage=1
 Else
  Int_curpage=CInt(Trim(request("page")))
 End If
 
  Set XD_Rs=Server.createobject("adodb.recordset")
  
End Sub

Public Function Page()
 Dim Str_tmp,str_fisrt,str_prev,str_next,str_last,str_info,str_select,i
 int_totalRecord=XD_RS.RecordCount
 If int_totalRecord<=0 Then
  str_error=str_error & "总记录数为零，请输入数据"
  'Call ShowError()
 End If
 If int_totalRecord>0 Then  'int_TotalPage=1
  If int_totalRecord mod PageSize =0 Then
   int_TotalPage = CLng(int_TotalRecord \ XD_PageSize )
  Else
   int_TotalPage = CLng(int_TotalRecord \ XD_PageSize )+1
  End If
 End If
 If Int_curpage>int_Totalpage Then
  int_curpage=int_TotalPage
 End If

 If int_curpage=1 Then
  str_fisrt="首页"
  str_prev="前页"
 Else
  str_fisrt="<a href="""&geturl&"1"&""">首页</a>"
  str_prev="<a href="""&geturl&int_curpage-1&""">前页</a>"
 End If

 If int_curpage>=int_totalpage Then
  str_next="后页"
  str_last="尾页"
 Else
  str_next="<a href="""&geturl&Int_curpage+1&""">后页</a>"
  str_last="<a href="""&geturl&int_totalpage&""">尾页</a>"
 End If
 str_select="<select style=""font:8pt;"" onchange=""if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}"">"
 For i=1 to int_totalpage
  str_select=str_select&"<option value="""&geturl&i&""""
  if int_curpage=i then str_select=str_select&" selected"  'str_tmp=str_tmp & "["&i&"]" else str_tmp=str_tmp & "<a href="""&geturl&i&""">["&i&"]</a>"
  str_select=str_select&">"&i&"</option>"
 Next
 str_select=str_select&"</select>"
 str_info="页次：<B>"&Int_curpage&"</B>/<B>"&int_totalpage&"</B>&nbsp;页&nbsp;<B>"&XD_PageSize&"</B>条/页&nbsp;转到"&str_select&"页&nbsp;共<B>"&int_totalrecord&"</B>个记录"
 Page = str_fisrt &"&nbsp;"& str_prev &"&nbsp;"& str_next &"&nbsp;"& str_last &"&nbsp;&nbsp;&nbsp;&nbsp;"& str_info
End Function
Private Function GetURL()
 Dim strurl,str_url,i,j,search_str,result_url,str_params
 search_str="page="
 
 strurl=Request.ServerVariables("URL")
 Strurl=split(strurl,"/")
 i=UBound(strurl,1)
 str_url=strurl(i)'得到当前页文件名
 
 str_params=Request.ServerVariables("QUERY_STRING")
 If str_params="" Then
  result_url=str_url &"?"& XD_fj & "page="
 Else
  If InstrRev(str_params,search_str)=0 Then
   result_url=str_url & "?"& XD_fj & str_params  &"&page="
  Else
   j=InstrRev(str_params,search_str)-2
   If j=-1 Then
    result_url=str_url &"?"& XD_fj & "page="
   Else
    str_params=Left(str_params,j)
    result_url=str_url & "?"& XD_fj & str_params &"&page="
   End If
  End If
 End If
 GetURL=result_url
End Function
Private Sub Class_Terminate  
 if XD_RS.state=1 then XD_RS.close
 Set XD_RS=nothing
End Sub
Private Sub ShowError()
 If str_Error <> "" Then
  Response.Write ("<div align=""center"">出错了<BR><BR><a href="""">返回</a></div>")
  Response.End
 End If
End Sub
End class

%>