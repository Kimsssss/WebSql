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
               <se:authorize ifNotGranted="ROLE_USER, ROLE_ADMIN">
                  <button type="button" class="btn btn-primary"
                     onclick="location.href='login.html'" style="padding-left: 20px;padding-right: 20px;">Login</button><br>
                  <b>로그인하세요.</b><br>
               </se:authorize> <se:authentication property="name" var="LoginUser" /> <se:authorize
                  ifAnyGranted="ROLE_USER,ROLE_ADMIN">

                  <button type="button" class="btn btn-primary"
                     onclick="location.href='${pageContext.request.contextPath}/j_spring_security_logout'" style="padding-left: 16px;padding-right: 15px;">Logout</button><br>
                  <b>${LoginUser }님환영합니다.</b><br>
            <button type="button" class="btn btn-primary"
                     onclick="location.href='account.html'" style="padding-left: 20px;padding-right: 20px;">계정연결</button><br><br>
               </se:authorize>

<!-- 
<button type="button" class="btn btn-success" style="width: 140px"
    onclick="location.href='tableview.html'">TableList</button> -->
            </li>
            <!--사이드 bar Menu1End  -->


            <!-- 소개 DDL , DML Menu  -->
           
               <li>
                   <a href="#"> <h4>소개<span class="fa arrow"></span> </h4> </a>
                       <ul class="nav nav-second-level" hidden="">
                                <li>
                                    <a href="DDLintro.html">DDL</a>
                                </li>
                                <li>
                                    <a href="index.html">DML</a>
                                </li>
                           
                        </ul>
                            
               </li>

            <!-- 소개 DDL , DML Menu END   -->

      
            
            
             <!-- DDL Menu  -->
            
                        <li>
                            <a href="#"><h4>DDL<span class="fa arrow"></span></h4></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="DDL.html">테이블 생성</a>
                                </li>
                                
                                 <li>
                                    <a href="tableview.html">변경 및 삭제</a>
                                </li>
                               
                               
                           
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
            

             <!-- DDL Menu End  -->

            <!-- DML Menu  -->
            <li><a href="dml.html">
                  <h4>DML<h4>
            </a></li>
            <!-- DML MenuEnd  -->

 
 
 
                         <li>
                            <a href="#"><h4>BOARD<span class="fa arrow"></span></h4></a>
                            <ul class="nav nav-second-level" hidden="">
                                <li>
                                    <a href="p_boardlist.html">Q&A</a>
                                </li>
                                <li>
                                    <a href="boardlist.html">공지사항</a>
                                </li>
                           
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

         </ul>
         <!-- /.nav-second-level -->


   <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/resources/bower_components/jquery/dist/jquery.js"></script>
 

      </div>
      <!-- /.sidebar-collapse -->
   </div>
   <!-- /.navbar-static-side -->
</div>