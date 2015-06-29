<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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


<div id="page-wrapper" align="center">

	<div class="row">
		<div class="body">
			<h2 class="page-header">회원 정보 수정</h2>
		</div>

	</div>

	<form action="">
		<table>
			<tbody>
				<tr height="40px">
					<td width="100px"><b>아이디</b></td>
					<se:authentication property="name" var="LoginUser" />
					<td width="250px"><input type="text" class="form-control"
						id="user_id" value="${LoginUser }" readonly="readonly"></td>
				</tr>
				<tr height="40px">
					<td><b>새로운 패스워드</b></td>
					<td><input type="password" class="form-control" id="user_pwd"
						value=""></td>

				</tr>
				<tr height="40px">
					<td><b>새로운 패스워드 확인</b></td>
					<td><input type="password" class="form-control" id="user_pwd2"></td>
				</tr>
				<tr height="40px">
					<td><b>이메일</b></td>
					<td><input type="text" class="form-control" id="user_email"
						readonly="readonly" value="${mypage.user_email }"></td>
				</tr>
				<tr height="40px">
					<td><b>이름</b></td>
					<td><input type="text" class="form-control" id="user_name"
						readonly="readonly" value="${mypage.user_name}"></td>
				</tr>

				<tr>
					<td></td>
					<td height="40px" align="right"><input type="submit"
						class="btn btn-primary btn-xs" id="btnSubmit" value="수정">
						<input type="reset" class="btn btn-primary btn-xs" name="btnReset"
						value="다시작성"></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>