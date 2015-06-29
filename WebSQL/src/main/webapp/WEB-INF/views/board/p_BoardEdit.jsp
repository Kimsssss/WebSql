<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="main">
	<form action="" method="post">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" align="center">건의사항</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">글쓰기</div>



						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">

									<!-- 글제목  -->
									<div class="form-group">
										<label>글 제목</label> <input class="form-control"
											style="width: 300px;" name="board_p_title"
											value=${p_detail.board_p_title}>
									</div>
									<!-- 글제목 End  -->

									<!-- 게시판 작성자  -->
									<div class="form-group">
										<label>작성자</label> <input class="form-control"
											style="width: 176px;" name="user_id" readonly="readonly"
											value=${p_detail.user_id }>

									</div>

									<!-- 게시판 작성자 END  -->

									<!-- 글내용  -->
									<div class="form-group">
										<label>글 내용</label>
										<textarea class="form-control" rows="3" name="board_p_content"
											style="height: 290px">${p_detail.board_p_content}</textarea>
									</div>
									<!-- 글내용End  -->


									<!-- 글쓰기 , 다시작성 Button  -->

									<div align="center">
										<input type="submit" class="btn btn-info" value="수정">
										<input type="reset" class="btn btn-info" value="다시작성">

										<div style="font-size: 20px;">
											<a href="<%=request.getContextPath()%>/p_boardlist.html">
												글목록 </a>
										</div>
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