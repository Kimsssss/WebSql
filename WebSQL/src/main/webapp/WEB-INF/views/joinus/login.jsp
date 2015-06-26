<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<<<<<< HEAD

<!-- ID 찾기  -->

<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>


<script type="text/javascript">


$(function(){
	
	$('#btnidfine').click(function(){
		
	
		$('#modalfooter').empty();

	  $('#modal-body').html("이름 : <input type='text' class='' id='user_name' name='user_name' placeholder='이름 입력'> <button type='button' class='btn btn-primary' id='modalbtn'>ID찾기</button> <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button> ");
		 
	
	
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
                            <button class="btn btn-info" data-toggle="modal" data-target="#myModal">
                                    PWD찾기
                            </button>
                            <!-- PWD찾기 End  -->
                            
                            
                            
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel" style="text-align: center">ID찾기</h4>
                                        </div>
                                        <div class="modal-body" id="modal-body">
                       <!--                  
                                        이름 : <input type="text" class="" id="user_name" name="user_name" placeholder="이름 입력"> 
                                 <button type="button" class="btn btn-primary" id="modalbtn">ID찾기</button>
                                 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>        -->
                                        </div>
                                        
                                        <div id="modalfooter" class="modal-footer" style="text-align: center;">
                                        
                                        </div>
                                        
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                        </div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
