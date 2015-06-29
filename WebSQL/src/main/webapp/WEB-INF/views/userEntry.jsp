<<<<<<< HEAD
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

<!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
<div class="row">
	<div class="body">
		<h2 align="center" class="page-header">유저 등록 화면</h2>
	</div>
</div>

<div align="center" >

<form:form modelAttribute="member" method="post" action="userEntry.html">
   <spring:hasBindErrors name="member">
      <font color="red"><c:forEach items="${errors.globalErrors}"
         var="error">
         <spring:message code="${error.code}" />
      </c:forEach> </font>
   </spring:hasBindErrors>

   <table style="width: 400px " >
      <tr height="40px">
         <td><b>유저ID</b></td>
         <td><form:input class="form-control" placeholder="아이디를 입력하세요." path="user_id"  maxlength="20" id="user_id" value="" /><font
            color="red"><form:errors path="user_id" /></font></td>
      </tr>
      <tr height="40px">
         <td><b>패스워드</b></td>
         <td><form:password class="form-control" path="user_pwd" maxlength="20" id="user_pwd" value=""/><font
            color="red"><form:errors path="user_pwd" /></font></td>
      </tr>
      
      <tr height="40px">
         <td><b>이메일</b></td>
         <td><form:input class="form-control" path="user_email" maxlength="20" readonly="true" disabled="true" value=""/>
         
           <!-- Trigger the modal with a button -->
      </td>
      </tr>
 	  <tr>
 	  	<td></td>
 	  	<td align="right">
           <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">이메일 인증</button>
         <font color="red"><form:errors path="user_email" /></font>
    	</td>
      </tr>
      <tr height="40px">
         <td><b>이름</b></td>
         <td><form:input class="form-control" placeholder="이름을 입력하시오." path="user_name" maxlength="8" id="user_name" value=""/><font
            color="red"><form:errors path="user_name" /></font></td>
      </tr>
      <tr height="40px">
         <td><b>활성</b></td>
         <td><form:input class="form-control" path="enabled" maxlength="50" value=""/><font
            color="red"><form:errors path="enabled"  /></font></td>
      </tr>

      <tr>
      	<td></td>
         <td  height="40px" align="right">
         <input class="btn btn-success" type="submit" name="btnSubmit" value="등록">
         <input class="btn btn-danger" type="reset" name="btnReset" value="취소"></td>
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


   <!-- ----------------------------------------------------------------------------------------------------- -->

<!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
input.user_email {
	background-color: #bebebe;
}
</style>
<script type="text/javascript">
$(function(){
   $('#modalbtn').click(function(){
       $('#modalbodydetail').html("<br><br><table><tr><td><input type='text' id='modalcode' name='modalcode'></td><td width='5px'></td><td> " 
    		   						+"<button type='button' class='btn btn-primary btn-xs' id='modalcodebtn' name='modalcodebtn' style='padding-left: 14px;padding-right: 14px;padding-top: 3px;padding-bottom: 3px;'>인증</button></td></tr></table>");
       $('#modalcodebtn').click(function() {
               
          var code1 = $('#modalcode').val();
          var code2 = $('#hiddencode').val();
          console.log($('#modalcode').val());
          console.log($('#hiddencode').val());
          
          if(code1 == code2){
             alert("인증성공");
             $('#modal-footer').html("<button type='button' class='btn btn-danger' id='onsumit' name='onsumit' data-dismiss='modal'>확인</button>   <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
             
                $('#idhidden').val($('#user_id').val());
                $('#pwdhidden1').val($('#user_pwd').val());
                $('#pwdhidden2').val($('#user_pwd2').val());
                $('#emailhidden').val($('#modalemail').val());
                $('#namehidden').val($('#user_name').val());
                $('#enabledhidden').val($('#enabled').val());
              $('#onsumit').click(function(){
                 console.log($('#idhidden').val());
                  console.log($('#pwdhidden1').val());
                  console.log($('#emailhidden').val());
                  console.log($('#namehidden').val());
                  console.log($('#enabledhidden').val());
              $.ajax({
                 type: 'POST',
                 url: 'Mailsave.html',
                 data:{user_id: $('#idhidden').val(),
                       user_pwd: $('#pwdhidden1').val(),
                       user_email: $('#emailhidden').val(),
                       user_name: $('#namehidden').val(),
                       enabled: $('#enabledhidden').val(),
                       user_pwd2: $('#pwdhidden2').val()}, 
               dataType: "html",
                 success: function(responseData){
                    
                    var codes = JSON.parse(responseData);
                    console.log(codes);
                    
                    $('#user_email').val(codes[0].user_email);
                    
                 }
                 
               }) 
              });
                
             
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


												var code1 = $('#modalcode')
														.val();
												var code2 = $('#hiddencode')
														.val();
												console.log($('#modalcode')
														.val());
												console.log($('#hiddencode')
														.val());

												if (code1 == code2) {
													alert("인증성공");
													$('#modal-footer')
															.html(
																	"<button type='button' class='btn btn-danger' id='onsumit' name='onsumit' data-dismiss='modal'>확인</button>   <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");

													$('#idhidden')
															.val(
																	$(
																			'#user_id')
																			.val());
													$('#pwdhidden1').val(
															$('#user_pwd')
																	.val());
													$('#pwdhidden2').val(
															$('#user_pwd2')
																	.val());
													$('#emailhidden').val(
															$('#modalemail')
																	.val());
													$('#namehidden').val(
															$('#user_name')
																	.val());
													$('#enabledhidden')
															.val(
																	$(
																			'#enabled')
																			.val());
													$('#onsumit')
															.click(
																	function() {
																		console
																				.log($(
																						'#idhidden')
																						.val());
																		console
																				.log($(
																						'#pwdhidden1')
																						.val());
																		console
																				.log($(
																						'#emailhidden')
																						.val());
																		console
																				.log($(
																						'#namehidden')
																						.val());
																		console
																				.log($(
																						'#enabledhidden')
																						.val());
																		$
																				.ajax({
																					type : 'POST',
																					url : 'Mailsave.html',
																					data : {
																						user_id : $(
																								'#idhidden')
																								.val(),
																						user_pwd : $(
																								'#pwdhidden1')
																								.val(),
																						user_email : $(
																								'#emailhidden')
																								.val(),
																						user_name : $(
																								'#namehidden')
																								.val(),
																						enabled : $(
																								'#enabledhidden')
																								.val(),
																						user_pwd2 : $(
																								'#pwdhidden2')
																								.val()
																					},
																					dataType : "html",
																					success : function(
																							responseData) {

																						var codes = JSON
																								.parse(responseData);
																						console
																								.log(codes);

																						$(
																								'#user_email')
																								.val(
																										codes[0].user_email);

																					}

																				})
																	});

												} else {
													alert("인증실패");
												}

											});
							$.ajax({
								url : "Mail.html",
								data : 'modalemail=' + $("#modalemail").val(),
								dataType : "html",
								success : function(responseData) {
									var codes = JSON.parse(responseData);
									var code = "";
									console.log("aaa");
									console.log(codes);
									$.each(codes, function(index, codelist) {
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

<%
	String errormessage = (String) request.getAttribute("errormessage");
	if ((String) request.getAttribute("errormessage") == null) {
		errormessage = "";
	} else {
		errormessage = (String) request.getAttribute("errormessage");
	}
%>
</head>
<body>


<div id="page-wrapper" align="center">



<div class="row">
	<div class="body">
		<h2 class="page-header">유저 등록 화면</h2>
	</div>


		</div>

		<div class="row">
			<div class="col-lg-12">


<div >

					<h3>
						<font color="red"><%=errormessage%></font>
					</h3>
					<form:form modelAttribute="member" method="post"
						action="userEntry.html" autocomplete="off">
						<%--  <spring:hasBindErrors name="member">
      <font color="red"><c:forEach items="${errors.globalErrors}"
         var="error">
         <spring:message code="${error.code}" />
      </c:forEach> </font>
   </spring:hasBindErrors> --%>


						<table>
							<tr height="40px">

								<td width="100px"><b>유저ID</b></td>
								<td width="250px"><form:input class="form-control"
										path="user_id" maxlength="20" id="user_id" value="" /></td>
								<td><font color="red"><form:errors path="user_id"
											cssClass="error" /></font></td>
							</tr>
							<tr height="40px">
								<td><b>패스워드</b></td>
								<td><form:password class="form-control" path="user_pwd"
										maxlength="20" id="user_pwd" value="" /></td>
								<td><font color="red"><form:errors path="user_pwd"
											cssClass="error" /></font></td>
							</tr>
							<tr height="40px">
								<td><b>패스워드 확인</b></td>
								<td><form:password class="form-control" path="user_pwd2"
										maxlength="20" id="user_pwd2" value="" /></td>
								<td><font color="red"><form:errors path="user_pwd2"
											cssClass="error" /></font></td>
							</tr>

							<tr height="40px">
								<td><b>이메일</b></td>
								<td><form:input path="user_email" maxlength="20"
										readonly="true" class="form-control" value="" /></td>
							</tr>
							<tr>
								<td></td>
								<td align="right">
									<!-- Trigger the modal with a button -->
									<button type="button" class="btn btn-info" data-toggle="modal"
										data-target="#myModal">이메일 인증</button>

								</td>
								<td><font color="red"><form:errors path="user_email"
											cssClass="error" /></font></td>
							<tr height="40px">
								<td><b>이름</b></td>
								<td><form:input class="form-control" path="user_name"
										maxlength="8" id="user_name" value="" /></td>
								<td><font color="red"><form:errors path="user_name"
											cssClass="error" /></font></td>
							</tr>
							<tr height="40px">
								<td><b>활성</b></td>
								<td><form:input class="form-control" path="enabled"
										maxlength="50" value="" /></td>
								<td><font color="red"><form:errors path="enabled"
											cssClass="error" /></font></td>
							</tr>

							<tr>

								<td></td>

								<td height="40px" align="right"><input
									class="btn btn-success" type="submit" name="btnSubmit"
									value="등록"> <input class="btn btn-danger" type="reset"
									name="btnReset" value="취소"></td>
							</tr>
						</table>
					</form:form>
				</div>
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
        <h4 class="modal-title" style="text-align: center">이메일 인증</h4>
      </div>
      <form action="Mailsave.html" 
      method="post" enctype="multipart/form-data" name="emailform" accept-charset="utf-8"> 
      <div class="modal-body" id="modalbody">
        <p>인증할 이메일 주소를 입력해주세요.</p>
        <br>
        <input type="hidden" id="idhidden" name="idhidden" value="">
        <input type="hidden" id="pwdhidden1" name="pwdhidden" value="">
        <input type="hidden" id="emailhidden" name="emailhidden" value="">
        <input type="hidden" id="namehidden" name="namehidden" value="">
        <input type="hidden" id="enabledhidden" name="enabledhidden" value="">
        <input type="hidden" id="pwdhidden2" name="pwdhidden2" value="">
        <table style="width: 310px;">
        <tr height="40px">
        <td>
        <input class='form-control'  id="modalemail" name="modalemail">
        </td>
        <td align="right">
        <button type="button" class="btn btn-outline btn-primary" id="modalbtn" name="modalbtn" style="padding-left: 3px; padding-right: 3px;">인증코드 전송</button>
        </td>
        </tr>
        </table>
        <input type="hidden" value="0" id="hiddencode" name="hiddencode">
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
		</div>
	</div>

</body>
</html>
>>>>>>> branch 'master' of https://github.com/Kimsssss/WebSql.git
