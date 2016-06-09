function showMsg(msg){
	$('body').append('<div class="ui green message" id="alertMsg">'+msg+' <span class="glyphicon glyphicon-ok" aria-hidden="true"></span></div>');
	setTimeout(function(){
		$('#alertMsg').css('display','none');
	},1800);
}

//时间戳转换
function getLocalTime(nS) {     
	return new Date(parseInt(nS) * 1000).toLocaleString().replace(/:\d{1,2}$/,'');
}

function getParameter(name) { 
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r!=null) return unescape(r[2]); return null;
}