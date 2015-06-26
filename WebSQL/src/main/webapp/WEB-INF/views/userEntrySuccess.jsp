<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div id="page-wrapper" align="left" class="body">

		<div class="row">
			<div class="body">
				<h2 align="left" class="page-header">&nbsp;&nbsp;&nbsp;&nbsp;유저 등록 완료 화면</h2>
			</div>
		</div>
		<font color="red"><h4><b>&nbsp;&nbsp;&nbsp;&nbsp;유저 등록이 완료되었습니다.</b></h4></font><br>
		<div class="row">
			<div class="col-lg-12">

				<div class="panel-body" style="
    				padding-right: 400px;
    				padding-left: 0px;
						">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr height="40px">
									<td><b>유저ID</b></td>
									<td>${member.user_id}</td>				
								</tr>
								<tr height="40px">
									<td><b>패스워드</b></td>
									<td>${member.user_pwd}</td>
								</tr>
								<tr height="40px">
									<td><b>메일</b></td>
									<td>${member.user_email}</td>
								</tr>
								<tr height="40px">
									<td><b>이름</b></td>
									<td>${member.user_name}</td>
								</tr>
								<tr height="40px">
									<td><b>활성</b></td>
									<td>${member.enabled}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>











				<%-- <table>
					<tr height="40px">
						<td>유저ID</td>
						<td>${member.user_id}</td>
					</tr>
					<tr height="40px">
						<td>패스워드</td>
						<td>${member.user_pwd}</td>
					</tr>
					<tr height="40px">
						<td>메일</td>
						<td>${member.user_email}</td>
					</tr>
					<tr height="40px">
						<td>이름</td>
						<td>${member.user_name}</td>
					</tr>
					<tr height="40px">
						<td>활성</td>
						<td>${member.enabled}</td>
					</tr>
				</table> --%>
			</div>
		</div>
	</div>
</body>
</html>