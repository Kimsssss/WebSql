<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script>
  	$(function() {
 	   $( "#tbs" ).draggable();
 	   $( "#sections" ).droppable({
 		  accept: "#createtable",
 	      drop: function( event, ui ) {
 	        $( this ).append("<table border='1' id='tbs'><tr><td>테이블네임</td></tr><td><form action='create.htm' method='post'>아이피 : <input type='text' name='ipadress'><br>아이디 : <input type='text' name='dbid'><br>비번   : <input type='password' name='pwd'><br>테이블명 : <input type='text' name='tablename'><br>컬럼1 : <input type='text' name='col1'><br>컬럼1 데이터타입 : <input type='text' name='col1_data'><br><input type='submit' value='전송'>	</form></td></tr></table>")
 	      }
 	    });
 	 });
  </script>
</head>

<body>

<header>
<%pageContext.include("DropTest.jsp"); %>
</header>
<section id="sections">
	<table border="1" id="tbs">
		<tr>
			<td>테이블네임</td>
		</tr>
		<tr>
		<td>
		<form action="create.htm" method="post">
			아이피 : <input type="text" name="ipadress"><br>
			아이디 : <input type="text" name="dbid"><br>
			비번   : <input type="password" name="pwd"><br>
			테이블명 : <input type="text" name="tablename"><br>
			컬럼1 : <input type="text" name="col1"><br>
			컬럼1 데이터타입 : <input type="text" name="col1_data"><br>
			<input type="submit" value="전송">
		</form>
		</td>
		</tr>
	</table>
</section>
</body>
</html>