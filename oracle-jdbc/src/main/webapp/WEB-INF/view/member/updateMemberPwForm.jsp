<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>updateMemberPw</title>
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
											<h4 class="card-title">CHANGE PASSWORD</h4>
											<form action="${pageContext.request.contextPath}/member/updateMemberPw" method="post">
												<div class="form-group row">
													<label for="password" class="col-sm-3 col-form-label">Password</label>
													<div class="col-sm-9">
														<input type="password" class="form-control" name="memberPw" id="password" placeholder="Password">
													</div>
												</div>
												<div class="form-group row">
													<label for="newMemberPw" class="col-sm-3 col-form-label">New Password</label>
													<div class="col-sm-9">
														<input type="password" class="form-control" name="newMemberPw" id="newMemberPw" placeholder="New Password">
													</div>
												</div>
												<div class="form-group row">
													<label for="newMemberPwCk" class="col-sm-3 col-form-label">New Password Check</label>
													<div class="col-sm-9">
														<input type="password" class="form-control" name="newMemberPwCk" id="newMemberPwCk" placeholder="New Password Check">
													</div>
												</div>
												<div class="d-flex justify-content-end mt-3">
													<button type="submit" class="btn btn-primary mr-2">change</button>
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