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
    <title>��Ա��Ϣ</title><LINK href="css.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>������Ա��Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;&nbsp;ѧ�ţ�<input name="xuehao" type="text" id="xuehao" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;������<input name="xingming" type="text" id="xingming" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='sheyuanxinxi_listxls.jsp';" />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>ѧ��</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>רҵ</td><td bgcolor='#CCFFFF'>�༶</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>��ϵ��ʽ</td><td bgcolor='#CCFFFF' width='90' align='center'>��Ƭ</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>�Ƿ��糤</td><td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
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
				String fysql="select count(id) as ss from sheyuanxinxi";
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
  sql="select top 10 * from sheyuanxinxi where 1=1";
}
else
{
  sql="select top "+page_record+" * from sheyuanxinxi where id not in (select top "+((curpage-1)*page_record)+" id from sheyuanxinxi order by id desc) ";
}

  
if(request.getParameter("xuehao")=="" ||request.getParameter("xuehao")==null ){}else{sql=sql+" and xuehao like '%"+new String(request.getParameter("xuehao").getBytes("8859_1"))+"%'";}
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+new String(request.getParameter("xingming").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String xuehao="";String xingming="";String mima="";String zhuanye="";String banji="";String sushe="";String lianxifangshi="";String zhaopian="";String beizhu="";String shetuan="";String shifoushechang="";String issh="";
 String addtime="";
 int i=0;
 //difengysfiqfgieuheze
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
xuehao=RS_result.getString("xuehao");xingming=RS_result.getString("xingming");mima=RS_result.getString("mima");zhuanye=RS_result.getString("zhuanye");banji=RS_result.getString("banji");sushe=RS_result.getString("sushe");lianxifangshi=RS_result.getString("lianxifangshi");zhaopian=RS_result.getString("zhaopian");beizhu=RS_result.getString("beizhu");shetuan=RS_result.getString("shetuan");shifoushechang=RS_result.getString("shifoushechang");issh=RS_result.getString("issh");
 addtime=RS_result.getString("addtime");
 //zoxngxetxoxngjxvi
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=xuehao %></td><td><%=xingming %></td><td><%=mima %></td><td><%=zhuanye %></td><td><%=banji %></td><td><%=sushe %></td><td><%=lianxifangshi %></td><td width='90'><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0 /></a></td><td><%=shetuan %></td><td><a href="sh2.jsp?id=<%=id%>&yuan=<%=shifoushechang%>" onClick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=shifoushechang %></a></td><td width='80' align='center'><a href="sh.jsp?id=<%=id%>&yuan=<%=issh%>&tablename=sheyuanxinxi" onClick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=issh%></a></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="90" align="center"><a href="sheyuanxinxi_updt.jsp?id=<%=id%>">�޸�</a>  <a href="del.jsp?id=<%=id %>&tablename=sheyuanxinxi" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="sheyuanxinxidetail.jsp?id=<%=id%>" target="_blank">��ϸ</a></td>
  </tr>
  	<%
  }
   %>
</table>
<%//yougongzitongji%>
<br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="sheyuanxinxi_list.jsp?page=1">��ҳ</a>��<a href="sheyuanxinxi_list.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="sheyuanxinxi_list.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="sheyuanxinxi_list.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>
