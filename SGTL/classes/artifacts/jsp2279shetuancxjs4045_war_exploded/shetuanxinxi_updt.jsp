
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
    
    <title>������Ϣ</title><script language="javascript" src="js/Calendar.js"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	    <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","�ļ��ϴ�");
            pop.build();
            pop.show();
	    }
	</script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">
function check()
{
	if(document.form1.shetuanmingcheng.value==""){alert("��������������");document.form1.shetuanmingcheng.focus();return false;}if(document.form1.guakaodanwei.value==""){alert("������ҿ���λ");document.form1.guakaodanwei.focus();return false;}if((/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(document.form1.renshu.value))){}else{alert("��������������");document.form1.renshu.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="shetuanxinxi_updt_post.jsp?id=<%=id %>">
  �޸�������Ϣ:
  <br><br>
  <%
  String sql="select * from shetuanxinxi where id="+id;
  String shetuanmingcheng="";String jianjie="";String xingzhi="";String chuangshiren="";String fuzeren="";String chuangbanriqi="";String guakaodanwei="";String renshu="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  shetuanmingcheng=RS_result.getString("shetuanmingcheng");jianjie=RS_result.getString("jianjie");xingzhi=RS_result.getString("xingzhi");chuangshiren=RS_result.getString("chuangshiren");fuzeren=RS_result.getString("fuzeren");chuangbanriqi=RS_result.getString("chuangbanriqi");guakaodanwei=RS_result.getString("guakaodanwei");renshu=RS_result.getString("renshu");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>�������ƣ�</td><td><input name='shetuanmingcheng' type='text' id='shetuanmingcheng' size='50' value='<%=shetuanmingcheng%>' style='border:solid 1px #000000; color:#666666'/></td></tr><tr><td>��飺</td><td><textarea name="jianjie" style="display:none"><%=jianjie%></textarea><iframe ID="eWebEditor1" src="eWebEditor_V4.60/ewebeditor.htm?id=jianjie&style=coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="350"></iframe></td></tr><tr><td>���ʣ�</td><td><input name='xingzhi' type='text' id='xingzhi' value='<%= xingzhi%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>��ʼ�ˣ�</td><td><input name='chuangshiren' type='text' id='chuangshiren' value='<%= chuangshiren%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>�����ˣ�</td><td><input name='fuzeren' type='text' id='fuzeren' value='<%= fuzeren%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>�������ڣ�</td><td><input name='chuangbanriqi' type='text' id='chuangbanriqi' value='<%= chuangbanriqi%>' onclick="getDate(form1.chuangbanriqi,'2')" need="1" readonly='readonly'  /></td></tr><tr><td>�ҿ���λ��</td><td><input name='guakaodanwei' type='text' id='guakaodanwei' size='50' value='<%=guakaodanwei%>' style='border:solid 1px #000000; color:#666666'/></td></tr><tr><td>������</td><td><input name='renshu' type='text' id='renshu' value='<%= renshu%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onclick="return check();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


