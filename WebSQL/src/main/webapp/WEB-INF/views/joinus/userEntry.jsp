<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
$(function(){
   $('#modalbtn').click(function(){
       $('#modalbodydetail').html("<br><br><input type='text' id='modalcode' name='modalcode'>   <button type='button' id='modalcodebtn' name='modalcodebtn'>인증</button>");
       $('#modalcodebtn').click(function() {
               
          var code1 = $('#modalcode').val();
          var code2 = $('#hiddencode').val();
          console.log($('#modalcode').val());
          console.log($('#hiddencode').val());
          
          if(code1 == code2){
             alert("인증성공");
             $('#modal-footer').html("<button type='button' class='btn btn-danger' id='onsumit' name='onsumit' onclick='javascript:emailform.submit();'>확인</button>   <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
               $('#idhidden').val($('#user_id').val());
                $('#pwdhidden1').val($('#user_pwd').val());
                $('#pwdhidden2').val();
                $('#emailhidden').val($('#modalemail').val());
                $('#namehidden').val($('#user_name').val());
             $('#onsumit').click(function(){
                   
                   
                   console.log($('#idhidden').val());
                   console.log($('#pwdhidden1').val());
                   console.log($('#emailhidden').val());
                   console.log($('#namehidden').val());
                   
                    
                 })
          }else{
             alert("인증실패");
          }
          
         });
       $.ajax({
          url: "Mail.html",
          data : 'modalemail='+$("#modalemail").val(),
          dataType: "html",
          success: function(responseData){
             var codes = JSON.parse(responseData);
             var code = "";
             console.log("aaa");
             console.log(codes);
             $.each(codes, function(index,codelist){
                code += codelist;
                });
             console.log(code);
             $('#hiddencode').val(code);
             console.log($('#hiddencode').val());
          }
       })
   });
});


</script>
</head>
<body>
<div class="container">
<div align="center" class="body">
<h2>유저 등록 화면</h2>
<form:form modelAttribute="member" method="post" action="userEntry.html">
   <spring:hasBindErrors name="member">
      <font color="red"><c:forEach items="${errors.globalErrors}"
         var="error">
         <spring:message code="${error.code}" />
      </c:forEach> </font>
   </spring:hasBindErrors>
   <table>
      <tr height="40px">
         <td>유저ID</td>
         <td><form:input path="user_id"  maxlength="20" id="user_id" value="" /><font
            color="red"><form:errors path="user_id" /></font></td>
      </tr>
      <tr height="40px">
         <td>패스워드</td>
         <td><form:password path="user_pwd" maxlength="20" id="user_pwd" value=""/><font
            color="red"><form:errors path="user_pwd" /></font></td>
      </tr>
      
      <tr height="40px">
         <td>이메일</td>
         <td><form:input path="user_email" maxlength="20" readonly="true" disabled="true" value=""/>
         
           <!-- Trigger the modal with a button -->
           <button type="button" class="btn btn-info btn-lg" 
           data-toggle="modal" data-target="#myModal">이메일 인증</button>
         
         
         <font color="red"><form:errors path="user_email" /></font></td>
      </tr>
      <tr height="40px">
         <td>이름</td>
         <td><form:input path="user_name" maxlength="8" id="user_name" value=""/><font
            color="red"><form:errors path="user_name" /></font></td>
      </tr>
      <tr height="40px">
         <td>활성</td>
         <td><form:input path="enabled" maxlength="50" value=""/><font
            color="red"><form:errors path="enabled"  /></font></td>
      </tr>
      
   </table>
   <table>
      <tr>
         <td height="40px" align="center"><input type="submit"
            name="btnSubmit" value="등록"></td>
         <td height="40px" align="center"><input type="reset"
            name="btnReset" value="리셋"></td>
      </tr>
   </table>
</form:form></div>
<%-- <form action="User.html" method="post">
      아이디:    <input type="text" name="userid"><br>
      비번:    <input type="text" name="userpwd"><br>
      이메일:    <input type="text" name="useremail"><br>
      이름:      <input type="text" name="username"><br>
      활성:    <input type="text" name="enabled"><br>
      <input type="submit" value="회원등록">
</form> --%>


<!-- MODAL START -->

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">이메일 인증</h4>
      </div>
      <form action="Mailsave.html" 
      method="GET" enctype="multipart/form-data" name="emailform">
      <div class="modal-body" id="modalbody">
        <p>인증할 이메일 주소를 입력해주세요.</p>
        <br>
        <input type="hidden" id="idhidden" name="idhidden" value="">
        <input type="hidden" id="pwdhidden1" name="pwdhidden" value="">
        <input type="hidden" id="pwdhidden2" name="pwdhidden2" value="">
        <input type="hidden" id="emailhidden" name="emailhidden" value="">
        <input type="hidden" id="namehidden" name="namehidden" value="">
        
        <input type="text" id="modalemail" name="modalemail">   
        <button type="button" id="modalbtn" name="modalbtn">인증코드 전송</button>
        <input type="hidden" value="" id="hiddencode" name="hiddencode">
        <div id="modalbodydetail">
        </div>
      </div>
      </form>
      <div class="modal-footer" id="modal-footer" name="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</div>
   <!-- ----------------------------------------------------------------------------------------------------- -->

</body>
</html>