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
    <title>���Ϣ</title><LINK href="css.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>���л��Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;&nbsp;���ţ�<input name="huodongbianhao" type="text" id="huodongbianhao" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;����ƣ�<input name="huodongmingcheng" type="text" id="huodongmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;����⣺<input name="huodongzhuti" type="text" id="huodongzhuti" style='border:solid 1px #000000; color:#666666' size="12" />  ����ڣ�<input name="huodongriqi1" type="text" id="huodongriqi1"  value='' onClick="getDate(form1.huodongriqi1,'2')" need="1" size="10" />-<input name="huodongriqi2" type="text" id="huodongriqi2"  value='' onClick="getDate(form1.huodongriqi2,'2')" need="1" size="10"  />&nbsp;&nbsp;���ţ�<input name="shetuan" type="text" id="shetuan" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>�����</td><td bgcolor='#CCFFFF'>�����</td><td bgcolor='#CCFFFF'>������</td><td bgcolor='#CCFFFF'>���쵥λ</td><td bgcolor='#CCFFFF'>�а쵥λ</td><td bgcolor='#CCFFFF'>�����</td><td bgcolor='#CCFFFF'>��Ʒ����</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>��ע</td>
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
				String fysql="select count(id) as ss from huodongxinxi where shetuan='"+request.getSession().getAttribute("st")+"'";
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
  sql="select top "+page_record+" * from huodongxinxi where shetuan='"+request.getSession().getAttribute("st")+"' and id not in (select top "+((curpage-1)*page_record)+" id from huodongxinxi where shetuan='"+request.getSession().getAttribute("st")+"' order by id desc) ";
  
if(request.getParameter("huodongbianhao")=="" ||request.getParameter("huodongbianhao")==null ){}else{sql=sql+" and huodongbianhao like '%"+new String(request.getParameter("huodongbianhao").getBytes("8859_1"))+"%'";}
if(request.getParameter("huodongmingcheng")=="" ||request.getParameter("huodongmingcheng")==null ){}else{sql=sql+" and huodongmingcheng like '%"+new String(request.getParameter("huodongmingcheng").getBytes("8859_1"))+"%'";}
if(request.getParameter("huodongzhuti")=="" ||request.getParameter("huodongzhuti")==null ){}else{sql=sql+" and huodongzhuti like '%"+new String(request.getParameter("huodongzhuti").getBytes("8859_1"))+"%'";}
if (request.getParameter("huodongriqi1")==""  ||request.getParameter("huodongriqi1")==null ) {}else{sql=sql+" and huodongriqi >= '"+new String(request.getParameter("huodongriqi1").getBytes("8859_1"))+"'";}
if (request.getParameter("huodongriqi2")==""  ||request.getParameter("huodongriqi2")==null ) {}else {sql=sql+" and huodongriqi <= '"+new String(request.getParameter("huodongriqi2").getBytes("8859_1"))+"'";}
if(request.getParameter("shetuan")=="" ||request.getParameter("shetuan")==null ){}else{sql=sql+" and shetuan like '%"+new String(request.getParameter("shetuan").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String huodongbianhao="";String huodongmingcheng="";String huodongzhuti="";String fuzeren="";String zhubandanwei="";String chengbandanwei="";String huodongriqi="";String wupinjieyong="";String shetuan="";String beizhu="";
 String addtime="";
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
huodongbianhao=RS_result.getString("huodongbianhao");huodongmingcheng=RS_result.getString("huodongmingcheng");huodongzhuti=RS_result.getString("huodongzhuti");fuzeren=RS_result.getString("fuzeren");zhubandanwei=RS_result.getString("zhubandanwei");chengbandanwei=RS_result.getString("chengbandanwei");huodongriqi=RS_result.getString("huodongriqi");wupinjieyong=RS_result.getString("wupinjieyong");shetuan=RS_result.getString("shetuan");beizhu=RS_result.getString("beizhu");
 addtime=RS_result.getString("addtime");
 
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=huodongbianhao %></td><td><%=huodongmingcheng %></td><td><%=huodongzhuti %></td><td><%=fuzeren %></td><td><%=zhubandanwei %></td><td><%=chengbandanwei %></td><td><%=huodongriqi %></td><td><%=wupinjieyong %></td><td><%=shetuan %></td><td><%=beizhu %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="90" align="center"><a href="huodongxinxi_updt.jsp?id=<%=id%>">�޸�</a>  <a href="del.jsp?id=<%=id %>&tablename=huodongxinxi" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="huodongxinxidetail.jsp?id=<%=id%>" target="_blank">��ϸ</a></td>
  </tr>
  	<%
  }
   %>
</table><br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="huodongxinxi_list2.jsp?page=1">��ҳ</a>��<a href="huodongxinxi_list2.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="huodongxinxi_list2.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="huodongxinxi_list2.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>

  </body>
</html>

