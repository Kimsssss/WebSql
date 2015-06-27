<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script> 
$(document).ready(function() { 
   $('#btnSubmit').click(function() { 
          var user_pwd = $("#user_pwd").val(); 
          var user_pwd2 =  $('#user_pwd2').val();
          if(user_pwd == user_pwd2){
             
              
          $.ajax({
             type: 'GET',
             url: 'mypageUpdate.html',
             data:{user_id: $('#user_id').val(),
                   user_pwd: $('#user_pwd').val(),
                   user_email: $('#user_email').val(),
                   user_name: $('#uesr_name').val(),
                   user_pwd2: $('#user_pwd2').val()}, 
           dataType: "html",
              success: function(responseData){
                
                var codes = JSON.parse(responseData);
                console.log(codes);
             }
             
           })
           alert("비밀번호가 정상적으로 수정되었습니다.");
          }else {
             alert("비밀번호를 다시 확인해 주세요.");
          }
   }); 
}); 
</script> 
<div id="main">
   <div class="container">
      <div align="center" class="body">
         <h2>회원 정보 수정</h2>
         <form action="">
         <table>
            <tr height="40px">
               <td>아이디</td>
               <se:authentication property="name" var="LoginUser" />
               <td><input type="text" id="user_id" value="${LoginUser }"
                  readonly="readonly"></td>
            </tr>
            <tr height="40px">
               <td>새로운 패스워드</td>
               <td><input type="password" id="user_pwd" value=""></td>
               
            </tr>
            <tr height="40px">
               <td>새로운 패스워드 확인</td>
               <td><input type="password" id="user_pwd2"></td>
            </tr>

            <tr height="40px">
               <td>이메일</td>
               <td><input type="text" id="user_email" readonly="readonly"
                  value="${mypage.user_email }"></td>
            </tr>
            <tr height="40px">
               <td>이름</td>
               <td><input type="text" id="user_name" readonly="readonly"
                  value="${mypage.user_name}"></td>
            </tr>

         </table>
         <table>
            <tr>
               <td height="40px" align="center"><input type="submit"
                  id="btnSubmit" value="수정" ></td>
               <td height="40px" align="center"><input type="reset"
                  name="btnReset" value="다시작성"></td>
            </tr>
         </table>
         </form>
      </div>

   </div>
</div>