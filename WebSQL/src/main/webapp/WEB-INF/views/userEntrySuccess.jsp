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
				<h2 align="left" class="page-header">&nbsp;&nbsp;&nbsp;&nbsp;���� ��� �Ϸ� ȭ��</h2>
			</div>
		</div>
		<font color="red"><h4><b>&nbsp;&nbsp;&nbsp;&nbsp;���� ����� �Ϸ�Ǿ����ϴ�.</b></h4></font><br>
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
									<td><b>����ID</b></td>
									<td>${member.user_id}</td>				
								</tr>
								<tr height="40px">
									<td><b>�н�����</b></td>
									<td>${member.user_pwd}</td>
								</tr>
								<tr height="40px">
									<td><b>����</b></td>
									<td>${member.user_email}</td>
								</tr>
								<tr height="40px">
									<td><b>�̸�</b></td>
									<td>${member.user_name}</td>
								</tr>
								<tr height="40px">
									<td><b>Ȱ��</b></td>
									<td>${member.enabled}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>











				<%-- <table>
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
				</table> --%>
			</div>
		</div>
	</div>
</body>
</html>