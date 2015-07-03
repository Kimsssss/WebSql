<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
   <script src="//code.jquery.com/jquery-1.10.2.js"></script>
     <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
     
  <script>
  
  $(function() {
     $( "#createtable" ).draggable({ revert: true, helper: "clone" });
     $("#connection").dialog({
        height : 300,
        width : 400,
        modal : true,
        draggable : false,
        buttons: {
              "DB연결": function() {
                 console.log($("#ipAdress").val());
                  var DBip  = $("#ipAdress").val();
                 var DBid  = $("#DBid").val();
                 var DBpwd = $("#DBpwd").val();
                 var dia = this;
                  $.ajax({
                  type : "get",
                  url : "conn.html",
                  dataType : "html",
                  data : {
                     "DBip" : DBip, "DBid":DBid, "DBpwd":DBpwd
                  },
                  success : function(DB) {
                     alert("DB 연결 성공")
                     $( dia ).dialog( "close" );
                  },
                  error : function(xhr) {
                     alert("DB 연결 실패");
                  }
               });
                 
                  
              }
           }
     });
  });
  </script>
</head>
<body>

   <table border="1" id="createtable">
      <tr><td>테이블</td></tr>
   </table>
   <br>
   
   <div align="center" id="connection" title="DB계정연결">
   <p>연결 정보 입력</p>
	<table width="350px">
		<tr height="40px">
			<td><b>아이피</b></td>
			<td>
				<input type="text" class='form-control' id="ipAdress" name="ipAdress">
			</td>
		</tr>
		<tr height="40px">
			<td><b>아이디</b></td>
			<td>
				<input type="text" class='form-control' id="DBid" name="DBid">
			</td>
		</tr>
		<tr height="40px">
			<td><b>비밀번호</b></td>
			<td>
				<input type="password" class='form-control' id="DBpwd" name="DBpwd">
      		</td>
      	</tr>
	</table>
   </div>
   
</body>
</html>