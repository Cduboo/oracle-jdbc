<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>updateBoardForm</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/feather/feather.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/css/vendor.bundle.base.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vertical-layout-light/style.css">
		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/main.js"></script>
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
										<h4 class="card-title">MODIFY BOARD</h4>
										<!-- 게시글 수정 -->
										<div class="table-responsive pt-3">
											<form id="submitForm" action="${pageContext.request.contextPath}/board/updateBoard" method="post">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th class="table-active">#</th>
															<td class="p-2"><input class="form-control" type="text" value="${boardOne.boardNo}" name="boardNo" readonly="readonly"></td>
															<th class="table-active">writer</th>
															<td>${boardOne.memberId}</td>
															<th class="table-active">date</th>
															<td>${boardOne.createdate}</td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th class="table-active">title</th>
															<td class="p-2" colspan="5"><input class="form-control" type="text" id="boardTitle" value="${boardOne.boardTitle}" name="boardTitle"/></td>
														</tr>
														<tr>
															<th class="table-active" colspan="6">content</th>
														</tr>
														<tr>
															<td class="p-2" colspan="6">
																<textarea class="form-control" rows="5" cols="20" id="boardContent" name="boardContent">${boardOne.boardContent}</textarea>
															</td>
														</tr>
													</tbody>
												</table>
												<div class="d-flex justify-content-end mt-3">
													<button class="btn btn-sm btn-primary" type="button" id="submitBtn">update</button>
												</div>
											</form>
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