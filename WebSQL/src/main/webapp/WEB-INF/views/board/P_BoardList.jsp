<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<div id="main">
	<div class="row" style="padding-top: 50px; padding-left: 300px">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">

					<div class="table-responsive">
						<h1 style="text-align: center">Web-SQL 건의사항</h1>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${p_list}" var="p">
									<tr>
										<td class="seq">${p.board_p_id}</td>
										<td class="title"><a
											href="p_boardDetail.html?board_p_id=${p.board_p_id}">${p.board_p_title}</a></td>
										<td class="writer">${p.user_id}</td>
										<td class="regdate">${p.board_p_date}</td>

									</tr>
								</c:forEach>
							</tbody>

						</table>
						<p>
							<se:authorize ifAllGranted="ROLE_USER">
								<a class="btn btn-info btnposition" style="float: right"
									href="p_board.html">글쓰기</a>
							</se:authorize>

						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>