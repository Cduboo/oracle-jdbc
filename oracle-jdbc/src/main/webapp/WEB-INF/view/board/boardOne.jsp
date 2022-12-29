<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>boardOne</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/feather/feather.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/css/vendor.bundle.base.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vertical-layout-light/style.css">
	</head>
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
										<h4 class="card-title">BOARD ONE</h4>
										<!-- 게시글 상세 정보 -->
										<div class="table-responsive pt-3">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th class="table-active">#</th>
														<td>${boardOne.boardNo}</td>
														<th class="table-active">writer</th>
														<td>${boardOne.memberId}</td>
														<th class="table-active">date</th>
														<td>${boardOne.createdate}</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th class="table-active">title</th>
														<td colspan="5">${boardOne.boardTitle}</td>
													</tr>
													<tr>
														<th class="table-active" colspan="6">content</th>
													</tr>
													<tr>
														<td style="vertical-align: top;" colspan="6" height="400px">${boardOne.boardContent}</td>
													</tr>
												</tbody>
											</table>
											<c:if test="${boardOne.memberId == loginMember.memberId}">
												<div class="d-flex justify-content-end mt-3">
													<a class="btn btn-sm btn-primary mx-3" href="${pageContext.request.contextPath}/board/updateBoard?boardNo=${boardOne.boardNo}">수정</a>
													<a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/board/deleteBoard?boardNo=${boardOne.boardNo}">삭제</a>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
		<script src="${pageContext.request.contextPath}/js/template.js"></script>
		<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	</body>
</html>