<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
<title>������Ϣ</title><script language="javascript" src="js/Calendar.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
.STYLE1 {
	color: #FFFFFF;
	font-weight: bold;
}
.STYLE3 {color: #086BD6; font-weight: bold; }
.STYLE8 {color: #185838;
	font-weight: bold;
}
-->
</style>
</head>
  <%
String sql;
ResultSet RS_result;
%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1002" height="1176" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><%@ include file="qttop.jsp"%></td>
	</tr>
	<tr>
		<td><table id="__01" width="1002" height="830" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td rowspan="2" valign="top"><table id="__01" width="738" height="830" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td valign="top"><table id="__01" width="738" height="225" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="738" height="41" background="qtimages/1_02_01_02_01.gif"><table width="100%" height="18" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="24%" align="center" valign="bottom"><span class="STYLE3">������Ϣ</span></td>
                        <td width="64%" valign="bottom">&nbsp;</td>
                        <td width="12%" valign="bottom"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="738" height="174"><table id="__01" width="738" height="174" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="13" background="qtimages/1_02_01_02_02_01.gif">&nbsp;</td>
                        <td width="714" height="772" valign="top">
						
						
						
						
						
                          <form name="form1" id="form1" method="post" action="">
   ����
     <input name="shetuanmingcheng" type="text" id="shetuanmingcheng"  style='border:solid 1px #000000; color:#666666' size="12"  />
      ������
      <input name="fuzeren" type="text" id="fuzeren"  style='border:solid 1px #000000; color:#666666' size="12"  />  �������ڣ�<input name="chuangbanriqi1" type="text" id="chuangbanriqi1"  value='' onClick="getDate(form1.chuangbanriqi1,'2')" need="1" size="10" />-<input name="chuangbanriqi2" type="text" id="chuangbanriqi2"  value='' onClick="getDate(form1.chuangbanriqi2,'2')" need="1" size="10"  /> �ҿ���λ��<input name="guakaodanwei" type="text" id="guakaodanwei"  style='border:solid 1px #000000; color:#666666' size="12"  />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
                          </form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#007BCE" class="newsline" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��������</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>��ʼ��</td><td bgcolor='#CCFFFF'>������</td><td bgcolor='#CCFFFF' width='65' align='center'>��������</td><td bgcolor='#CCFFFF'>�ҿ���λ</td><td bgcolor='#CCFFFF'>����</td>
    <td width="30" align="center" bgcolor="CCFFFF">��ϸ</td>
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
  sql="select top "+page_record+" * from shetuanxinxi where id not in (select top "+((curpage-1)*page_record)+" id from shetuanxinxi order by id desc) ";
  
if(request.getParameter("shetuanmingcheng")=="" ||request.getParameter("shetuanmingcheng")==null ){}else{sql=sql+" and shetuanmingcheng like '%"+new String(request.getParameter("shetuanmingcheng").getBytes("8859_1"))+"%'";}
if(request.getParameter("fuzeren")=="" ||request.getParameter("fuzeren")==null ){}else{sql=sql+" and fuzeren like '%"+new String(request.getParameter("fuzeren").getBytes("8859_1"))+"%'";}
if (request.getParameter("chuangbanriqi1")==""  ||request.getParameter("chuangbanriqi1")==null ) {}else{sql=sql+" and chuangbanriqi >= '"+new String(request.getParameter("chuangbanriqi1").getBytes("8859_1"))+"'";}
if (request.getParameter("chuangbanriqi2")==""  ||request.getParameter("chuangbanriqi2")==null ) {}else {sql=sql+" and chuangbanriqi <= '"+new String(request.getParameter("chuangbanriqi2").getBytes("8859_1"))+"'";}
if(request.getParameter("guakaodanwei")=="" ||request.getParameter("guakaodanwei")==null ){}else{sql=sql+" and guakaodanwei like '%"+new String(request.getParameter("guakaodanwei").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc";
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
    <td width="30" align="center"> <a href="shetuanxinxidetail.jsp?id=<%=id%>" >��ϸ</a></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="shetuanxinxilist.jsp?page=1">��ҳ</a>��<a href="shetuanxinxilist.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="shetuanxinxilist.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="shetuanxinxilist.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
						
                         
						 
						 
						 
						 
						 </td>
                        <td width="11" background="qtimages/1_02_01_02_02_03.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_01_02_03.gif" width="738" height="10" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              
            </table></td>
            <td><img src="qtimages/1_02_02.gif" width="264" height="8" alt=""></td>
          </tr>
          <tr>
            <td valign="top"><%@ include file="qtleft.jsp"%></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td><%@ include file="qtdown.jsp"%></td>
	</tr>
</table>
</body>
</html>
