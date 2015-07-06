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
						
						
						<c:set var="p_cnt" value="${p_cnt}" />
					<c:set var="p_cpage" value="${p_cpage}" />
					<c:set var="p_endpage" value="${(p_cnt/5) + 1}" />


					<c:if test=""></c:if>
					<div align="center">
						<ul class="pagination">

							<c:forEach var="i" begin="1" end="${p_endpage}">

								<c:choose>
									<c:when test="${p_cpage==i}">
										<li class="paginate_button active"><a>${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="paginate_button"><a
											href="p_boardlist.html?pg=${i}&f=${param.f}&q=${param.q}">${i}</a></li>
									</c:otherwise>

								</c:choose>



							</c:forEach>

						</ul>
					</div>
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