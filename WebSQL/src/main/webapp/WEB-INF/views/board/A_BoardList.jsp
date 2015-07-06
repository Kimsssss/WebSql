<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<div id="main">

	<div class="row" style="padding-top: 0px; padding-left: 300px">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">

					<div class="table-responsive">
						<h1 style="text-align: center">Web-SQL 공지사항</h1>
						<table class="table table-striped">
							<tr>

								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
								

							</tr>

							<tbody>
								<c:forEach items="${list}" var="n">
									<tr>
										<td class="col-lg-2">${n.board_a_id}</td>
										<td class="col-lg-3"><a href="boardDetail.html?board_a_id=${n.board_a_id}">${n.board_a_title}</a></td>
										<td class="col-lg-2">${n.user_id}</td>
										<td class="col-lg-3">${n.board_a_date}</td>
										

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<!-- 게시판 검색  -->
				
		
 <form id="content-searchform" class="article-search-form"
		action="boardlist.html" method="get">
		
		<table align="center">

		<tr>
			
                        	<input type="hidden" name="pg" value="" /> 
                       
                              <td>  <select name="f" class="form-control input-sm">
								<option value="BOARD_A_TITLE">제목</option>
								<option value="BOARD_A_CONTENT">내용</option>
								</select> </td>
                                
                                
                               <td> <input type="text" class="form-control" name="q" id="q" placeholder="Search..." style="width: 100%;"></td>
                                
                               <td>
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                               </span>
                               </td>
         </tr>    	
		</table>
	
	</form>

					<!-- /.table-responsive -->

					<c:set var="cnt" value="${cnt}" />
					<c:set var="cpage" value="${cpage}" />
					<c:set var="endpage" value="${(cnt/5) + 1}" />


					<c:if test=""></c:if>
					<div align="center">
						<ul class="pagination">

							<c:forEach var="i" begin="1" end="${endpage}">

								<c:choose>
									<c:when test="${cpage==i}">
										<li class="paginate_button active"><a>${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="paginate_button"><a
											href="boardlist.html?pg=${i}&f=${param.f}&q=${param.q}">${i}</a></li>
									</c:otherwise>

								</c:choose>



							</c:forEach>

						</ul>
					</div>
					<p>
						<se:authorize ifAllGranted="ROLE_ADMIN">
							<a class="btn btn-info btnposition" style="float: right"
								href="board.html">글쓰기</a>
						</se:authorize>

					</p>
				</div>
			</div>
		</div>
	</div>
</div>


