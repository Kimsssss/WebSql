<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center" class="body">
<h2>���� ��� �Ϸ� ȭ��</h2>
<b><font color="red">���� ����� �Ϸ�Ǿ����ϴ�.</font></b><br>
<table>
   <tr height="40px">
      <td>����ID</td>
      <td>${member.user_id}</td>
   </tr>
   <tr height="40px">
      <td>�н�����</td>
      <td>${member.user_pwd}</td>
   </tr>
   <tr height="40px">
      <td>����</td>
      <td>${member.user_email}</td>
   </tr>
   <tr height="40px">
      <td>�̸�</td>
      <td>${member.user_name}</td>
   </tr>
   <tr height="40px">
      <td>Ȱ��</td>
      <td>${member.enabled}</td>
   </tr>
</table>
</div>
</body>
</html>