<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ID 찾기  -->

<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>


<script type="text/javascript">
   $(function() {

      /* ID 찾기  */
      $('#btnidfine')
            .click(
                  function() {

                     $('#modalfooter').empty();

                     $('#modal-bodyID')
                           .html(
                                 "<table align='center'><tr><td width='40px'><b>이름</b></td><td width='200px'><input type='text' class='form-control' id='user_name' name='user_name' placeholder='이름 입력'></td><td align='right' width='75px'><button type='button' class='btn btn-info' id='modalbtn'>ID찾기</button></td><td align='right' width='65px'><button type='button' class='btn btn-default' data-dismiss='modal'>Close</button></td></tr></table> ");

                     $('#modalbtn').click(
                           function() {

                              $.ajax({
                                 type : 'POST',
                                 url : 'userIDfine.html',
                                 data : {
                                    user_name : $('#user_name')
                                          .val()
                                 },
                                 dataType : "html",
                                 success : function(responseData) {

                                    $('#modalfooter').html(
                                          "<h4>당신의 ID : "
                                                + responseData
                                                + "입니다</h4>");
                                 }

                              });

                           });

                  });

      /* PWD 찾기  */
      $('#btnpwdfine')
            .click(
                  function() {

                     $('#modalfooter2').empty();

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

                     $('#modalbtn')
                           .on(
                                 "click",
                                 function() {

                                    $('#modalbodydetail')
                                          .html(
                                                "<br><br><table><tr><td><input type='text' id='modalcode' name='modalcode'></td><td width='5px'></td><td>"
                                                      + "<button type='button' class='btn btn-primary btn-xs' id='modalcodebtn' name='modalcodebtn' style='padding-left: 14px;padding-right: 14px;padding-top: 3px;padding-bottom: 3px;'>인증</button></td></tr></table>");
                                    $('#modalcodebtn')
                                          .click(
                                                function() {

                                                   var code1 = $(
                                                         '#modalcode')
                                                         .val();
                                                   var code2 = $(
                                                         '#hiddencode')
                                                         .val();
                                                   console
                                                         .log($(
                                                               '#modalcode')
                                                               .val());
                                                   console
                                                         .log($(
                                                               '#hiddencode')
                                                               .val());

                                                   if (code1 == code2) {
                                                      alert("인증성공");
                                                      $(
                                                            '#modal-footer')
                                                            .html(
                                                                  "<button type='button' class='btn btn-danger' id='onsumit' name='onsumit' data-dismiss='modal'>확인</button>   <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");

                                                      $(
                                                            '#idhidden')
                                                            .val(
                                                                  $(
                                                                        '#user_id')
                                                                        .val());
                                                      $(
                                                            '#namehidden')
                                                            .val(
                                                                  $(
                                                                        '#user_name')
                                                                        .val());
                                                      $(
                                                            '#emailhidden')
                                                            .val(
                                                                  $(
                                                                        '#modalemail')
                                                                        .val());

                                                      $(
                                                            '#onsumit')
                                                            .click(
                                                                  function() {

                                                                     console
                                                                           .log($(
                                                                                 '#namehidden')
                                                                                 .val());
                                                                     console
                                                                           .log($(
                                                                                 '#idhidden')
                                                                                 .val());
                                                                     console
                                                                           .log($(
                                                                                 '#emailhidden')
                                                                                 .val());

                                                                     $
                                                                           .ajax({
                                                                              type : 'POST',
                                                                              url : 'Mailsave.html',
                                                                              data : {
                                                                                 user_name : $(
                                                                                       '#idhidden')
                                                                                       .val(),
                                                                                 user_id : $(
                                                                                       '#namehidden')
                                                                                       .val(),
                                                                                 user_email : $(
                                                                                       '#emailhidden')
                                                                                       .val(),

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

                                    /* 이메일로 인증 번호 받아오기 비동기 비동기  */
                                    $
                                          .ajax({

                                             url : "Mail.html",
                                             data : 'modalemail='
                                                   + $(
                                                         "#modalemail")
                                                         .val(),
                                             dataType : "html",
                                             success : function(
                                                   responseData) {
                                                var codes = JSON
                                                      .parse(responseData);
                                                var code = "";

                                                console
                                                      .log(codes);
                                                $
                                                      .each(
                                                            codes,
                                                            function(
                                                                  index,
                                                                  codelist) {
                                                               code += codelist;
                                                            });
                                                console
                                                      .log(code);
                                                $('#hiddencode')
                                                      .val(
                                                            code);
                                                console
                                                      .log($(
                                                            '#hiddencode')
                                                            .val());
                                             }
                                          });
                                    /* 이메일로 인증 번호 받아오기 비동기 비동기 End  */

                                    /* 비밀번호 찾아주는 코드  */
                                    $('#pwdfine')
                                          .click(
                                                function() {

                                                   $
                                                         .ajax({
                                                            type : 'POST',
                                                            url : 'UserPWDfine.html',
                                                            data : {
                                                               user_name : $(
                                                                     '#user_name')
                                                                     .val(),
                                                               user_id : $(
                                                                     '#user_id')
                                                                     .val(),
                                                               user_email : $(
                                                                     '#user_email')
                                                                     .val()
                                                            },
                                                            dataType : "html",
                                                            success : function(
                                                                  responseData) {

                                                               $(
                                                                     '#modalfooter2')
                                                                     .html(
                                                                           "<h4>당신의 Password :"
                                                                                 + responseData
                                                                                 + "입니다.</h4>");
                                                            }
                                                         });
                                                });
                                 });
                  });
   });
</script>
<div id="main">

	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12" align="left">


					<div class="col-lg-5" style="position: absolute; left: 300px;">
						<div class="login-panel panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<b>Please Sign In</b>
								</h3>
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
										<input type="submit" class="btn btn-primary btn-lg btn-block"
											value="로그인" />
										<!-- <a href="index.html" class="btn btn-lg btn-success btn-block">Login</a> -->


									</fieldset>
								</form>


								<table>
									<tr>
										<td colspan="3" height="5px"></td>
									</tr>
									<tr>
										<td width="280px" align="right"><a href="userEntry.html"
											class="btn btn-outline btn-primary btn-xs">회원가입</a></td>

										<td width="55px" align="right">
											<!-- ID 찾기  -->
											<button class="btn btn-outline btn-primary btn-xs"
												data-toggle="modal" data-target="#myModal" id="btnidfine">
												ID찾기</button>
										</td>
										<!-- ID 찾기 End -->


										<!-- PWD 찾기  -->
										<td width="70px" align="right">
											<button class="btn btn-outline btn-primary btn-xs"
												data-toggle="modal" data-target="#myModal2" id="btnpwdfine">
												PWD찾기</button>
										</td>
										<!-- PWD찾기 End  -->
									</tr>
								</table>

								<!-- Modal ID-->
								<!-- ID찾기 팝업창 -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true"
									style="display: none;">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel"
													style="text-align: center">ID찾기</h4>
											</div>
											<div class="modal-body" id="modal-bodyID"></div>

											<div id="modalfooter" class="modal-footer"
												style="text-align: center;"></div>

										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal ID End -->

								<!-- Modal PWD -->
								<!-- 비밀번호 찾기 팝업창  -->
								<div class="modal fade" id="myModal2" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
									style="display: none;">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel"
													style="text-align: center">PWD찾기</h4>
											</div>
											<div class="modal-body" id="modal-bodyPWD">

												<<<<<<< HEAD
												<div align="center">
													<table style="width: 450px;">
														<tr height="40px">
															<td><b>이름</b></td>
															<td><input class='form-control' id='user_name'
																name='user_name' placeholder='이름 입력'></td>
															<td width="110px"></td>
														</tr>
														<tr height="40px">
															<td><b>ID</b></td>
															<td><input class='form-control' id='user_id'
																name='user_id' placeholder='ID 입력'></td>
															<td></td>
														</tr>
														<tr height="40px">
															<td><b>이메일</b></td>
															<td><input class='form-control' id='user_email'
																name='user_email' placeholder='이메일 입력'
																readonly="readonly"></td>
															<td align="right">
																<button type="button"
																	class="btn btn-outline btn-primary" data-toggle="modal"
																	data-target="#myModal3">이메일 인증</button> <br>
															</td>
														</tr>
														<tr height="40px">
															<td colspan="3" align="center">
																<button type='button'
																	class='btn btn-outline btn-primary btn-sm' id="pwdfine">PWD찾기</button>
																<button type='button'
																	class='btn btn-outline btn-primary btn-sm'
																	data-dismiss='modal'>Close</button>
															</td>
														</tr>
													</table>
												</div>
												=======
												<div align="center">
													<table style="width: 350px;">
														<tr height="40px">
															<td><b>이름</b></td>
															<td><input class='form-control' id='user_name'
																name='user_name' placeholder='이름 입력'></td>
														</tr>
														<tr height="40px">
															<td><b>ID</b></td>
															<td><input class='form-control' id='user_id'
																name='user_id' placeholder='ID 입력'></td>
														</tr>
														<tr height="40px">
															<td><b>이메일</b></td>
															<td><input class='form-control' id='user_email'
																name='user_email' placeholder='이메일 입력'
																readonly="readonly"></td>

														</tr>
														<tr height="40px">
															<td colspan="2" align="right">
																<button type="button"
																	class="btn btn-outline btn-primary btn-sm"
																	data-toggle="modal" data-target="#myModal3">이메일인증</button>

																<button type='button' class='btn btn-info' id="pwdfine">PW찾기</button>
																<button type='button' class='btn btn-default'
																	data-dismiss='modal'>Close</button>
															</td>
														</tr>
													</table>
												</div>
												>>>>>>> branch 'master' of
												https://github.com/Kimsssss/WebSql.git

												<div id="modalfooter2" class="modal-footer"
													style="text-align: center;"></div>

											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal PWD End -->

									<!-- 이메일 인증  -->
									<div id="myModal3" class="modal fade" role="dialog">
										<div class="modal-dialog">

											<<<<<<< HEAD
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">이메일 인증</h4>
												</div>
												=======
												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title" style="text-align: center">이메일
															인증</h4>
													</div>
													>>>>>>> branch 'master' of
													https://github.com/Kimsssss/WebSql.git <<<<<<< HEAD
													<form action="Mailsave.html" method="post"
														enctype="multipart/form-data" name="emailform"
														accept-charset="utf-8">
														<div class="modal-body" id="modalbody">
															<p>인증할 이메일 주소를 입력해주세요.</p>
															<br> <input type="hidden" id="namehidden"
																name="namehidden" value=""> <input type="hidden"
																id="idhidden" name="idhidden" value=""> <input
																type="hidden" id="emailhidden" name="emailhidden"
																value=""> <input type="text" id="modalemail"
																name="modalemail">
															<button type="button" id="modalbtn" name="modalbtn">인증코드
																전송</button>

															<input type="hidden" value="0" id="hiddencode"
																name="hiddencode">
															<div id="modalbodydetail"></div>
															=======
															<form action="Mailsave.html" method="post"
																enctype="multipart/form-data" name="emailform"
																accept-charset="utf-8">
																<div class="modal-body" id="modalbody" align="center">
																	<p>인증할 이메일 주소를 입력해주세요.</p>
																	<br> <input type="hidden" id="namehidden"
																		name="namehidden" value=""> <input
																		type="hidden" id="idhidden" name="idhidden" value="">
																	<input type="hidden" id="emailhidden"
																		name="emailhidden" value="">
																	<table style="width: 310px;">
																		<tr height="40px">
																			<td><input class='form-control' id="modalemail"
																				name="modalemail"></td>
																			<td align="right">
																				<button type="button"
																					class="btn btn-outline btn-primary" id="modalbtn"
																					name="modalbtn"
																					style="padding-left: 3px; padding-right: 3px;">인증코드전송</button>
																			</td>
																		</tr>
																	</table>
																	<input type="hidden" value="0" id="hiddencode"
																		name="hiddencode">
																	<div id="modalbodydetail"></div>
																	>>>>>>> branch 'master' of
																	https://github.com/Kimsssss/WebSql.git

																</div>
															</form>

															<<<<<<< HEAD
															<div class="modal-footer" id="modal-footer"
																name="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
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
				=======
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
<!-- /.col-lg-6 -->

</div>
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
</div>
<!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#main  -->








<!--   <div class="page-wrapper">

      <div class="row">
         <div class="col-md-4 col-md-offset-4" >
          
         </div> 
      </div>
   </div>
</div> -->
>>>>>>> branch 'master' of https://github.com/Kimsssss/WebSql.git
