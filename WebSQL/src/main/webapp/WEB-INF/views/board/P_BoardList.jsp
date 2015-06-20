<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
	
		<table class="article-list margin-small">
			<caption class="hidden">건의사항</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
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
		<div align="center">
		<p>
			<se:authorize ifAllGranted="ROLE_USER">
				<a href="p_board.html">글쓰기</a>
			</se:authorize>

		</p>
	</div>

</body>
</html>