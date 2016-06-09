<!--#include file="../Inc/IsPass.asp" -->
<html>
<head>
<title>Tree</title>
<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
<script type="text/javascript" src="css/dtree.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 6px;
	background-image: url();
	background-color: #EDF7FF;
}
body,td,th {
	font-size: 12px;
}
-->
</style>
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="dtree">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="22"><div align="center"><a href="javascript: d.openAll();" IsShowProcessBar="True">菜单展开</a> |  <a href="javascript: d.closeAll();">菜单收缩</a></div></td>
    </tr>
  </table>
  <script type="text/javascript">
		<!--

		d = new dTree('d');
		d.add(0,-1,'网站信息管理系统','welcome.asp','网站信息管理系统','ContFrame');
		d.add(1,0,'网站新闻管理','','网站新闻管理','ContFrame','','','');
		d.add(2,1,'发布网站新闻','Menu_news_add.asp','发布网站新闻','ContFrame','','','');
		d.add(5,1,'网站新闻列表','Menu_photo_list.asp','网站新闻列表','ContFrame','','','');
		
		d.add(32,0,'热门词管理','','热门词管理','ContFrame','','','');
		d.add(33,32,'添加热门词','Menu_lm_add.asp','添加热门词','ContFrame','','','');
		d.add(010,32,'热门词列表','Menu_lm_list.asp','热门词列表','ContFrame','','','');
		d.add(011,32,'添加信息','Menu_rmc_add.asp','添加信息','ContFrame','','','');
		d.add(101,32,'信息列表','Menu_rmc_list.asp','信息列表','ContFrame','','','');
		
		
		d.add(52,0,'理财管理','','理财管理','ContFrame','','','');
		d.add(53,52,'发布理财信息','Menu_lc_add.asp','发布理财信息','ContFrame','','','');
		d.add(503,52,'理财信息列表','Menu_lc_list.asp','理财信息列表','ContFrame','','','');
		
		d.add(71,0,'保险管理','','保险管理','ContFrame','','','');
		d.add(72,71,'发布保险信息','Menu_bx_add.asp','发布保险信息','ContFrame','','','');
		d.add(73,71,'保险信息列表','Menu_bx_list.asp','保险信息列表','ContFrame','','','');
		
		d.add(76,0,'企业专区管理','','企业专区管理','ContFrame','','','');
		d.add(77,76,'发布企业信息','Menu_qy_add.asp','发布企业信息','ContFrame','','','');
		d.add(78,76,'企业信息列表','Menu_qy_list.asp','企业信息列表','ContFrame','','','');
		
		d.add(63,0,'会员管理','','会员管理','ContFrame','','','');
		d.add(64,63,'添加会员','Menu_mem_add.asp','添加会员','ContFrame','','','');
		d.add(64,63,'会员列表','Menu_mem_add.asp','会员列表','ContFrame','','','');
		
		d.add(13,0,'网站用户管理','','网站用户管理','ContFrame','','','');
		d.add(63,13,'用户密码修改','Menu_admin_mod.asp','用户密码修改','ContFrame','','','');
		
		
		d.add(23,0,'系统管理','','系统管理','ContFrame','','','');
		d.add(24,23,'广告管理','Menu_ad_list.asp','广告管理','ContFrame','','','');
		d.add(25,23,'友情链接管理','Menu_link_list.asp','友情链接管理','ContFrame','','','');
		d.add(26,23,'搜索设置管理','Menu_setting.asp', '搜索设置管理', 'ContFrame', '', '', '');
		
		
		d.add(30,0,'注销管理系统','zxsystem.asp','注销管理系统','_blank','images/passwd.gif','','');
		d.add(31,0,'退出管理系统','Quit.asp','退出管理系统','_parent','images/quit.gif','','');
		
        //--------------------------------------------------------------
		document.write(d);
		//-->
	</script>
</div>
</body>
</html>
