<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
<title>����ѧԺѧ�����Ź���ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
.STYLE1 {
	color: #FFFFFF;
	font-weight: bold;
}
.STYLE3 {color: #086BD6; font-weight: bold; }
.STYLE8 {color: #185838;
	font-weight: bold;
}
-->
</style>
</head>
<script language="javascript" src="js/Calendar.js"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	    <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","�ļ��ϴ�");
            pop.build();
            pop.show();
	    }
	</script>
<script language="javascript">
function check()
{
	if(document.form1.yonghuming.value==""){alert("�������û���");document.form1.yonghuming.focus();return false;}
	if(document.form1.mima.value==""){alert("����������");document.form1.mima.focus();return false;}
	if(document.form1.mima2.value!=document.form1.mima.value){alert("�������벻һ�£�������");document.form1.mima.focus();return false;}
	if(document.form1.xingming.value==""){alert("����������");document.form1.xingming.focus();return false;}
}
function gow()
{
	document.location.href="yonghuzhuce_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1002" height="1176" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><%@ include file="qttop.jsp"%></td>
	</tr>
	<tr>
		<td><table id="__01" width="1002" height="830" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td rowspan="2" valign="top"><table id="__01" width="738" height="830" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td valign="top"><table id="__01" width="738" height="225" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="738" height="41" background="qtimages/1_02_01_02_01.gif"><table width="100%" height="18" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="24%" align="center" valign="bottom"><span class="STYLE3">�û�ע��</span></td>
                        <td width="64%" valign="bottom">&nbsp;</td>
                        <td width="12%" valign="bottom"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="738" height="174"><table id="__01" width="738" height="174" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="13" background="qtimages/1_02_01_02_02_01.gif">&nbsp;</td>
                        <td width="714" height="772" valign="top"><table width="98%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#529C33" style="border-collapse:collapse">
                          <form name="form1" method="post" action="yonghuzhuce_add_post.jsp">
                            <tr>
                              <td>�û�����</td>
                              <td><input name='yonghuming' type='text' id='yonghuming' value='' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>���룺</td>
                              <td><input name='mima' type='password' id='mima' value='' />
                                &nbsp;* ȷ�����룺
                                <input name='mima2' type='password' id='mima2' value='' /></td>
                            </tr>
                            <tr>
                              <td>������</td>
                              <td><input name='xingming' type='text' id='xingming' value='' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>�Ա�</td>
                              <td><select name='xingbie' id='xingbie' style=" height:19px; border:solid 1px #000000; color:#666666">
                                  <option value="��">��</option>
                                  <option value="Ů">Ů</option>
                              </select></td>
                            </tr>
                            <tr>
                              <td>�������£�</td>
                              <td><input name='chushengnianyue' type='text' id='chushengnianyue' value='' readonly='readonly' onClick="getDate(document.form1.chushengnianyue,'2')" need='1' /></td>
                            </tr>
                            <tr>
                              <td>QQ��</td>
                              <td><input name='QQ' type='text' id='QQ' value='' /></td>
                            </tr>
                            <tr>
                              <td>���䣺</td>
                              <td><input name='youxiang' type='text' id='youxiang' value='' /></td>
                            </tr>
                            <tr>
                              <td>�绰��</td>
                              <td><input name='dianhua' type='text' id='dianhua' value='' /></td>
                            </tr>
                            <tr>
                              <td>���֤��</td>
                              <td><input name='shenfenzheng' type='text' id='shenfenzheng' value='' /></td>
                            </tr>
                            <tr>
                              <td>ͷ��</td>
                              <td><input name='touxiang' type='text' id='touxiang' size='50' value='' />
                                &nbsp;
                                <input name="button" type='button' onClick="up('touxiang')" value='�ϴ�' style=" height:19px; border:solid 1px #000000; color:#666666"/></td>
                            </tr>
                            <tr>
                              <td>��ַ��</td>
                              <td><input name='dizhi' type='text' id='dizhi' value='' size='50' /></td>
                            </tr>
                            <tr>
                              <td>��ע��</td>
                              <td><textarea name='beizhu' cols='50' rows='5' id='beizhu'></textarea></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td><input type="submit" name="Submit5" value="�ύ" onClick="return check();" style=" height:19px; border:solid 1px #000000; color:#666666"/>
                                  <input type="reset" name="Submit22" value="����" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
                            </tr>
                          </form>
                        </table>
                        <p align="center">&nbsp;</p>
                          <p align="center">&nbsp;</p></td>
                        <td width="11" background="qtimages/1_02_01_02_02_03.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_01_02_03.gif" width="738" height="10" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              
            </table></td>
            <td><img src="qtimages/1_02_02.gif" width="264" height="8" alt=""></td>
          </tr>
          <tr>
            <td valign="top"><%@ include file="qtleft.jsp"%></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td><%@ include file="qtdown.jsp"%></td>
	</tr>
</table>
</body>
</html>