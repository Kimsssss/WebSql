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
  .button {width: 30px; height: 30px}
  </style>
	<script>
	var tableNumber2 = 1;
	
  	$(function() {
 	   $( "#sections" ).droppable({
 		  
 		  accept: "#createtable",
 	      drop: function( event, ui ) {
 	    	var tableNumber = tableNumber2++; 
 	    	var colNumber = 1;
 	    	  /* 테이블 생성 "+ tableNumber +" */
 	        $( this ).prepend("<form action='create.htm' method='post'><table border='1' id='tbs' class='draggable' ><tbody><tr><td><input type='text' name='tablename"+ tableNumber +"' placeholder='테이블명'></td></tr><tr><td id='colplus'>컬럼명1 : <input type='text' name='col"+ tableNumber +"_"+ colNumber +"'><br>컬럼1 데이터타입 : <input type='text' name='col_data"+ tableNumber +"_"+ colNumber +"'></td></tr><tr><td><input id='sub' type='button' value='전송'> <input type='button' id='plus"+ tableNumber +"' value='추가'></td></tr></tbody></table></form>");
 	       /* 생성된 테이블에 드래그 추가 */
 	        $( ".draggable" ).draggable();
 	        /* 클릭시 컬럼 추가 */
 	        $("#sub").click(function(){
 	        	
 	        	var colNameArray= new Array(colNumber);
 	        	var coldataArray= new Array(colNumber);
 	        	var tableName = $("input[name=tablename"+tableNumber+"]").val();
 	        	console.log(tableName);
 	        	/* colNumber 갯수많큼 값을 넣어준다. */
 	        	for(var i=0;i<colNumber;i++){
 	        		colNameArray[i] = $("input[name=col"+tableNumber+"_"+(i+1)+"]").val();
 	        		coldataArray[i] = $("input[name=col_data"+tableNumber+"_"+(i+1)+"]").val()
 	        	}

 	        	jQuery.ajaxSettings.traditional = true;	/* ajax를 사용해 배열값을 넘기기위한 세팅 */
 	        	
 	        	$.ajax({
					type : "get",
					url : "create.htm",
					dataType : "html",
					data : {
						"colName" : colNameArray, "coldatatype":coldataArray, "tablename":tableName
					},
					success : function(myfeed) {
						console.log(myfeed);
						alert("테이블 생성 성공")
					},
					error : function(xhr) {
						alert("테이블 생성 실패...");
					}
				});
 	        	 
 	        });
 	        $("#plus"+tableNumber).bind('click', function() {
 	        	console.log($(this).parent().parent().parent().children().children("#colplus"));
 	        	$(this).parent().parent().parent().children().children("#colplus").append("<br>컬럼명"+ ++colNumber +" : <input type='text' name='col"+tableNumber+"_"+colNumber+"'><br>컬럼"+ colNumber +" 데이터타입 : <input type='text' name='col_data"+tableNumber+"_"+ colNumber +"'>");
 	        });
 			
 	        
 	       
 	      }
 	    });
 	  
 	 });
  </script>
</head>

<body>
<%
%>
<header>
<%pageContext.include("DropTest.jsp"); %>
</header>
<section id="sections" style="width: 500px; height: 500px;">
<form action='create.htm' method='post'>
<table border='1' id='tbs' class='draggable' >
<tbody>
<tr><td><input type='text' name='tablename"+ tableNumber +"' placeholder='테이블명'></td></tr>
<tr><td id='colplus'>컬럼명1 : <input type='text' name='col"+ tableNumber +"_"+ colNumber +"'><br>컬럼1 데이터타입 : <input type='text' name='col_data"+ tableNumber +"_"+ colNumber +"'></td></tr>
<tr><td><input id='sub' type='button' value='전송'> <input type='button' id='plus"+ tableNumber +"' value='추가'></td></tr>
</tbody>
</table>
</form>
</section>
</body>
</html>