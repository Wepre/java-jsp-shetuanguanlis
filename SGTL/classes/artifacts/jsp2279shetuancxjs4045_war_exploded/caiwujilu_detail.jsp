
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
    
    <title>�����¼��ϸ</title><script language="javascript" src="js/Calendar.js"></script>
	
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">
function check()
{
	fewgidsoidfjdkgds
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>

  �����¼��ϸ:
  <br><br>
   <%
  String sql="select * from caiwujilu where id="+id;
  String shetuanmingcheng="";String jine="";String shouzhi="";String jingshouren="";String xiangmumingcheng="";String riqi="";String beizhu="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  shetuanmingcheng=RS_result.getString("shetuanmingcheng");jine=RS_result.getString("jine");shouzhi=RS_result.getString("shouzhi");jingshouren=RS_result.getString("jingshouren");xiangmumingcheng=RS_result.getString("xiangmumingcheng");riqi=RS_result.getString("riqi");beizhu=RS_result.getString("beizhu");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>�������ƣ�</td><td width='39%'><%=shetuanmingcheng%></td><td width='11%'>��</td><td width='39%'><%=jine%></td></tr><tr><td width='11%'>��֧��</td><td width='39%'><%=shouzhi%></td><td width='11%'>�����ˣ�</td><td width='39%'><%=jingshouren%></td></tr><tr><td width='11%'>��Ŀ���ƣ�</td><td width='39%'><%=xiangmumingcheng%></td><td width='11%'>���ڣ�</td><td width='39%'><%=riqi%></td></tr><tr><td width='11%'>��ע��</td><td width='39%'><%=beizhu%></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


