//以下是搜索模块部分
$(function(){
    setInterval('AutoScroll("#ip_scroll")',3000);
})
document.domain = "jpm.cn";
var parentJpm = {
    popWin : function(url){
            $("#search_popWin #the_pop_Win",parent.document).attr("src",url);
    },
    toggle : function(){
            $("#search_popWin",parent.document).toggle(200);
            $("html",parent.document).toggleClass("overflowfidden");
    }
};
function fnSearchTit(obj) {
    var obj = $(obj);
    var search_ulA = obj.parents('.search_list').find('.search_ulA');
    var Kswitch = search_ulA.hasClass('none');
    $('.search_ulA').addClass('none');
    if (Kswitch == true) {
        search_ulA.removeClass('none');
    } else {
        search_ulA.addClass('none');
    }
    var Knum = obj.attr('Knum');
    //点击空白隐藏
    var khOther = obj.attr('khOther');
    var oShowT = 'search_listT0' + Knum;
    var oShowC = 'search_listC0' + Knum;
    if (khOther == 'k1') {//来源平台
        document.documentElement.onclick = function(e) {
            var target = e ? e.target : window.event.srcElement;
            if (target.id !== oShowT && target.id !== 'search_listTT00' && target.id !== 'search_listTT01' && target.id !== 'search_listTT02' && target.id !== 'search_listTT03' && target.id !== 'search_listTT04') {
                //document.getElementById(oShowC).className = 'search_ulA none';
                $('#' + oShowC).addClass('none');
            }
        };
    } else if (khOther == 'k2') {//来源平台
        document.documentElement.onclick = function(e) {
            var target = e ? e.target : window.event.srcElement;
            if (target.id !== oShowT && target.id !== 'search_listTT00' && target.id !== 'search_listTT01' && target.id !== 'search_listTT02' && target.id !== 'search_listTT03' && target.id !== 'search_listTT04') {
                $('#' + oShowC).addClass('none');
            }
        };
    } else {
        document.documentElement.onclick = function(e) {
            var target = e ? e.target : window.event.srcElement;
            if (target.id !== oShowT) {
                $('#' + oShowC).addClass('none');
            }
        };
    }
}
function fnSearchList(obj) {
    var obj = $(obj);
    var oShow = obj.parents('.search_list').find('.search_listT');
    var index = obj.parents("dl").index();
    var listType = oShow.attr('listType');
    var oVal = obj.attr('data-val');
    if (listType == 'iptxl') {
        oShow.val(oVal);
        oShow.text(oVal);
        oShow.attr('data-val', oVal);
    } else {
        var oText = obj.text();
        oShow.attr('data-val', oVal);
        oShow.text(oText);
        $(".tzinput").eq(index).val(oVal);
    }
}
function fnSourceTit(obj) {
    var obj = $(obj);
    var num = obj.index();
    var Span = obj.parent().children('span');
    Span.removeClass('show');
    obj.addClass('show');
    var oContent = obj.parent().parent().children('.SourceCon');
    oContent.hide();
    oContent.eq(num).show();
}
function fnSourceList(obj) {
    var obj = $(obj);
    var oVal = obj.attr('data-val');
    var oText = obj.text();
    var strid = obj.attr('str_id');
    var strletter = obj.attr('str_letter');
    var oShow = obj.parents('dl.search_list').children('dt.search_listT');
    oShow.attr('data-val', oVal);
    oShow.attr('strid', strid);
    oShow.attr('strletter', strletter);
    if(strid == "0"){
        oShow.text("来源平台（不限）");
    }else{
        oShow.text(oText);
    }
    var oContent = obj.parents('.search_ulA');
    oContent.addClass('none');
    $(".tzplaid").val(strid);
}
var time,plaid,rate;
$(".tztime").val("0");
$(".tzplaid").val("0");
$(".tzrate").val("0");
time = $(".tztime").val();
plaid = $(".tzplaid").val();
rate = $(".tzrate").val();
function FnSearch(){
    time = $(".tztime").val();
    plaid = $(".tzplaid").val();
    rate = $(".tzrate").val();
    parentJpm.popWin("http://s.jpm.cn/index/products?time="+ time +"&plaid="+ plaid +"&rate="+ rate +"&slilv=1&sjindu=1");
    parentJpm.toggle();
    //window.location.href = '/products?time=' + time + '&money=' + money + '&rate=' + rate + '&slilv=1&sjindu=1';
};
function AutoScroll(obj){
    $(obj).find("ul:first").animate({
            marginTop:"-30px"
    },500,function(){
            $(this).css({marginTop:"0px"}).find("li:first").appendTo(this);
    });
}
