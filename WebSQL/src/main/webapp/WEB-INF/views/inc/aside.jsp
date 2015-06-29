<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="aside">
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu" style="text-align: center;">






				<li>


					<button type="button" class="btn btn-warning"
						onclick="location.href='mypage.html'">Mypage</button> <se:authorize
						ifNotGranted="ROLE_USER">
						<button type="button" class="btn btn-primary"
							onclick="location.href='login.html'"
							style="width: 73.22222042083743px;">Login</button>
						<h3>로그인하세요.</h3>
					</se:authorize> <se:authentication property="name" var="LoginUser" /> <se:authorize
						ifAnyGranted="ROLE_USER,ROLE_ADMIN">

						<button type="button" class="btn btn-primary"
							onclick="location.href='${pageContext.request.contextPath}/j_spring_security_logout'">Logout</button>
						<h3>${LoginUser }님환영합니다.</h3>


					</se:authorize>



					<button type="button" class="btn btn-success"
						style="width: 101.22222042083743px;"
						"
                  onclick="">TableList</button>
				</li>
				<!--사이드 bar Menu1End  -->


				<!-- 소개 DDL , DML Menu  -->
				<li><a href="#">
						<h4>소개</h4>
				</a>


					<ul class="nav nav-second-level">

					</ul> <!-- /.nav-second-level --></li>
				<!-- 소개 DDL , DML Menu END   -->

				<!-- DDL Menu  -->
				<li><a href="DDL.jsp">
						<h4>DDL</h4>
				</a></li>
				<!-- DDL Menu End  -->

				<!-- DML Menu  -->
				<li><a href="dml.html">
						<h4>
							DML
							<h4>
				</a></li>
				<!-- DML MenuEnd  -->


				<li><a href="boardlist.html">
						<h4>공지사항</h4>
				</a></li>
				
				<li><a href="p_boardlist.html">
						<h4>건의사항</h4>
				</a></li>

			</ul>
			<!-- /.nav-second-level -->




		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</div>
