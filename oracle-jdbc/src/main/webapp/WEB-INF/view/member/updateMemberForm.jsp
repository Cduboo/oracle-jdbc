<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>updateMemberForm</title>
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
								<div class="container">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title">EDIT MY INFOMATION</h4>
											<form action="${pageContext.request.contextPath}/member/updateMember" method="post">
												<div class="form-group row">
													<label for="id" class="col-sm-3 col-form-label">ID</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" value="${loginMember.memberId}" readonly="readonly">
													</div>
												</div>
												<div class="form-group row">
													<label for="id" class="col-sm-3 col-form-label">NAME</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" value="${loginMember.memberName}" name="memberName">
													</div>
												</div>
												<div class="d-flex justify-content-end mt-3">
													<button type="submit" class="btn btn-primary mr-2">edit</button>
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