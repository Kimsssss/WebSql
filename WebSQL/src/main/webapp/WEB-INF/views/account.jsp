<%@page import="java.io.Writer"%>
<%@page import="com.sqlweb.dto.AccountDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<% 
	AccountDTO acdto = (AccountDTO)session.getAttribute("acdto");
	if(acdto == null){
		System.out.println("Account.jsp acdto null : "+acdto);
	}else{
		System.out.println("Account.jsp acdto not null : "+acdto);
		System.out.println("Account.jsp acdto not null : "+acdto.getId());
		System.out.println("Account.jsp acdto not null : "+acdto.getPwd());
		System.out.println("Account.jsp acdto not null : "+acdto.getUid());
		System.out.println("Account.jsp acdto not null : "+acdto.getIp());
		
		session.setAttribute("acdto", acdto);
	}
%>
<script> 
$(function(){ 
   $('#btnSubmit').click(function() { 
          
          $.ajax({
             type: 'POST',
             url: 'accountcon.html',
             data:{uid: $('#uiduid').val(),
                   ip: $('#ipip').val(),
                   id: $('#idid').val(),
                   pwd: $('#pwdpwd').val()}, 
           dataType: "html",
           success: function(responseData){
                
           var codes = JSON.parse(responseData);
           console.log(codes);
           if(codes[0]==1){
        	   alert("계정 연결정보 저장");
        	   location.href = "index.html";
        	   
           }else{
        	   alert(codes[0]);   
           }
           
             }
             
           })
           
          });
   }); 
</script>

</head>
<body>
	<div id="page-wrapper" align="center">

   <div class="row">
      <div class="body">
         <h2 class="page-header">계정연결</h2>
      </div>

   </div>

   <form action="">
      <table>
         <tbody>
            <tr height="40px">
               <td width="100px"><b>유저 아이디</b></td>
               <se:authentication property="name" var="LoginUser" />
               <td width="250px"><input type="text" class="form-control"
                  id="uiduid" name="uiduid" value="${LoginUser}" readonly="readonly"></td>
            </tr>
            <tr height="40px">
               <td><b>IP</b></td>
               <td><input type="text" class="form-control" id="ipip" name="ipip"
                  value=""></td>

            </tr>
            <tr height="40px">
               <td><b>계정 ID</b></td>
               <td><input type="text" class="form-control" id="idid" name="idid"></td>
            </tr>
            <tr height="40px">
               <td><b>암호</b></td>
               <td><input type="password" class="form-control" id="pwdpwd" name="pwdpwd"
                  value=""></td>
            </tr>
            <tr>
               <td></td>
               <td height="40px" align="right"><input type="button"
                  class="btn btn-primary btn-xs" id="btnSubmit" value="연결">
                  
            </tr>
         </tbody>
      </table>
   </form>
</div>
</body>
</html>