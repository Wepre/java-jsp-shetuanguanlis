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
    <title>�����¼</title><LINK href="css.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>���в����¼�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;&nbsp;�������ƣ�<input name="shetuanmingcheng" type="text" id="shetuanmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  ��֧��
   <select name='shouzhi' id='shouzhi'>
     <option value="">����</option>
     <option value="����">����</option>
     <option value="֧��">֧��</option>
   </select>
   &nbsp;&nbsp;�����ˣ�
   <input name="jingshouren" type="text" id="jingshouren" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;��Ŀ���ƣ�<input name="xiangmumingcheng" type="text" id="xiangmumingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  ���ڣ�<input name="riqi1" type="text" id="riqi1"  value='' onClick="getDate(form1.riqi1,'2')" need="1" size="10" />-<input name="riqi2" type="text" id="riqi2"  value='' onClick="getDate(form1.riqi2,'2')" need="1" size="10"  />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='caiwujilu_listxls.jsp';" />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��������</td><td bgcolor='#CCFFFF'>���</td><td bgcolor='#CCFFFF'>��֧</td><td bgcolor='#CCFFFF'>������</td><td bgcolor='#CCFFFF'>��Ŀ����</td><td bgcolor='#CCFFFF' width='65' align='center'>����</td>
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
				String fysql="select count(id) as ss from caiwujilu";
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
  sql="select top 10 * from caiwujilu where 1=1";
}
else
{
  sql="select top "+page_record+" * from caiwujilu where id not in (select top "+((curpage-1)*page_record)+" id from caiwujilu order by id desc) ";
}
  
  
if(request.getParameter("shetuanmingcheng")=="" ||request.getParameter("shetuanmingcheng")==null ){}else{sql=sql+" and shetuanmingcheng like '%"+new String(request.getParameter("shetuanmingcheng").getBytes("8859_1"))+"%'";}
if(request.getParameter("shouzhi")=="" ||request.getParameter("shouzhi")==null ){}else{sql=sql+" and shouzhi like '%"+new String(request.getParameter("shouzhi").getBytes("8859_1"))+"%'";}
if(request.getParameter("jingshouren")=="" ||request.getParameter("jingshouren")==null ){}else{sql=sql+" and jingshouren like '%"+new String(request.getParameter("jingshouren").getBytes("8859_1"))+"%'";}
if(request.getParameter("xiangmumingcheng")=="" ||request.getParameter("xiangmumingcheng")==null ){}else{sql=sql+" and xiangmumingcheng like '%"+new String(request.getParameter("xiangmumingcheng").getBytes("8859_1"))+"%'";}
if (request.getParameter("riqi1")==""  ||request.getParameter("riqi1")==null ) {}else{sql=sql+" and riqi >= '"+new String(request.getParameter("riqi1").getBytes("8859_1"))+"'";}
if (request.getParameter("riqi2")==""  ||request.getParameter("riqi2")==null ) {}else {sql=sql+" and riqi <= '"+new String(request.getParameter("riqi2").getBytes("8859_1"))+"'";}
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String shetuanmingcheng="";String jine="";String shouzhi="";String jingshouren="";String xiangmumingcheng="";String riqi="";String beizhu="";
 String addtime="";
 int i=0;
  double jinez=0;
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
shetuanmingcheng=RS_result.getString("shetuanmingcheng");jine=RS_result.getString("jine");shouzhi=RS_result.getString("shouzhi");jingshouren=RS_result.getString("jingshouren");xiangmumingcheng=RS_result.getString("xiangmumingcheng");riqi=RS_result.getString("riqi");beizhu=RS_result.getString("beizhu");
 addtime=RS_result.getString("addtime");
 jinez=jinez+Float.valueOf(jine).floatValue();

%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=shetuanmingcheng %></td><td><%=jine %></td><td><%=shouzhi %></td><td><%=jingshouren %></td><td><%=xiangmumingcheng %></td><td><%=riqi %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="90" align="center"><a href="caiwujilu_updt.jsp?id=<%=id%>">�޸�</a>  <a href="del.jsp?id=<%=id %>&tablename=caiwujilu" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="caiwujilu_detail.jsp?id=<%=id%>">��ϸ</a></td>
  </tr>
  	<%
  }
   %>
</table>
<p>����ͳ�ƣ����ƽ��:<%=jinez%>��</p>
<br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="caiwujilu_list.jsp?page=1">��ҳ</a>��<a href="caiwujilu_list.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="caiwujilu_list.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="caiwujilu_list.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>
