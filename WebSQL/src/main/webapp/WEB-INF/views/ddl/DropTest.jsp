<%@page import="com.sqlweb.dto.AccountDTO"%>
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
     <% 
	HttpSession session2 = request.getSession();
	AccountDTO acdto = (AccountDTO)session2.getAttribute("acdto");
	if(acdto == null){
		System.out.println("acdto null : "+acdto);
	}else{
		System.out.println("DML.jsp acdto not null : "+acdto);
		System.out.println("DML.jsp acdto not null : "+acdto.getId());
		System.out.println("DML.jsp acdto not null : "+acdto.getPwd());
		System.out.println("DML.jsp acdto not null : "+acdto.getUid());
		System.out.println("DML.jsp acdto not null : "+acdto.getIp());
	}
%> 
  <script>
  
  $(function() {
     $( "#createtable" ).draggable({ revert: true, helper: "clone" });
    
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
                     
                     $( dia ).dialog( "close" );
                  },
                  error : function(xhr) {
                     alert("DB 연결 실패");
                  }
               });
                 
          
  });
  </script>
</head>
<body>

   <table border="1" id="createtable" class='table-striped table-bordered table-hover'>
      <tr><td>테이블</td></tr>
   </table>
   <br>
   <div  id="connection" title="DB계정연결">
      아이피  &nbsp;&nbsp; :  <input type="text" id="ipAdress" name="ipAdress" readonly="readonly" value="<%=acdto.getIp()%>" style="background-color: #eee;"><br><br>
      아이디  &nbsp;&nbsp; :  <input type="text" id="DBid" name="DBid" readonly="readonly" value="<%=acdto.getId()%>" style="background-color: #eee;"><br><br>
      <input type="hidden" id="DBpwd" name="DBpwd" value="<%=acdto.getPwd()%>"><br><br>
      
   </div>
   
</body>
</html>