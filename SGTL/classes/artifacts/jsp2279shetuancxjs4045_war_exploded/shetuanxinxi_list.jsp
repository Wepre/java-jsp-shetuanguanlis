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
    <title>������Ϣ</title><LINK href="css.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>����������Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;&nbsp;�������ƣ�<input name="shetuanmingcheng" type="text" id="shetuanmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;�����ˣ�<input name="fuzeren" type="text" id="fuzeren" style='border:solid 1px #000000; color:#666666' size="12" />  �������ڣ�<input name="chuangbanriqi1" type="text" id="chuangbanriqi1"  value='' onclick="getDate(form1.chuangbanriqi1,'2')" need="1" size="10" />-<input name="chuangbanriqi2" type="text" id="chuangbanriqi2"  value='' onclick="getDate(form1.chuangbanriqi2,'2')" need="1" size="10"  />&nbsp;&nbsp;�ҿ���λ��<input name="guakaodanwei" type="text" id="guakaodanwei" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='shetuanxinxi_listxls.jsp';" />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��������</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>��ʼ��</td><td bgcolor='#CCFFFF'>������</td><td bgcolor='#CCFFFF' width='65' align='center'>��������</td><td bgcolor='#CCFFFF'>�ҿ���λ</td><td bgcolor='#CCFFFF'>����</td>
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
				String fysql="select count(id) as ss from shetuanxinxi";
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
  sql="select top 10 * from shetuanxinxi where 1=1";
}
else
{
  sql="select top "+page_record+" * from shetuanxinxi where id not in (select top "+((curpage-1)*page_record)+" id from shetuanxinxi order by id desc) ";
}

  if(request.getParameter("shetuanmingcheng")=="" ||request.getParameter("shetuanmingcheng")==null ){}else{sql=sql+" and shetuanmingcheng like '%"+new String(request.getParameter("shetuanmingcheng").getBytes("8859_1"))+"%'";}if(request.getParameter("fuzeren")=="" ||request.getParameter("fuzeren")==null ){}else{sql=sql+" and fuzeren like '%"+new String(request.getParameter("fuzeren").getBytes("8859_1"))+"%'";}if (request.getParameter("chuangbanriqi1")==""  ||request.getParameter("chuangbanriqi1")==null ) {}else{sql=sql+" and chuangbanriqi >= '"+new String(request.getParameter("chuangbanriqi1").getBytes("8859_1"))+"'";}if (request.getParameter("chuangbanriqi2")==""  ||request.getParameter("chuangbanriqi2")==null ) {}else {sql=sql+" and chuangbanriqi <= '"+new String(request.getParameter("chuangbanriqi2").getBytes("8859_1"))+"'";}if(request.getParameter("guakaodanwei")=="" ||request.getParameter("guakaodanwei")==null ){}else{sql=sql+" and guakaodanwei like '%"+new String(request.getParameter("guakaodanwei").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String shetuanmingcheng="";String jianjie="";String xingzhi="";String chuangshiren="";String fuzeren="";String chuangbanriqi="";String guakaodanwei="";String renshu="";
 String addtime="";
 int i=0;
 double renshuz=0;
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
shetuanmingcheng=RS_result.getString("shetuanmingcheng");jianjie=RS_result.getString("jianjie");xingzhi=RS_result.getString("xingzhi");chuangshiren=RS_result.getString("chuangshiren");fuzeren=RS_result.getString("fuzeren");chuangbanriqi=RS_result.getString("chuangbanriqi");guakaodanwei=RS_result.getString("guakaodanwei");renshu=RS_result.getString("renshu");
 addtime=RS_result.getString("addtime");
 renshuz=renshuz+Float.valueOf(renshu).floatValue();
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=shetuanmingcheng %></td><td><%=xingzhi %></td><td><%=chuangshiren %></td><td><%=fuzeren %></td><td><%=chuangbanriqi %></td><td><%=guakaodanwei %></td><td><%=renshu %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="90" align="center"><a href="shetuanxinxi_updt.jsp?id=<%=id%>">�޸�</a>  <a href="del.jsp?id=<%=id %>&tablename=shetuanxinxi" onclick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="shetuanxinxidetail.jsp?id=<%=id%>" target="_blank">��ϸ</a></td>
  </tr>
  	<%
  }
   %>
</table>
<p>����ͳ�ƣ���������:<%=renshuz%>��</p>
<br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onclick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="shetuanxinxi_list.jsp?page=1">��ҳ</a>��<a href="shetuanxinxi_list.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="shetuanxinxi_list.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="shetuanxinxi_list.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>
