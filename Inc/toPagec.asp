<%
'==================================================
'XDOWNPAGE   ASP�汾
'�汾   1.00
'Code by  zykj2000
'Email:   zykj_2000@163.net
'�޸ģ�   ����� �����˷�ҳ����������cookies

'���뱣��������Ϣ
'===================================
' ��ʾ��BleaIdea�ķ�ҳ�����  R.Koo �޸�
'===================================
'
'�����ص�
'��������Ҫ�Ƕ����ݷ�ҳ�Ĳ��ֽ����˷�װ����������ʾ������ȫ���û��Զ��壬
'֧��URL�������
'
'ʹ��˵��
'�������˵��
'PapgeSize      �����ҳÿһҳ�ļ�¼��
'GetRS       ���ؾ�����ҳ��Recordset������ֻ��
'GetConn      �õ����ݿ�����
'GetSQL       �õ���ѯ���
'��������˵��
'ShowPage      ��ʾ��ҳ������,Ψһ������
'
'��:
'�����ļ�
' Set mypage=new xdownpage   '��������
' mypage.getconn=conn    '�õ����ݿ�����
' mypage.hNo="ҳ������"   '����ͬһҳʹ�ö��ҳ��Ĵ��룬������hNo������
' mypage.getsql="select * from productinfo order by id asc"
' mypage.pagesize=5    '����ÿһҳ�ļ�¼������Ϊ5��
' set rs=mypage.getrs()    '����Recordset
' for i=1 to mypage.pagesize    '�������Ĳ����ͺͲ���һ����ͨRecordset����һ������
'  if not rs.eof then   '��������Ϊ�˷�ֹ���һҳ�����
'   Response.Write &  rs(0) & "" '����Ϳ����Զ�����ʾ��ʽ��
'   rs.movenext
'  else
'   exit for
'  end if
' next
' response.write mypage.showpage ��ʾ��ҳ��Ϣ����set rs=mypage.getrs()�Ժ�

'=====================================================int_curpage

Class Xdownpage
Private XD_PageCount,XD_Conn,XD_Rs,XD_SQL,XD_PageSize,Str_errors,str_URL,int_totalPage,int_totalRecord,str_error,SW_Error,mhNo
private XD_fj
Public int_curpage

'=========================================
'PageSize ����
'����ÿһҳ�ķ�ҳ��С
'=========================================
Public Property Let PageSize(int_PageSize)
 If IsNumeric(Int_Pagesize) Then
  XD_PageSize=CLng(int_PageSize)
 Else
  str_error=str_error & "PageSize�Ĳ�������ȷ"
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
'GetRS ����
'���ط�ҳ��ļ�¼��
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
'GetConn  �õ����ݿ�����
'========================================== 
Public Property Let GetConn(obj_Conn)
 Set XD_Conn=obj_Conn
End Property

'=======================================
'GetSQL   �õ���ѯ���
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
' Setcs  ���ø��Ӳ���
'=======================================
Public Property Let Setcs(fjcs)
  XD_fj=fjcs
End Property
'=======================================
' SetWhichpage  �������ĸ����Ƶ�ҳ��
'=======================================
Public Property Let hNo(x)
  mhNo=x
End Property
'=======================================
' curPage  �õ���ǰҳ��ҳ��
'=======================================
Public Property Get curPage()
 
  curPage=int_curpage

End Property

'========================================
'Class_Initialize ��ĳ�ʼ��
'��ʼ����ǰҳ��ֵ
'======================================== 
Private Sub Class_Initialize
 '========================
 '�趨һЩ�������a��ֵ
 '========================
 XD_PageSize=10  '�趨��ҳ��Ĭ��ֵΪ10
 '========================
 '��ȡ��ǰ���ֵ
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
 ' ��ʾ��BleaIdea�ķ�ҳ�����  R.Koo �޸�
 '=============================
Public Function Page()
 Dim Str_tmp,str_fisrt,str_prev,str_next,str_last,str_info,str_select,i
 int_totalRecord=XD_RS.RecordCount
 If int_totalRecord<=0 Then
  str_error=str_error & "�ܼ�¼��Ϊ�㣬����������"
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
  str_fisrt="��ҳ"
  str_prev="ǰҳ"
 Else
  str_fisrt="<a href="""&geturl&"1"&""">��ҳ</a>"
  str_prev="<a href="""&geturl&int_curpage-1&""">ǰҳ</a>"
 End If

 If int_curpage>=int_totalpage Then
  str_next="��ҳ"
  str_last="βҳ"
 Else
  str_next="<a href="""&geturl&Int_curpage+1&""">��ҳ</a>"
  str_last="<a href="""&geturl&int_totalpage&""">βҳ</a>"
 End If
 str_select="<select style=""font:8pt;"" onchange=""if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}"">"
 For i=1 to int_totalpage
  str_select=str_select&"<option value="""&geturl&i&""""
  if int_curpage=i then str_select=str_select&" selected"  'str_tmp=str_tmp & "["&i&"]" else str_tmp=str_tmp & "<a href="""&geturl&i&""">["&i&"]</a>"
  str_select=str_select&">"&i&"</option>"
 Next
 str_select=str_select&"</select>"
 str_info="ҳ�Σ�<B>"&Int_curpage&"</B>/<B>"&int_totalpage&"</B>&nbsp;ҳ&nbsp;<B>"&XD_PageSize&"</B>��/ҳ&nbsp;ת��"&str_select&"ҳ&nbsp;��<B>"&int_totalrecord&"</B>����¼"
 Page = str_fisrt &"&nbsp;"& str_prev &"&nbsp;"& str_next &"&nbsp;"& str_last &"&nbsp;&nbsp;&nbsp;&nbsp;"& str_info
End Function

'================================================
'GetURL  �õ���ǰ��URL
'����URL������ͬ����ȡ��ͬ�Ľ��
'================================================
Private Function GetURL()
 Dim strurl,str_url,i,j,search_str,result_url,str_params
 search_str="page="
 
 strurl=Request.ServerVariables("URL")
 Strurl=split(strurl,"/")
 i=UBound(strurl,1)
 str_url=strurl(i)'�õ���ǰҳ�ļ���
 
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
' ���� Terminate �¼���
'===========================================
Private Sub Class_Terminate  
 if XD_RS.state=1 then XD_RS.close
 Set XD_RS=nothing
End Sub
'===========================================
'ShowError  ������ʾ
'===========================================
Private Sub ShowError()
 If str_Error <> "" Then
  Response.Write ("<div align=""center"">������<BR><BR><a href="""">����</a></div>")
  Response.End
 End If
End Sub
End class
%> 