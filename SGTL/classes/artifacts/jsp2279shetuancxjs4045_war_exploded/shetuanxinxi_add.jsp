
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>������Ϣ</title><LINK href="css.css" type=text/css rel=stylesheet>
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
  </head>
<script language="javascript">
function check()
{
	if(document.form1.shetuanmingcheng.value==""){alert("��������������");document.form1.shetuanmingcheng.focus();return false;}if(document.form1.guakaodanwei.value==""){alert("������ҿ���λ");document.form1.guakaodanwei.focus();return false;}if((/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(document.form1.renshu.value))){}else{alert("��������������");document.form1.renshu.focus();return false;}
}
function gow()
{
	document.location.href="shetuanxinxi_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
  <body >
    <%
  String sql;
  ResultSet RS_result;
 //islbdq String id=request.getParameter("id");
 //islbdq sql="select * from melieibaoduqubiaoiguo where id="+id;
 //islbdq gogogogogo
 //islbdq RS_result=connDbBean.executeQuery(sql);
 //islbdq while(RS_result.next()){
 //islbdq lelelelelele
 //islbdq }
   %>
  <form name="form1" id="form1" method="post" action="shetuanxinxi_add_post.jsp">
  ���������Ϣ:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr><td>�������ƣ�</td><td><input name='shetuanmingcheng' type='text' id='shetuanmingcheng' value='' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>��飺</td><td><textarea name="jianjie" style="display:none"></textarea><iframe ID="eWebEditor1" src="eWebEditor_V4.60/ewebeditor.htm?id=jianjie&style=coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="350"></iframe></td></tr><tr><td>���ʣ�</td><td><input name='xingzhi' type='text' id='xingzhi' value='' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>��ʼ�ˣ�</td><td><input name='chuangshiren' type='text' id='chuangshiren' value='' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>�����ˣ�</td><td><input name='fuzeren' type='text' id='fuzeren' value='' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>�������ڣ�</td><td><input name='chuangbanriqi' type='text' id='chuangbanriqi' value='' readonly='readonly' onClick="getDate(document.form1.chuangbanriqi,'2')" need='1' style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr><tr><td>�ҿ���λ��</td><td><input name='guakaodanwei' type='text' id='guakaodanwei' value='' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>������</td><td><input name='renshu' type='text' id='renshu' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;&nbsp;����������</td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onclick="return check();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>

