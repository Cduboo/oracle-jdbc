<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>insertBoardForm</title>
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
										<h4 class="card-title">WRITE BOARD</h4>
										<!-- 게시글 등록-->
										<div class="table-responsive pt-3">
											<form action="${pageContext.request.contextPath}/board/insertBoard" method="post">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th class="table-active">title</th>
															<td class="p-2" colspan="5"><input class="form-control" type="text" name="boardTitle"/></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th class="table-active" colspan="6">content</th>
														</tr>
														<tr>
															<td class="p-2" colspan="6">
																<textarea class="form-control" rows="5" cols="20" name="boardContent"></textarea>
															</td>
														</tr>
													</tbody>
												</table>
												<div class="d-flex justify-content-end mt-3">
													<button class="btn btn-sm btn-primary" type="submit">write</button>
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