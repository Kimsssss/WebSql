<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <style>
  .draggable { width: 200px; height: 200px; }
  </style>
	<script>
	var tableNumber = 1;
	var colNumber = 1;
  	$(function() {
 	   $( "#sections" ).droppable({
 		  
 		  accept: "#createtable",
 	      drop: function( event, ui ) {
 	        $( this ).prepend("<table border='1' id='tbs' class='draggable' ><form action='create.htm' method='post'><tr><td><input type='text' name='tablename"+tableNumber+++"' placeholder='테이블명'></td></tr><td>아이피 : <input type='text' name='ipadress'><br>아이디 : <input type='text' name='dbid'><br>비번   : <input type='password' name='pwd'><br>컬럼1 : <input type='text' name='col1'><br>컬럼1 데이터타입 : <input type='text' name='col1_data'><br><input type='submit' value='전송'>	</td></tr></form></table>");
 	        $( ".draggable" ).draggable();
 	      }
 	    });
 	 });
  </script>
</head>

<body>

<header>
<%pageContext.include("DropTest.jsp"); %>
</header>
<section id="sections" style="width: 500px; height: 500px;">
	<table border="1" id="tbs" class="draggable">
		<form action="create.htm" method="post">
			<tr>
				<td><input type="text" name="tablename" placeholder="테이블명"></td>
			</tr>
			<tr>
			<td>
			
				<!-- 이건 세션으로 저장할껍니다-->
				아이피 : <input type="text" name="ipadress"><br>
				아이디 : <input type="text" name="dbid"><br>
				비번   : <input type="password" name="pwd"><br>
				<!--  -->
				컬럼1 : <input type="text" name="col1"><br>
				컬럼1 데이터타입 : <input type="text" name="col1_data"><br>
				<input type="submit" value="전송">
			
			</td>
			</tr>
		</form>
	</table>
</section>
</body>
</html>