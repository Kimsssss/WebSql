<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

   <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/css/landing-page.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<title>Insert title here</title>
</head>
<body>

<!-- header 영역  -->
<nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
 <tiles:insertAttribute name="headernav" /> 
</nav>	

<!-- 메인 영역  -->
<tiles:insertAttribute name="content" />

<!-- footer 영역  -->
<div class="col-lg-12">
 <tiles:insertAttribute name="footer" /> 
</div>


    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/js/bootstrap.min.js"></script>

</body>
</html>