<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="main">
	<form action="" method="post">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" align="center">공지사항</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
						<table style="width: 100%;">
							<tbody><tr>
								<td width="" align="left"><h4><b>수정</b></h4></td>
								<td width="" align="right">
									<button class="btn btn-primary btn-sm" href="<%=request.getContextPath() %>/boardlist.html">글목록 </button>
								</td>
							</tr>
						</tbody></table>		
						</div>


						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">

									<a class="form-group"
										href="<%=request.getContextPath() %>/boardlist.html"> 글목록
									</a>
									<!-- 게시판 작성자  -->
									<div class="form-group">
										<label>작성자</label> <input class="form-control"
											style="width: 176px;" name="user_id" readonly="readonly"
											value="${a_notice.user_id}">

									</div>

									<!-- 게시판 작성자 END  -->

									<!-- 글제목  -->
									<div class="form-group">
										<label>글 제목</label> <input class="form-control"
											style="width: 176px;" name="board_a_title"
											value="${a_notice.board_a_title}">
									</div>
									<!-- 글제목 End  -->

									<!-- 글내용  -->
									<div class="form-group">
										<label>글 내용</label>
										<textarea class="form-control" rows="3" name="board_a_content"
											style="height: 290px";>
                                            ${a_notice.board_a_content}
                                            </textarea>
									</div>
									<!-- 글내용End  -->


									
									<!-- 글쓰기 , 다시작성 Button  -->
									<div class="form-group">
									<table style="width: 100%">
										<tr>
											<td align="right">
												<input type="submit" class="btn btn-info" value="수정완료"style="padding-left: 29px;
																										     padding-right: 29px;
																										     padding-top: 10px;
																										     padding-bottom: 10px;">
											</td>
											<td width="10px"></td>
											<td align="left"> 
												<input type="reset" class="btn btn-danger" value="다시작성" style="padding-top: 10px;
																											    padding-bottom: 10px;
																											    padding-left: 15px;
																											    padding-right: 15px;">
											</td>
										</tr>
									</table>
									</div>
									<!-- 글쓰기 , 다시작성 Button End  -->


									<!-- /.col-lg-12 (nested) -->
								</div>
								<!-- /.row (nested) -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->


					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /#page-wrapper -->

		</div>
	</form>
</div>