<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Web SQL</title>

<!-- Bootstrap Core CSS -->
<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../bower_components/font-awesome/css/font-awesome.min.css"
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
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0"> <jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../aside.jsp"></jsp:include> </nav>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">JOIN_US</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">JOIN_US</div>
						<div class="panel-body">
							<div class="form">
								<form class="form-validate form-horizontal" id="feedback_form"
									method="get" action="" novalidate="novalidate">
									<div class="form-group ">
										<label for="cname" class="control-label col-lg-2">ID<span
											class="required">*</span></label>
										<div class="col-lg-10">
											<input class="form-control" id="cname" name="fullname"
												minlength="5" type="text" required="">
										</div>
									</div>
									<div class="form-group ">
										<label for="cname" class="control-label col-lg-2">PWD<span
											class="required">*</span></label>
										<div class="col-lg-10">
											<input class="form-control " id="cpwd" type="password"
												name="pwd">
										</div>
									</div>
									<div class="form-group ">
										<label for="cname" class="control-label col-lg-2">PWD
											CHECK<span class="required">*</span>
										</label>
										<div class="col-lg-10">
											<input class="form-control " id="cpwd_chk" type="password"
												name="pwd_chk">
										</div>
									</div>
									<div class="form-group ">
										<label for="cemail" class="control-label col-lg-2">E-Mail<span
											class="required">*</span></label>
										<div class="col-lg-10">
											<input class="form-control " id="cemail" type="email"
												name="email" required="">
										</div>
									</div>
									<div class="form-group ">
										<label for="cname" class="control-label col-lg-2">NICKNAME<span
											class="required">*</span></label>
										<div class="col-lg-10">
											<input class="form-control" id="nickname" name="nickname"
												minlength="5" type="text" required="">
										</div>
									</div>
									<div align="center">
										<button type="submit" class="btn btn-default">Submit</button>
										<button type="reset" class="btn btn-default">Reset</button>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
