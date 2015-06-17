<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>

	<table class="article-list margin-small">
		<caption class="hidden">공지사항</caption>
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
			<c:forEach items="${list}" var="n">
				<tr>
					<td class="seq">${n.board_a_id}</td>
					<td class="title"><a href="noticeDetail.htm?seq=${n.board_a_id}">${n.board_a_title}</a></td>
					<td class="writer">${n.user_id}</td>
					<td class="regdate">${n.board_a_date}</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>



</body>
</html>