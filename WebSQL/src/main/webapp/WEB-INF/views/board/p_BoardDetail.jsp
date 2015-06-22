<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="main">
	<div class="row" style="padding-top: 50px; padding-left: 300px">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body" style="height: 400px";>
				<a class="btn btn-info btnposition" href="p_boardlist.html"
						style="float: right;">글목록</a>
					<h3 style="text-align: center;">글 상세 보기</h3>

					<div class="table-responsive">
						<table class="table table-bordered table-striped">

							<tbody>
								<tr>

									<th style="width: 128px;">작성자</th>
									<td>${p_detail.user_id}</td>
								</tr>


								<tr>
									<th>제목</th>
									<td colspan="4">${p_detail.board_p_title}</td>
								</tr>

								<tr>
									<th>작성날짜</th>
									<td colspan="4">${p_detail.board_p_date}</td>
								</tr>

								<tr>
									<td colspan="4" style="height: 150px">${p_detail.board_p_content}
									</td>
								</tr>

							</tbody>

						</table>
						<div align="right">
							<input type="submit" class="btn btn-info" value="수정"
								onclick="location.href='p_boardEdit.html?board_p_id=${p_detail.board_p_id}&user_id=${p_detail.user_id }'">
							<input type="button" class="btn btn-info" value="삭제"
								onclick="location.href='p_boardDel.html?board_p_id=${p_detail.board_p_id}'">
						</div>
					</div>
				</div>
<<<<<<< HEAD

=======
				
				
>>>>>>> branch 'master' of https://github.com/Kimsssss/WebSql.git
				<!--  꼬리글 달기 테이블 -->
				<form action="reply.html?board_p_id=${p_detail.board_p_id}"
					method="get">
					<!-- hidden 태그  값을 숨겨서 처리  -->
					<input type="hidden"  name="r_sequence" value="1" > 
					<input type="hidden"  name="board_p_id" value="5">
					
					<!-- hidden data -->

					<table width="80%" border="1">
						<tr>
							<th colspan="2">댓글 쓰기</th>
						</tr>

						<tr><se:authentication property="name" var="LoginUser" />
							<td align="left"> 작성자 : <input type="text" name="r_id" 
								readonly="readonly" value="${ LoginUser}"><br> <!-- ${LoingUser } -->
								내&nbsp;&nbsp;용 :<br> <textarea name="r_content"
									placeholder="댓글을 작성하세요." rows="2" cols="50"></textarea></td>
							<td align="left"><input type="submit" class="btn btn-info"
								value="등록"></td>

						</tr>
					</table>
					
					
					
				</form>
				
				
				
				<table width="80%" border="1">
					<tr>
						<th colspan="2">REPLY LIST</th>
					</tr>
					<c:forEach var="reply" items="${reply }">

						<tr align="left">
							<td width="80%">[${reply.r_id }] : ${reply.r_content }<br>
								작성일 : ${reply.r_date }
							</td>
							<td width="20%">
								<form action="board_replydeleteok.jsp" method="POST"
									name="replyDel">
									<input type="hidden" name="no" value="${reply.r_sequence }">
									<input type="hidden" name="idx" value="${reply.board_p_id }">

									<input type="button" value="삭제"
										onclick="location.href='replyDel.html?r_sequence=${reply.r_sequence}&r_id=${reply.r_id }&board_p_id=${reply.board_p_id }'">

								</form>
							</td>
						</tr>
					</c:forEach>
				</table>



			</div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
