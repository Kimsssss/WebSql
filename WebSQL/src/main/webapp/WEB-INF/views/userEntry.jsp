<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center" class="body">
<h2>유저 등록 화면</h2>
<form:form modelAttribute="member" method="post" action="User.html">
	<spring:hasBindErrors name="member">
		<font color="red"><c:forEach items="${errors.globalErrors}"
			var="error">
			<spring:message code="${error.code}" />
		</c:forEach> </font>
	</spring:hasBindErrors>
	<table>
		<tr height="40px">
			<td>유저ID</td>
			<td><form:input path="user_id" maxlength="20"/><font
				color="red"><form:errors path="user_id" /></font></td>
		</tr>
		<tr height="40px">
			<td>패스워드</td>
			<td><form:password path="user_pwd" maxlength="20"/><font
				color="red"><form:errors path="user_pwd" /></font></td>
		</tr>
		<tr height="40px">
			<td>이메일</td>
			<td><form:input path="user_email" maxlength="20"/><font
				color="red"><form:errors path="user_email" /></font></td>
		</tr>
		<tr height="40px">
			<td>이름</td>
			<td><form:input path="user_name" maxlength="8"/><font
				color="red"><form:errors path="user_name" /></font></td>
		</tr>
		<tr height="40px">
			<td>활성</td>
			<td><form:input path="enabled" maxlength="50"/></td>
		</tr>
		
	</table>
	<table>
		<tr>
			<td height="40px" align="center"><input type="submit"
				name="btnSubmit" value="등록"></td>
			<td height="40px" align="center"><input type="reset"
				name="btnReset" value="리셋"></td>
		</tr>
	</table>
</form:form></div>
<%-- <form action="User.html" method="post">
		아이디: 	<input type="text" name="userid"><br>
		비번: 	<input type="text" name="userpwd"><br>
		이메일: 	<input type="text" name="useremail"><br>
		이름:		<input type="text" name="username"><br>
		활성: 	<input type="text" name="enabled"><br>
		<input type="submit" value="회원등록">
</form> --%>
</body>
</html>