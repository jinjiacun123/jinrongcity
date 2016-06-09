<%
'==================================================
'XDOWNPAGE   ASP版本
'版本   1.00
'Code by  zykj2000
'Email:   zykj_2000@163.net
'修改：   朱国雄 增加了翻页保留条件的cookies

'但请保留以上请息
'===================================
' 显示仿BleaIdea的分页栏风格  R.Koo 修改
'===================================
'
'程序特点
'本程序主要是对数据分页的部分进行了封装，而数据显示部份完全由用户自定义，
'支持URL多个参数
'
'使用说明
'程序参数说明
'PapgeSize      定义分页每一页的记录数
'GetRS       返回经过分页的Recordset此属性只读
'GetConn      得到数据库连接
'GetSQL       得到查询语句
'程序属性说明
'ShowPage      显示分页导航条,唯一的属性
'
'例:
'包含文件
' Set mypage=new xdownpage   '创建对象
' mypage.getconn=conn    '得到数据库连接
' mypage.hNo="页框名称"   '对于同一页使用多个页框的代码，可以以hNo来区别
' mypage.getsql="select * from productinfo order by id asc"
' mypage.pagesize=5    '设置每一页的记录条数据为5条
' set rs=mypage.getrs()    '返回Recordset
' for i=1 to mypage.pagesize    '接下来的操作就和操作一个普通Recordset对象一样操作
'  if not rs.eof then   '这个标记是为了防止最后一页的溢出
'   Response.Write &  rs(0) & "" '这里就可以自定义显示方式了
'   rs.movenext
'  else
'   exit for
'  end if
' next
' response.write mypage.showpage 显示分页信息，在set rs=mypage.getrs()以后

'=====================================================int_curpage

Class Xdownpage
Private XD_PageCount,XD_Conn,XD_Rs,XD_SQL,XD_PageSize,Str_errors,str_URL,int_totalPage,int_totalRecord,str_error,SW_Error,mhNo
private XD_fj
Public int_curpage

'=========================================
'PageSize 属性
'设置每一页的分页大小
'=========================================
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

'====================================================
'GetRS 属性
'返回分页后的记录集
'====================================================
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

'==========================================
'GetConn  得到数据库连接
'========================================== 
Public Property Let GetConn(obj_Conn)
 Set XD_Conn=obj_Conn
End Property

'=======================================
'GetSQL   得到查询语句
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

'=======================================
' Setcs  设置附加参数
'=======================================
Public Property Let Setcs(fjcs)
  XD_fj=fjcs
End Property
'=======================================
' SetWhichpage  设置是哪个名称的页框
'=======================================
Public Property Let hNo(x)
  mhNo=x
End Property
'=======================================
' curPage  得到当前页的页码
'=======================================
Public Property Get curPage()
 
  curPage=int_curpage

End Property

'========================================
'Class_Initialize 类的初始化
'初始化当前页的值
'======================================== 
Private Sub Class_Initialize
 '========================
 '设定一些参数的黙认值
 '========================
 XD_PageSize=10  '设定分页的默认值为10
 '========================
 '获取当前面的值
 '========================
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

 '==============================
 ' 显示仿BleaIdea的分页栏风格  R.Koo 修改
 '=============================
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

'================================================
'GetURL  得到当前的URL
'更据URL参数不同，获取不同的结果
'================================================
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

'===========================================
' 设置 Terminate 事件。
'===========================================
Private Sub Class_Terminate  
 if XD_RS.state=1 then XD_RS.close
 Set XD_RS=nothing
End Sub
'===========================================
'ShowError  错误提示
'===========================================
Private Sub ShowError()
 If str_Error <> "" Then
  Response.Write ("<div align=""center"">出错了<BR><BR><a href="""">返回</a></div>")
  Response.End
 End If
End Sub
End class
%> 