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
    <title>����</title><LINK href="css.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>���м����б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;&nbsp;���ţ�<input name="huodongbianhao" type="text" id="huodongbianhao" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;����ƣ�<input name="huodongmingcheng" type="text" id="huodongmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;���ţ�<input name="shetuan" type="text" id="shetuan" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;�����ˣ�<input name="jiaruren" type="text" id="jiaruren" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>�����</td><td bgcolor='#CCFFFF'>�����</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>������</td><td bgcolor='#CCFFFF'>��ע</td>
    <td width='80' align='center' bgcolor='#CCFFFF'>�Ƿ����</td>
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
				String fysql="select count(id) as ss from jiaruhuodong where shetuan='"+request.getSession().getAttribute("st")+"'";
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
  sql="select top "+page_record+" * from jiaruhuodong where shetuan='"+request.getSession().getAttribute("st")+"' and id not in (select top "+((curpage-1)*page_record)+" id from jiaruhuodong where shetuan='"+request.getSession().getAttribute("st")+"' order by id desc) ";
  
if(request.getParameter("huodongbianhao")=="" ||request.getParameter("huodongbianhao")==null ){}else{sql=sql+" and huodongbianhao like '%"+new String(request.getParameter("huodongbianhao").getBytes("8859_1"))+"%'";}
if(request.getParameter("huodongmingcheng")=="" ||request.getParameter("huodongmingcheng")==null ){}else{sql=sql+" and huodongmingcheng like '%"+new String(request.getParameter("huodongmingcheng").getBytes("8859_1"))+"%'";}
if(request.getParameter("shetuan")=="" ||request.getParameter("shetuan")==null ){}else{sql=sql+" and shetuan like '%"+new String(request.getParameter("shetuan").getBytes("8859_1"))+"%'";}
if(request.getParameter("jiaruren")=="" ||request.getParameter("jiaruren")==null ){}else{sql=sql+" and jiaruren like '%"+new String(request.getParameter("jiaruren").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc";
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
    <td><%=huodongbianhao %></td><td><%=huodongmingcheng %></td><td><%=huodongriqi %></td><td><%=shetuan %></td><td><%=jiaruren %></td><td><%=beizhu %></td>
    <td width='80' align='center'><a href="sh.jsp?id=<%=id%>&yuan=<%=issh%>&tablename=jiaruhuodong" onClick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=issh%></a></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="60" align="center"><a href="jiaruhuodong_updt.jsp?id=<%=id%>">�޸�</a>  <a href="del.jsp?id=<%=id %>&tablename=jiaruhuodong" onClick="return confirm('���Ҫɾ����')">ɾ��</a></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="jiaruhuodong_list3.jsp?page=1">��ҳ</a>��<a href="jiaruhuodong_list3.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="jiaruhuodong_list3.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="jiaruhuodong_list3.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>

