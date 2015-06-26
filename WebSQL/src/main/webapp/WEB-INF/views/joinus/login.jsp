<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="main">
	<div class="page-wrapper">
	
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<c:if test="${param.error != null}">
							<div>
								로그인실패<br>
								<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
				 	이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
								</c:if>
							</div>
						</c:if>
						<c:url value="/j_spring_security_check" var="loginURL"></c:url>
						<form name="f" action="${loginURL}" method="post">
							<fieldset>
								<div class="form-group">
									<label for="uid">ID</label> <input class="form-control"
										placeholder="ID" name="j_username" type="text" autofocus>
								</div>
								<div class="form-group">
									<label for="pwd">PWD</label> <input class="form-control"
										placeholder="Password" name="j_password" type="password"
										value="">
								</div>

								<div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="Remember Me">Remember Me
									</label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" value="로그인" />
								<!-- <a href="index.html" class="btn btn-lg btn-success btn-block">Login</a> -->
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
