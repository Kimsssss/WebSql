<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="main">
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
</div>