
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
    
    <title>����</title><LINK href="css.css" type=text/css rel=stylesheet>
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
	if(document.form1.huodongbianhao.value==""){alert("���������");document.form1.huodongbianhao.focus();return false;}if(document.form1.huodongmingcheng.value==""){alert("����������");document.form1.huodongmingcheng.focus();return false;}
}
function gow()
{
	document.location.href="jiaruhuodong_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
  <body >
    <%
  String sql;
  ResultSet RS_result;
  String id=request.getParameter("id");
  sql="select * from huodongxinxi where id="+id;
  String huodongbianhao="";String huodongmingcheng="";String huodongriqi="";String shetuan="";
  RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  huodongbianhao=RS_result.getString("huodongbianhao");huodongmingcheng=RS_result.getString("huodongmingcheng");huodongriqi=RS_result.getString("huodongriqi");shetuan=RS_result.getString("shetuan");
  }
   %>
  <form name="form1" id="form1" method="post" action="jiaruhuodong_add_post.jsp">
  ��Ӽ���:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr><td>���ţ�</td><td><input name='huodongbianhao' type='text' id='huodongbianhao' value='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' />&nbsp;*</td></tr><script language="javascript">document.form1.huodongbianhao.value='<%=huodongbianhao%>';</script><tr><td>����ƣ�</td><td><input name='huodongmingcheng' type='text' id='huodongmingcheng' value='' size='50' style='border:solid 1px #000000; color:#666666'  readonly='readonly' />&nbsp;*</td></tr><script language="javascript">document.form1.huodongmingcheng.value='<%=huodongmingcheng%>';</script><tr><td>����ڣ�</td><td><input name='huodongriqi' type='text' id='huodongriqi' value='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.huodongriqi.value='<%=huodongriqi%>';</script><tr><td>���ţ�</td><td><input name='shetuan' type='text' id='shetuan' value='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.shetuan.value='<%=shetuan%>';</script><tr><td>�����ˣ�</td><td><input name='jiaruren' type='text' id='jiaruren' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' /></td></tr><tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onclick="return check();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>

