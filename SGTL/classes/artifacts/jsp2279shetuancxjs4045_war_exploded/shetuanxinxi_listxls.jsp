
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=shetuanxinxi.xls");
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ģ������</title>
    

  </head>
<%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>����ģ�������б�</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��������</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>��ʼ��</td><td bgcolor='#CCFFFF'>������</td><td bgcolor='#CCFFFF' width='65' align='center'>��������</td><td bgcolor='#CCFFFF'>�ҿ���λ</td><td bgcolor='#CCFFFF'>����</td>
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    

  </tr>
  <%
 
   sql="";
  sql="select * from shetuanxinxi  order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String shetuanmingcheng="";String jianjie="";String xingzhi="";String chuangshiren="";String fuzeren="";String chuangbanriqi="";String guakaodanwei="";String renshu="";
 String addtime="";
 int i=0;

 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
shetuanmingcheng=RS_result.getString("shetuanmingcheng");jianjie=RS_result.getString("jianjie");xingzhi=RS_result.getString("xingzhi");chuangshiren=RS_result.getString("chuangshiren");fuzeren=RS_result.getString("fuzeren");chuangbanriqi=RS_result.getString("chuangbanriqi");guakaodanwei=RS_result.getString("guakaodanwei");renshu=RS_result.getString("renshu");
 addtime=RS_result.getString("addtime");
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=shetuanmingcheng %></td><td><%=xingzhi %></td><td><%=chuangshiren %></td><td><%=fuzeren %></td><td><%=chuangbanriqi %></td><td><%=guakaodanwei %></td><td><%=renshu %></td>
    <td width="138" align="center"><%=addtime %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
�������ݹ�<%=i %>��
  </body>
</html>

