
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
    
    <title>ͼƬ��Ϣ</title><script language="javascript" src="js/Calendar.js"></script>
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
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">
function check()
{
	if(document.form1.tupianmingcheng.value==""){alert("������ͼƬ����");document.form1.tupianmingcheng.focus();return false;}if(document.form1.tupian.value==""){alert("������ͼƬ");document.form1.tupian.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="tupianxinxi_updt_post.jsp?id=<%=id %>">
  �޸�ͼƬ��Ϣ:
  <br><br>
  <%
  String sql="select * from tupianxinxi where id="+id;
  String tupianmingcheng="";String tupian="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  tupianmingcheng=RS_result.getString("tupianmingcheng");tupian=RS_result.getString("tupian");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>ͼƬ���ƣ�</td><td><input name='tupianmingcheng' type='text' id='tupianmingcheng' size='50' value='<%=tupianmingcheng%>' style='border:solid 1px #000000; color:#666666'/></td></tr><tr><td>ͼƬ��</td><td><input name='tupian' type='text' id='tupian' size='50' value='<%= tupian%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('tupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onclick="return check();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


