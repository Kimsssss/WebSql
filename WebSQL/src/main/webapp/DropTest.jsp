<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


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


<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script>
  $(function() {
    $( "#createtable" ).draggable({ revert: true, helper: "clone" });
    $("#save").click(function(){
    	//console.log(tableNumber2);
    	
    	
    	var tableColNameArray= new Array(tableColNumber);
     	var tableColdataArray= new Array(tableColNumber);
     	
     	var allTableName = new Array(tableNumber2);
     	//console.log(tableName);
     	/* colNumber 갯수많큼 값을 넣어준다. */
     	for(var i=0;i<tableNumber2;i++){
     		//colNameArray[i] = $("input[name=col"+tableNumber+"_"+(i+1)+"]").val();
     		//coldataArray[i] = $("input[name=col_data"+tableNumber+"_"+(i+1)+"]").val()
     		allTableName = $("input[name=tablename"+i+"]").val();
     	}
		console.log(tableColNameArray.length);
     	
     	
     	/* jQuery.ajaxSettings.traditional = true;	//ajax를 사용해 배열값을 넘기기위한 세팅
     	
    	
    	$.ajax({
			type : "get",
			url : "creates.htm",
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
		}); */
    });
  });
  </script>
</head>
<body>
	<table border="1" id="createtable">
		<tr><td>테이블</td></tr>
	</table>
	<!-- /#wrapper -->

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/bower_components/raphael/raphael-min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bower_components/morrisjs/morris.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/morris-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=request.getContextPath()%>/dist/js/sb-admin-2.js"></script>
	
	버튼 : <input type="button" value="저장" id="save">
</body>
</html>