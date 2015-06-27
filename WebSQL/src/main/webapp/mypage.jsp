<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="https://cde.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<title>Web SQL</title>

</head>
<body>
	<div class="container">
		<div align="center" class="body">
			<h2>마이페이지</h2>
			<table>
				<tr height="40px">
					<td>아이디</td>
					<se:authentication property="name" var="LoginUser" />
					<td><input type="text" id="user_id" value="${LoginUser }"
						readonly="readonly"></td>
				</tr>
				<tr height="40px">
					<td>패스워드</td>
					<td><input type="password" id="user_pwd"></td>
				</tr>
				<tr height="40px">
					<td>패스워드 확인</td>
					<td><input type="password" id="user_pwd2"></td>
				</tr>

				<tr height="40px">
					<td>이메일</td>
					<td><input type="text" id="user_email" readonly="readonly"
						value="">
						<button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">이메일 인증</button></td>
				</tr>
				<tr height="40px">
					<td>이름</td>
					<td><input type="text" id="user_name" readonly="readonly"
						value=${member.user_name }></td>
				</tr>

			</table>
			<table>
				<tr>
					<td height="40px" align="center"><input type="submit"
						name="btnSubmit" value="수정"></td>
					<td height="40px" align="center"><input type="reset"
						name="btnReset" value="리셋"></td>
				</tr>
			</table>
		</div>

		<!-- MODAL START -->

		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">



				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">이메일 인증</h4>
					</div>
					<form action="Mailsave.html" method="post"
						enctype="multipart/form-data" name="emailform"
						accept-charset="utf-8">
						<div class="modal-body" id="modalbody">
							<p>인증할 이메일 주소를 입력해주세요.</p>
							<br> <input type="hidden" id="idhidden" name="idhidden"
								value=""> <input type="hidden" id="pwdhidden1"
								name="pwdhidden" value=""> <input type="hidden"
								id="emailhidden" name="emailhidden" value=""> <input
								type="hidden" id="namehidden" name="namehidden" value="">
							<input type="hidden" id="enabledhidden" name="enabledhidden"
								value=""> <input type="hidden" id="pwdhidden2"
								name="pwdhidden2" value=""> <input type="text"
								id="modalemail" name="modalemail">
							<button type="button" id="modalbtn" name="modalbtn">인증코드
								전송</button>
							<input type="hidden" value="0" id="hiddencode" name="hiddencode">
							<div id="modalbodydetail"></div>
						</div>
					</form>
					<div class="modal-footer" id="modal-footer" name="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>

