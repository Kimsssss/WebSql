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

               <button type="button" class="btn btn-warning" onclick="location.href='mypage.html'">Mypage</button>
               <se:authorize ifNotGranted="ROLE_USER">
                  <button type="button" class="btn btn-primary"
                     onclick="location.href='login.html'">Login</button>
                  <h3>로그인하세요.</h3>
               </se:authorize> <se:authentication property="name" var="LoginUser" /> <se:authorize
                  ifAnyGranted="ROLE_USER,ROLE_ADMIN">

                  <button type="button" class="btn btn-primary"
                     onclick="location.href='${pageContext.request.contextPath}/j_spring_security_logout'">Logout</button>
                  <h3>${LoginUser }님환영합니다.</h3>

               </se:authorize>



               <button type="button" class="btn btn-success" style="width: 140px"
                  onclick="">TableList</button>
            </li>
            <!--사이드 bar Menu1End  -->


            <!-- 소개 DDL , DML Menu  -->
            <li><a href="#">
                  <h4>
                     <i class="fa fa-bar-chart-o fa-fw"></i>소개 <span class="fa arrow"></span>
                  </h4>
            </a>


               <ul class="nav nav-second-level">

               </ul> <!-- /.nav-second-level --></li>
            <!-- 소개 DDL , DML Menu END   -->

            <!-- DDL Menu  -->
            <li><a href="DDL.html">
                  <h4>DDL</h4>
               </a></li>
            <!-- DDL Menu End  -->


            <!-- DML Menu  -->
            <li><a href="dml.html">
                  <h4>
                     <i class="fa fa-table fa-fw"></i> DML
                     <h4>
            </a></li>
            <!-- DML MenuEnd  -->

 
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i>BOARD<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Q&A</a>
                                </li>
                                <li>
                                    <a href="#">공지사항</a>
                                </li>
                           
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

         </ul>
         <!-- /.nav-second-level -->


   <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/resources/bower_components/jquery/dist/jquery.min.js"></script>
 

      </div>
      <!-- /.sidebar-collapse -->
   </div>
   <!-- /.navbar-static-side -->
</div>
