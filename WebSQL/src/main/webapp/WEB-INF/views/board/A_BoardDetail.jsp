<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<div id="main">
	<div class="row" style="padding-top: 50px; padding-left: 300px">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body" style="height: 530px;">
					<a class="btn btn-info btnposition" href="boardlist.html"
						style="float: right;">글목록</a>
					<h3 style="text-align: center;">글 상세 보기</h3>
					<div class="table-responsive">
						<table class="table table-bordered table-striped">

							<tbody>
								<tr>

									<th style="width: 128px;">작성자</th>


									<td>${a_notice.user_id}</td>
								</tr>


								<tr>
									<th>제목</th>
									<td colspan="4">${a_notice.board_a_title}</td>
								</tr>

								<tr>
									<th>작성날짜</th>
									<td colspan="4">${a_notice.board_a_date}</td>
								</tr>

								<tr>
									<td colspan="4" style="height: 150px">${a_notice.board_a_content}
								</tr>


							</tbody>
						</table>

						<p>
							<se:authorize ifAllGranted="ROLE_ADMIN">
								<a class="btn btn-info btnposition" style="float: right"
									href="boardDelete.html?board_a_id=${a_notice.board_a_id}">삭제</a>
								<a class="btn btn-info btnposition" style="float: right"
									href="boardE.html?board_a_id=${a_notice.board_a_id}">게시글 수정</a>
							</se:authorize>

						</p>


					</div>
				</div>
			</div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>