<%

'��ȡurl�Ĳ���(��������)
function get_param_num(str)
	if not IsNumeric(trim(request(str))) then
		response.write "���ʴ����Ҳ�����ҳ!"
		response.end
		get_param_num = 0
	else
		get_param_num = clng(trim(request(str)))
	end if

end function


%>
