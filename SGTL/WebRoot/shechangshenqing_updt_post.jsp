<%@ page language="java"  pageEncoding="gb2312" import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("gb2312"); 
response.setCharacterEncoding("gb2312"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
  </head>
  <body>
  <%
String xuehao=request.getParameter("xuehao");String xingming=request.getParameter("xingming");String shetuan=request.getParameter("shetuan");String shenqingliyou=request.getParameter("shenqingliyou");
String id=request.getParameter("id");
String sql="update shechangshenqing set xuehao='"+xuehao+"',xingming='"+xingming+"',shetuan='"+shetuan+"',shenqingliyou='"+shenqingliyou+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('�޸ĳɹ�!!');location.href='shechangshenqing_updt.jsp?id="+id+"';</script>");
%>
  </body>
</html>


