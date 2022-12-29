<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>boardList</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/feather/feather.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/css/vendor.bundle.base.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vertical-layout-light/style.css">
	</head>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<body>
		<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
		<div class="container">
			<div class="container-fluid page-body-wrapper">
				<jsp:include page="/WEB-INF/view/inc/sidebar.jsp"></jsp:include>
				<div class="main-panel">
					<div class="content-wrapper">
						<div class="row">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">BOARD LIST</h4>
										<div class="d-flex flex-column align-items-end">
											<!-- 게시글 입력 -->
											<div>
												<a class="btn btn-sm btn-primary mb-3" href="${pageContext.request.contextPath}/board/insertBoard">+ write</a>
											</div>
											<div class="row">
												<!-- 게시글 출력 개수 설정 -->
												<form class="col-1" id="pageForm" action="${pageContext.request.contextPath}/board/boardList" method="get">
													<input type="hidden" name="currentPage" value="${currentPage}">
													<input type="hidden" name="search" value="${search}">
													<select name="rowPerPage" id="rowPerPage">
														<c:if test="${rowPerPage == 10}">
															<option value="10" selected="selected">10</option>				
															<option value="20">20</option>
															<option value="30">30</option>
														</c:if>
														<c:if test="${rowPerPage == 20}">
															<option value="10">10</option>				
															<option value="20" selected="selected">20</option>
															<option value="30">30</option>
														</c:if>
														<c:if test="${rowPerPage == 30}">
															<option value="10">10</option>				
															<option value="20">20</option>
															<option value="30" selected="selected">30</option>
														</c:if>
													</select>
												</form>
											</div>
										</div>
										<!-- 게시글 리스트 -->
										<div class="table-responsive pt-3">
											<table class="table table-bordered">
												<thead class="text-center">
													<tr>
														<th style="width: 10%">#</th>
														<th>title</th>
														<th style="width: 20%">date</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="board" items="${boardList}">
														<tr>
															<td>${board.boardNo}</td>
															<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${board.boardNo}">${board.boardTitle}</a></td>
															<td>${board.createdate}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- 검색 -->
										<div class="container mt-3">
											<form action="${pageContext.request.contextPath}/board/boardList" method="get">
												<div class="form-group">
													<div class="input-group">
														<input type="hidden" name="currentPage" value="${currentPage}">
														<input type="hidden" name="rowPerPage" value="${rowPerPage}">
														<input type="text" class="form-control" name="search" value="${search}" placeholder="title"/>
														<div class="input-group-append">
															<button class="btn btn-sm btn-primary" type="submit">Search</button>
														</div>
													</div>
												</div>
											</form>
										</div>
										<!-- 페이징 미완 -->
										<div class="text-center">
											<c:set var="showNum" value="5"></c:set>
											<c:set var="startNum" value="${currentPage - (currentPage-1) % showNum}"></c:set> 
											<c:set var="endNum" value="${startNum + showNum}"></c:set>
											<c:set var="lastPage" value="${boardCount / rowPerPage}"></c:set>
											<fmt:formatNumber var="ceilLastPage" value="${lastPage + (1-(lastPage%1))%1 }"></fmt:formatNumber> <!-- 올림 --> 
											
											<!-- <<버튼 -->
											<c:if test="${currentPage-showNum > 0}"> 
												<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${startNum-1}&search=${search}">이전</a>
											</c:if>
											
											<!-- 페이지 번호 -->
											<c:forEach var="p" begin="${startNum}" end="${endNum-1}" step="1">
												<c:if test="${p <= ceilLastPage}">
													<a class="p-3" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${p}&search=${search}">${p}</a>
												</c:if>
											</c:forEach>
											
											<!-- >>버튼 -->
											<c:if test="${startNum + showNum < lastPage}">
												<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${startNum + showNum}&search=${search}">다음</a>
											</c:if>
										</div>
										<div class="d-flex justify-content-end">page : ${currentPage} / ${ceilLastPage}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				$('#rowPerPage').change(function() {
					$('#pageForm').submit();
				})				
			});
		</script>
		<script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
		<script src="${pageContext.request.contextPath}/js/template.js"></script>
		<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	</body>
</html>