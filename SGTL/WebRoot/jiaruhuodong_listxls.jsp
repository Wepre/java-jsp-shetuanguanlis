
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=jiaruhuodong.xls");
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
    <td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>�����</td><td bgcolor='#CCFFFF'>�����</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>������</td><td bgcolor='#CCFFFF'>��ע</td><td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    

  </tr>
  <%
 
   sql="";
  sql="select * from jiaruhuodong  order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String huodongbianhao="";String huodongmingcheng="";String huodongriqi="";String shetuan="";String jiaruren="";String beizhu="";String issh="";
 String addtime="";
 int i=0;

 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
huodongbianhao=RS_result.getString("huodongbianhao");huodongmingcheng=RS_result.getString("huodongmingcheng");huodongriqi=RS_result.getString("huodongriqi");shetuan=RS_result.getString("shetuan");jiaruren=RS_result.getString("jiaruren");beizhu=RS_result.getString("beizhu");issh=RS_result.getString("issh");
 addtime=RS_result.getString("addtime");
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=huodongbianhao %></td><td><%=huodongmingcheng %></td><td><%=huodongriqi %></td><td><%=shetuan %></td><td><%=jiaruren %></td><td><%=beizhu %></td><td width='80' align='center'><a href="sh.jsp?id=<%=id%>&yuan=<%=issh%>&tablename=jiaruhuodong" onclick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=issh%></a></td>
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

