<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Web SQL</title>

<!-- Bootstrap Core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath()%>/resources/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/resources/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath()%>/resources/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0"> <jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../aside.jsp"></jsp:include> </nav>

		<form action="p_board.html" method="post">
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header" align="center">건의사항</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">글쓰기</div>



							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">

										<!-- 글제목  -->
										<div class="form-group">
											<label>글 제목</label> <input class="form-control"
												style="width: 300px;" name="board_p_title"> 
										</div>
										<!-- 글제목 End  -->

										<!-- 글내용  -->
										<div class="form-group">
											<label>글 내용</label>
											<textarea class="form-control" rows="3"
												name="board_p_content" style="height: 290px";></textarea>
										</div>
										<!-- 글내용End  -->


										<!-- 글쓰기 , 다시작성 Button  -->
										<div class="form-group">
											<input type="submit" class="layer"
												style="position: relative; left: 40%" value="글쓰기"> <input
												type="reset" class="layer"
												style="position: relative; left: 40%; width: 96px;"
												value="다시작성">
											<div style="font-size: 20px;">
												<a href="<%=request.getContextPath()%>/p_boardlist.html">
													글목록 </a>
											</div>
										</div>
										<!-- 글쓰기 , 다시작성 Button End  -->


										<!-- /.col-lg-12 (nested) -->
									</div>
									<!-- /.row (nested) -->
								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->


						</div>
						<!-- /.col-lg-12 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /#page-wrapper -->

			</div>
		</form>
		<!-- /#wrapper -->

	</div>
	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/sb-admin-2.js"></script>


</body>
</html>