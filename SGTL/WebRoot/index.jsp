<%@ page language="java" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
    <title> ѧ�����Ź���ϵͳ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <LINK href="qtimages/style.css" type=text/css rel=stylesheet>
    <style type="text/css">
        <!--
        .STYLE1 {
            color: #FFFFFF;
            font-weight: bold;
        }

        .STYLE3 {
            color: #086BD6;
            font-weight: bold;
        }

        -->
    </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1002" height="830" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
    <tr>
        <td>
            <%@ include file="qttop.jsp" %>
        </td>
    </tr>
    <tr>
        <td>
            <table id="__01" width="1002" height="830" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td rowspan="2" valign="top">
                        <table id="__01" width="738" height="830" border="0" cellpadding="0" cellspacing="0">

                                <td>
                                    <table id="__01" width="738" height="225" border="0" cellpadding="0"
                                           cellspacing="0">
                                        <tr>
                                            <td width="738" height="41" background="qtimages/1_02_01_02_01.gif">
                                                <table width="100%" height="18" border="0" cellpadding="0"
                                                       cellspacing="0">
                                                    <tr>
                                                        <td width="24%" align="center" valign="bottom"><span
                                                                class="STYLE3">��Ա���</span></td>
                                                        <td width="64%" valign="bottom">&nbsp;</td>
                                                        <td width="12%" valign="bottom"><a
                                                                href="sheyuanxinxilist.jsp"><font class="STYLE3">����&gt;&gt;</font></a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="738" height="174">
                                                <table id="__01" width="738" height="174" border="0" cellpadding="0"
                                                       cellspacing="0">
                                                    <tr>
                                                        <td width="13" background="qtimages/1_02_01_02_02_01.gif">
                                                            &nbsp;
                                                        </td>
                                                        <td width="714" height="100%">
                                                            <table width="100%" height="100%" border="0" align="center"
                                                                   cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <%
                                                                        String id = "";
                                                                        int i = 0;
                                                                        String sql = "select top 4 id,zhaopian,xingming from sheyuanxinxi where zhaopian<>'' order by id desc";
                                                                        ResultSet RS_result = connDbBean.executeQuery(sql);
                                                                        String xingming = "";
                                                                        String touxiang = "";
                                                                        String addtime = "";
                                                                        while (RS_result.next()) {
                                                                            id = RS_result.getString("id");
                                                                            xingming = RS_result.getString("xingming");
                                                                            touxiang = RS_result.getString("zhaopian");


                                                                    %>
                                                                    <td align="center">
                                                                        <table width="150" height="161" border="0"
                                                                               cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td height="134" align="center"><a
                                                                                        href="sheyuanxinxidetail.jsp?id=<%=id%>"><img
                                                                                        src="<%=touxiang%>" width="129"
                                                                                        height="134" border="0"/></a>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="26"
                                                                                    align="center"><%=xingming%>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <%
                                                                        }

                                                                    %>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="11" background="qtimages/1_02_01_02_02_03.gif">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><img src="qtimages/1_02_01_02_03.gif" width="738" height="10" alt="">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="__01" width="738" height="225" border="0" cellpadding="0"
                                           cellspacing="0">
                                        <tr>
                                            <td width="738" height="41" background="qtimages/1_02_01_02_01.gif">
                                                <table width="100%" height="18" border="0" cellpadding="0"
                                                       cellspacing="0">
                                                    <tr>
                                                        <td width="24%" align="center" valign="bottom"><span
                                                                class="STYLE3">������Ϣ</span></td>
                                                        <td width="64%" valign="bottom">&nbsp;</td>
                                                        <td width="12%" valign="bottom"><a
                                                                href="shetuanxinxilist.jsp"><font class="STYLE3">����&gt;&gt;</font></a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="738" height="174">
                                                <table id="__01" width="738" height="174" border="0" cellpadding="0"
                                                       cellspacing="0">
                                                    <tr>
                                                        <td width="13" background="qtimages/1_02_01_02_02_01.gif">
                                                            &nbsp;
                                                        </td>
                                                        <td width="714" height="100%" valign="top">
                                                            <table width="100%" border="1" align="center"
                                                                   cellpadding="3" cellspacing="1" bordercolor="#007BCE"
                                                                   class="newsline" style="border-collapse:collapse">
                                                                <tr>
                                                                    <td width="30" align="center" bgcolor="CCFFFF">���
                                                                    </td>
                                                                    <td bgcolor='#CCFFFF'>��������</td>
                                                                    <td bgcolor='#CCFFFF'>����</td>
                                                                    <td bgcolor='#CCFFFF'>��ʼ��</td>
                                                                    <td bgcolor='#CCFFFF'>������</td>
                                                                    <td bgcolor='#CCFFFF' width='65' align='center'>
                                                                        ��������
                                                                    </td>
                                                                    <td bgcolor='#CCFFFF'>�ҿ���λ</td>
                                                                    <td bgcolor='#CCFFFF'>����</td>
                                                                    <td width="30" align="center" bgcolor="CCFFFF">��ϸ
                                                                    </td>
                                                                </tr>
                                                                <%
                                                                    sql = "select top 6 * from shetuanxinxi ";

                                                                    sql = sql + " order by id desc";
                                                                    RS_result = connDbBean.executeQuery(sql);
                                                                    id = "";
                                                                    String shetuanmingcheng = "";
                                                                    String jianjie = "";
                                                                    String xingzhi = "";
                                                                    String chuangshiren = "";
                                                                    String fuzeren = "";
                                                                    String chuangbanriqi = "";
                                                                    String guakaodanwei = "";
                                                                    String renshu = "";
                                                                    addtime = "";
                                                                    i = 0;
                                                                    while (RS_result.next()) {
                                                                        i = i + 1;
                                                                        id = RS_result.getString("id");
                                                                        shetuanmingcheng = RS_result.getString("shetuanmingcheng");
                                                                        jianjie = RS_result.getString("jianjie");
                                                                        xingzhi = RS_result.getString("xingzhi");
                                                                        chuangshiren = RS_result.getString("chuangshiren");
                                                                        fuzeren = RS_result.getString("fuzeren");
                                                                        chuangbanriqi = RS_result.getString("chuangbanriqi");
                                                                        guakaodanwei = RS_result.getString("guakaodanwei");
                                                                        renshu = RS_result.getString("renshu");
                                                                        addtime = RS_result.getString("addtime");
                                                                %>
                                                                <tr>
                                                                    <td width="30" align="center"><%=i %>
                                                                    </td>
                                                                    <td><%=shetuanmingcheng %>
                                                                    </td>
                                                                    <td><%=xingzhi %>
                                                                    </td>
                                                                    <td><%=chuangshiren %>
                                                                    </td>
                                                                    <td><%=fuzeren %>
                                                                    </td>
                                                                    <td><%=chuangbanriqi %>
                                                                    </td>
                                                                    <td><%=guakaodanwei %>
                                                                    </td>
                                                                    <td><%=renshu %>
                                                                    </td>
                                                                    <td width="30" align="center"><a
                                                                            href="shetuanxinxidetail.jsp?id=<%=id%>">��ϸ</a>
                                                                    </td>
                                                                </tr>
                                                                <%
                                                                    }
                                                                %>
                                                            </table>
                                                        </td>
                                                        <td width="11" background="qtimages/1_02_01_02_02_03.gif">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><img src="qtimages/1_02_01_02_03.gif" width="738" height="10" alt="">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td><img src="qtimages/1_02_02.gif" width="264" height="8" alt=""></td>
                </tr>
                <tr>
                    <td valign="top">
                        <%@ include file="qtleft.jsp" %>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <%@ include file="qtdown.jsp" %>
        </td>
    </tr>
</table>
</body>
</html>