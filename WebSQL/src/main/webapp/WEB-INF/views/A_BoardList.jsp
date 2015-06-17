<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>


<!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=request.getContextPath() %>/resources/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath() %>/resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



</head>

<body>





   <!-- /.panel-heading -->
                        <div class="panel-body col-lg-10" 
                        style="float: right; text-align: center; background: white;  top: 200px ">
                            
                            <div class="table-responsive" >
                            <h1 style="text-align: center">Web-SQL 공지사항</h1> 
                                <table class="table table-striped" >
                                    <tr>
                                        
                                            <td>글번호</td>
                                            <td>제목</td>
                                            <td>작성자</td>
                                            <td>날짜</td>
                                            <td>조회수</td>
                                        
                                    </tr>
                                    
                                  <tbody>
			<c:forEach items="${list}" var="n">
				<tr>
					<td class="col-lg-2">${n.board_a_id}</td>
					<td class="col-lg-3"><a href="boardDetail.html?board_a_id=${n.board_a_id}">${n.board_a_title}</a></td>
					<td class="col-lg-2">${n.user_id}</td>
					<td class="col-lg-3">${n.board_a_date}</td>
					<td class="col-lg-2">0</td>
					
				</tr>
			</c:forEach>
		</tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
               
               <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
<ul class="pagination">

<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
<a href="#">Previous</a>
</li>

<li class="paginate_button active" aria-controls="dataTables-example" tabindex="1">
<a href="#">1</a>
</li>

<li class="paginate_button " aria-controls="dataTables-example" tabindex="2">
<a href="#">2</a>
</li>

<li class="paginate_button " aria-controls="dataTables-example" tabindex="3">
<a href="#">3</a>
</li>

<li class="paginate_button " aria-controls="dataTables-example" tabindex="4">
<a href="#">4</a>
</li>

<li class="paginate_button " aria-controls="dataTables-example" tabindex="5">
<a href="#">5</a>
</li>

<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
<a href="#">Next</a>
</li>


</ul>
</div>             
                            
                            
                        </div>
                        <!-- /.panel-body -->


	    
                            
                           
                  
            
            
         








   <!-- jQuery -->
    <script src="<%=request.getContextPath() %>/resources/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=request.getContextPath() %>/resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath() %>/resources/dist/js/sb-admin-2.js"></script>


</body>
</html>