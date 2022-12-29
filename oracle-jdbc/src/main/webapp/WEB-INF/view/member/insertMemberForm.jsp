<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>insertMemberForm</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vertical-layout-light/style.css">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" />
	</head>
	<body>
		<div class="container-scroller">
			<div class="container-fluid page-body-wrapper full-page-wrapper">
				<div class="content-wrapper d-flex align-items-center auth px-0">
					<div class="row w-100 mx-0">
						<div class="col-lg-4 mx-auto">
							<div class="auth-form-light text-left py-5 px-4 px-sm-5">
								<div class="brand-logo">
									<h1>SIGN UP</h1>
								</div>
								<h4>New here?</h4>
								<h6 class="font-weight-light">Signing up is easy. It only takes a few steps</h6>
								<form class="pt-3" action="${pageContext.request.contextPath}/member/insertMember" method="post">
									<div class="form-group">
										<input type="text" class="form-control form-control-lg" name="memberName" placeholder="Username">
									</div>
									<div class="form-group">
										<input type="text" class="form-control form-control-lg" name="memberId" placeholder="Userid">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-lg" name="memberPw" placeholder="Password">
									</div>
									<div class="mt-3">
										<button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">SIGN UP</button>
									</div>
									<div class="text-center mt-4 font-weight-light">
										Already have an account? <a href="${pageContext.request.contextPath}/member/login" class="text-primary">Login</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
			</div>
			<!-- page-body-wrapper ends -->
		</div>
		<!-- container-scroller -->
	</body>
</html>