
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
    
    <title>ͼƬ��Ϣ</title><LINK href="css.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
    

  </head>
<%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>����ͼƬ��Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;&nbsp;ͼƬ���ƣ�<input name="tupianmingcheng" type="text" id="tupianmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='tupianxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>ͼƬ����</td><td bgcolor='#CCFFFF' width='90' align='center'>ͼƬ</td>
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
  <%
  int curpage=1;//��ǰҳ
				int page_record=10;//ÿҳ��ʾ�ļ�¼��
				int zgs=0;
				int zys=0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from tupianxinxi";
				ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
  while(RS_resultfy.next()){
  zgs=Integer.parseInt(RS_resultfy.getString("ss"));
  zys=zgs/page_record+1;
  }
				if (hsgnpage!=null)
				{
				curpage=Integer.parseInt(request.getParameter("page"));//��ȡ���ݵ�ֵ����Ҫ��ʾ��ҳ
				}
				else
				{
				curpage=1;
				}
				if (curpage==0)
				{
					curpage=1;
				}
				if(curpage>zys)
				{
					curpage=zys;
				}
   sql="";
  if ((curpage-1)*page_record==0 )
{
  sql="select top 10 * from tupianxinxi where 1=1";
}
else
{
  sql="select top "+page_record+" * from tupianxinxi where id not in (select top "+((curpage-1)*page_record)+" id from tupianxinxi order by id desc) ";
}
  if(request.getParameter("tupianmingcheng")=="" ||request.getParameter("tupianmingcheng")==null ){}else{sql=sql+" and tupianmingcheng like '%"+new String(request.getParameter("tupianmingcheng").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String tupianmingcheng="";String tupian="";
 String addtime="";
 int i=0;
 //difengysfiqfgieuheze

 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
tupianmingcheng=RS_result.getString("tupianmingcheng");tupian=RS_result.getString("tupian");
 addtime=RS_result.getString("addtime");
  //zoxngxetxoxngjxvi
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=tupianmingcheng %></td><td width='90'><a href='<%=tupian %>' target='_blank'><img src='<%=tupian %>' width=88 height=99 border=0 /></a></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="60" align="center"><a href="tupianxinxi_updt.jsp?id=<%=id%>">�޸�</a>  <a href="del.jsp?id=<%=id %>&tablename=tupianxinxi" onclick="return confirm('���Ҫɾ����')">ɾ��</a></td>
  </tr>
  	<%
  }
   %>
</table>
<%//yougongzitongji%>
<br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onclick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="tupianxinxi_list.jsp?page=1">��ҳ</a>��<a href="tupianxinxi_list.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="tupianxinxi_list.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="tupianxinxi_list.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>

