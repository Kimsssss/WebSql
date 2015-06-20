<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link
	href="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath() %>/resources/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="<%=request.getContextPath() %>/resources/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath() %>/resources/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>




	<div class="row" style="padding-top: 100px; padding-left: 200px">
		<div class="col-lg-12" style="float: right">
			<div class="panel panel-default">
				<div class="panel-body" style="height: 530px;">
					<a class="btn btn-info btnposition" href="boardlist.html"
						style="float: right;">글목록</a>
					<h3 style="text-align: center;">글 상세 보기</h3>



					<div class="table-responsive">
						<table class="table table-bordered table-striped">

							<tbody>
								<tr>

									<th style="width: 128px;">작성자</th>


									<td>${a_notice.user_id}</td>
								</tr>


								<tr>
									<th>제목</th>
									<td colspan="4">${a_notice.board_a_title}</td>
								</tr>

								<tr>
									<th>작성날짜</th>
									<td colspan="4">${a_notice.board_a_date}</td>
								</tr>

								<tr>
									<td colspan="4" style="height: 150px">${a_notice.board_a_content}
								</tr>


							</tbody>
						</table>

						<p>
							<se:authorize ifAllGranted="ROLE_ADMIN">
								<a class="btn btn-info btnposition" style="float: right"
							href="boardDelete.html?board_a_id=${a_notice.board_a_id}">삭제</a>
						<a class="btn btn-info btnposition" style="float: right"
							href="boardE.html?board_a_id=${a_notice.board_a_id}">게시글 수정</a>
							</se:authorize>

						</p>
						

					</div>




				</div>
			</div>


		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->


	<!-- jQuery -->
	<script
		src="<%=request.getContextPath() %>/resources/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="<%=request.getContextPath() %>/resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="<%=request.getContextPath() %>/resources/dist/js/sb-admin-2.js"></script>




</body>
</html>