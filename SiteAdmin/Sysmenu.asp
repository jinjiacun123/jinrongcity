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
      <td height="22"><div align="center"><a href="javascript: d.openAll();" IsShowProcessBar="True">�˵�չ��</a> |  <a href="javascript: d.closeAll();">�˵�����</a></div></td>
    </tr>
  </table>
  <script type="text/javascript">
		<!--

		d = new dTree('d');
		d.add(0,-1,'��վ��Ϣ����ϵͳ','welcome.asp','��վ��Ϣ����ϵͳ','ContFrame');
		d.add(1,0,'��վ���Ź���','','��վ���Ź���','ContFrame','','','');
		d.add(2,1,'������վ����','Menu_news_add.asp','������վ����','ContFrame','','','');
		d.add(5,1,'��վ�����б�','Menu_photo_list.asp','��վ�����б�','ContFrame','','','');
		
		d.add(32,0,'���Ŵʹ���','','���Ŵʹ���','ContFrame','','','');
		d.add(33,32,'������Ŵ�','Menu_lm_add.asp','������Ŵ�','ContFrame','','','');
		d.add(010,32,'���Ŵ��б�','Menu_lm_list.asp','���Ŵ��б�','ContFrame','','','');
		d.add(011,32,'�����Ϣ','Menu_rmc_add.asp','�����Ϣ','ContFrame','','','');
		d.add(101,32,'��Ϣ�б�','Menu_rmc_list.asp','��Ϣ�б�','ContFrame','','','');
		
		
		d.add(52,0,'��ƹ���','','��ƹ���','ContFrame','','','');
		d.add(53,52,'���������Ϣ','Menu_lc_add.asp','���������Ϣ','ContFrame','','','');
		d.add(503,52,'�����Ϣ�б�','Menu_lc_list.asp','�����Ϣ�б�','ContFrame','','','');
		
		d.add(71,0,'���չ���','','���չ���','ContFrame','','','');
		d.add(72,71,'����������Ϣ','Menu_bx_add.asp','����������Ϣ','ContFrame','','','');
		d.add(73,71,'������Ϣ�б�','Menu_bx_list.asp','������Ϣ�б�','ContFrame','','','');
		
		d.add(76,0,'��ҵר������','','��ҵר������','ContFrame','','','');
		d.add(77,76,'������ҵ��Ϣ','Menu_qy_add.asp','������ҵ��Ϣ','ContFrame','','','');
		d.add(78,76,'��ҵ��Ϣ�б�','Menu_qy_list.asp','��ҵ��Ϣ�б�','ContFrame','','','');
		
		d.add(63,0,'��Ա����','','��Ա����','ContFrame','','','');
		d.add(64,63,'��ӻ�Ա','Menu_mem_add.asp','��ӻ�Ա','ContFrame','','','');
		d.add(64,63,'��Ա�б�','Menu_mem_add.asp','��Ա�б�','ContFrame','','','');
		
		d.add(13,0,'��վ�û�����','','��վ�û�����','ContFrame','','','');
		d.add(63,13,'�û������޸�','Menu_admin_mod.asp','�û������޸�','ContFrame','','','');
		
		
		d.add(23,0,'ϵͳ����','','ϵͳ����','ContFrame','','','');
		d.add(24,23,'������','Menu_ad_list.asp','������','ContFrame','','','');
		d.add(25,23,'�������ӹ���','Menu_link_list.asp','�������ӹ���','ContFrame','','','');
		d.add(26,23,'�������ù���','Menu_setting.asp', '�������ù���', 'ContFrame', '', '', '');
		
		
		d.add(30,0,'ע������ϵͳ','zxsystem.asp','ע������ϵͳ','_blank','images/passwd.gif','','');
		d.add(31,0,'�˳�����ϵͳ','Quit.asp','�˳�����ϵͳ','_parent','images/quit.gif','','');
		
        //--------------------------------------------------------------
		document.write(d);
		//-->
	</script>
</div>
</body>
</html>
