<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/EXPRESS.asp" -->
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
If (Request.Form("sousuo") <> "") Then 
  Recordset1__MMColParam = Request.Form("sousuo")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_EXPRESS_STRING
Recordset1_cmd.CommandText = "SELECT * FROM dbo.st_1 WHERE Seno = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 5, 1, -1, Recordset1__MMColParam) ' adDouble

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>

<body>
<table width="1100" border="1">
  <tr>
    <td bgcolor="#66FFFF">��ݵ���</td>
    <td>�˿�����</td>
    <td>��Ʒ����</td>
    <td>�̼�����</td>
    <td>�̼ҵ绰</td>
    <td>�̼ҵ�ַ</td>
    <td>���Ա����</td>
    <td>���Ա�绰</td>
    <td>��Ʒ����</td>
    <td>����ʱ��</td>
    <td>����ʱ��</td>
  </tr>
  <tr>
  <tr>
    <td><%=(Recordset1.Fields.Item("Seno").Value)%></td>
    <td><%=(Recordset1.Fields.Item("Cname").Value)%></td>
    <td><%=(Recordset1.Fields.Item("Gname").Value)%></td>
    <td><%=(Recordset1.Fields.Item("Bname").Value)%></td>
    <td><%=(Recordset1.Fields.Item("Btel").Value)%></td>
    <td><%=(Recordset1.Fields.Item("Badds").Value)%></td>
    <td><%=(Recordset1.Fields.Item("Sname").Value)%></td>
    <td><%=(Recordset1.Fields.Item("Stel").Value)%></td>
    <td><%=(Recordset1.Fields.Item("setype").Value)%></td>
    <td><%=(Recordset1.Fields.Item("sitime").Value)%></td>
    <td><%=(Recordset1.Fields.Item("sotime").Value)%></td>
  </tr>
</table>
<form id="form1" name="form1" method="post" action="">
  <div align="center"><a href="��ѯ1.asp">������ѯ</a> <a href="ѡ��ҳ��.asp">�˳���ѯ</a></div>
</form>
<p>&nbsp;</p>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
