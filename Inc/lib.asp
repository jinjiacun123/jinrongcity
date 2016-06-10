<%

'获取url的参数(数字类型)
function get_param_num(str)
	if not IsNumeric(trim(request(str))) then
		response.write "访问错误，找不到网页!"
		response.end
		get_param_num = 0
	else
		get_param_num = clng(trim(request(str)))
	end if

end function


%>
