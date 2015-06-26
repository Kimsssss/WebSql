<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Web SQL</title>

<!-- Bootstrap Core CSS -->
<link href="<%=request.getContextPath()%>/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=request.getContextPath()%>/resources/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

<!-- Timeline CSS -->
<link href="<%=request.getContextPath()%>/resources/dist/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="<%=request.getContextPath()%>/resources/bower_components/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=request.getContextPath()%>/resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>


   <div id="wrapper">
   
      <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0"> 
         <!-- header, aside --> 
         <tiles:insertAttribute name="header" />
         <tiles:insertAttribute name="aside" />
      </nav>
      
      <!-- Content 영역 -->
      <tiles:insertAttribute name="content" />
            

   </div>
   <!-- /#wrapper -->

   <!-- jQuery -->
   <script src="<%=request.getContextPath()%>/resources/bower_components/jquery/dist/jquery.min.js"></script>

   <!-- Bootstrap Core JavaScript -->
   <script src="<%=request.getContextPath()%>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

   <!-- Metis Menu Plugin JavaScript -->
   <script src="<%=request.getContextPath()%>/resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

   <!-- Morris Charts JavaScript -->
   <script src="<%=request.getContextPath()%>/resources/bower_components/raphael/raphael-min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/bower_components/morrisjs/morris.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/morris-data.js"></script>

   <!-- Custom Theme JavaScript -->
   <script src="<%=request.getContextPath()%>/resources/dist/js/sb-admin-2.js"></script>

</body>

</html>