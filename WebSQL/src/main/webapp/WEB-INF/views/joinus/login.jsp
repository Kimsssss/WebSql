<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ID 찾기  -->

<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> 
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>


<script type="text/javascript">


$(function(){
	
	/* ID 찾기  */
	$('#btnidfine').click(function(){
		
	
		$('#modalfooter').empty();

	  $('#modal-bodyID').html("이름 : <input type='text' class='' id='user_name' name='user_name' placeholder='이름 입력'> <button type='button' class='btn btn-primary' id='modalbtn'>ID찾기</button> <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button> ");

	   $('#modalbtn').click(function(){
	     
		 
		   
	              $.ajax({
	                 type: 'POST',
	                 url: 'userIDfine.html',
	                 data : { user_name : $('#user_name').val()}, 
	                 dataType: "html",
	                 success: function(responseData){

	                	  $('#modalfooter').html("<h4>당신의 ID : "+responseData+"입니다</h4>");
	  												}
	
	              });
	              
                                 });	

	});
		
		
		/* PWD 찾기  */
		$('#btnpwdfine').click(function(){
	
			
			$('#user_name').val('');
			$('#user_id').val('');
			$('#user_email').val('');
			 
			
			/* $('#modal-bodyPWD').html("이름 : <input type='text' class='' id='user_name' name='user_name' placeholder='이름 입력'><br>"
								   +"ID :  <input type='text' class='' id='user_name' name='user_id' placeholder='ID 입력'><br>"
								   +"이메일 :  <input type='text' class='' id='user_name' name='user_email' placeholder='이메일 입력'>"
					               + "<button type='button' class='btn btn-primary' id='modalbtn'>이메일 인증</button><br>" 
					               +"<button type='button' class='btn btn-default'>PWD찾기</button> "
					               +"<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button> ");
 */
			
 
 
 

			 $('#modalbtn').click(function(){
				
				
			
			       $('#modalbodydetail').html("<br><br><input type='text' id='modalcode' name='modalcode'>   <button type='button' id='modalcodebtn' name='modalcodebtn'>인증</button>");
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
			       });
			   });
 
 
 
 
 
 
		});
	
	
	
	
	
		 
		 
		 
		 
		 
		});

	
	
		
	
	
	

	</script>


<div id="main">
	<div class="page-wrapper">
	
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<c:if test="${param.error != null}">
							<div>
								로그인실패<br>
								<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
				 	이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
								</c:if>
							</div>
						</c:if>
						<c:url value="/j_spring_security_check" var="loginURL"></c:url>
						<form name="f" action="${loginURL}" method="post">
							<fieldset>
								<div class="form-group">
									<label for="uid">ID</label> <input class="form-control"
										placeholder="ID" name="j_username" type="text" autofocus>
								</div>
								<div class="form-group">
									<label for="pwd">PWD</label> <input class="form-control"
										placeholder="Password" name="j_password" type="password"
										value="">
								</div>

								<div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="Remember Me">Remember Me
									</label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" value="로그인" />
								<!-- <a href="index.html" class="btn btn-lg btn-success btn-block">Login</a> -->
								
								
								
							</fieldset>
						</form>
						
						<div class="panel-body">
                           <!-- ID 찾기  -->
                            <button class="btn btn-info" data-toggle="modal" data-target="#myModal" id="btnidfine">
                                	ID찾기
                            </button>
                            <!-- ID 찾기 End  -->
                            
                            
                            <!-- PWD 찾기  -->
                            <button class="btn btn-info" data-toggle="modal" data-target="#myModal2" id="btnpwdfine">
                                    PWD찾기
                            </button>
                            <!-- PWD찾기 End  -->
                            
                            
                            
                            <!-- Modal ID-->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel" style="text-align: center">ID찾기</h4>
                                        </div>
                                        <div class="modal-body" id="modal-bodyID">
     
                                        </div>
                                        
                                        <div id="modalfooter" class="modal-footer" style="text-align: center;">
                                        
                                        </div>
                                        
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal ID End -->
                            
                            
                            
                            
                            <!-- Modal PWD -->
                            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel" style="text-align: center">PWD찾기</h4>
                                        </div>
                                        <div class="modal-body" id="modal-bodyPWD">
     										
     							    이름 : <input type='text' class='' id='user_name' name='user_name' placeholder='이름 입력'><br>
								   ID :  <input type='text' class='' id='user_id' name='user_id' placeholder='ID 입력'><br>
								    이메일 :  <input type='text' class='' id='user_email' name='user_email' placeholder='이메일 입력'>
								    
					               <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal3">이메일 인증</button><br>
					               <button type='button' class='btn btn-default'>PWD찾기</button> 
					               <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button> 
     										
     										
                                        </div>
                                        
                                        <div id="modalfooter" class="modal-footer" style="text-align: center;">
                                        
                                        </div>
                                        
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal PWD End -->
                            
    <!-- 이메일 인증  -->                       
      <div id="myModal3" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">이메일 인증</h4>
      </div>
      
      <form action="Mailsave.html" 
      method="post" enctype="multipart/form-data" name="emailform" accept-charset="utf-8"> 
      <div class="modal-body" id="modalbody">
        <p>인증할 이메일 주소를 입력해주세요.</p>
        <br>
        <input type="hidden" id="idhidden" name="idhidden" value="">
        <input type="hidden" id="emailhidden" name="emailhidden" value="">
        <input type="hidden" id="namehidden" name="namehidden" value="">
         <input type="text" id="modalemail" name="modalemail">  
        <button type="button" id="modalbtn" name="modalbtn">인증코드 전송</button>
        
        <input type="hidden" value="0" id="hiddencode" name="hiddencode">
        <div id="modalbodydetail">
        </div>
        
      </div>
      </form>
      
      <div class="modal-footer" id="modal-footer" name="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
    
    <!-- 이메일 인증 End  -->    

  </div>
  
</div>
</div>
                           
                           
                            
                            
                            
                            
                            
                            
                            
                        </div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
