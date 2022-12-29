<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 상단 메뉴 -->
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
	<div class="container">
		<div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
			<a class="navbar-brand brand-logo mr-5" href="${pageContext.request.contextPath}/home">
				<!-- 로고 이미지 -->
				BOARD
			</a> 
			<a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/home">
				B
			</a>
		</div>
		<div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
			<button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
				<span class="icon-menu"></span>
			</button>
			<ul class="navbar-nav navbar-nav-right">
				<li class="nav-item nav-profile dropdown">
					<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown"> 
						<!-- 회원 이미지 --> 
						<i class="icon-head menu-icon"></i>
					</a>
					<div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
						<c:if test="${empty loginMember}">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/login">
								<i class="icon-head menu-icon"></i>LOGIN
							</a>
						</c:if>
						<c:if test="${!(empty loginMember)}">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberOne">
								<i class="icon-head menu-icon"></i>MYPAGE
							</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">
								<i class="ti-power-off text-primary"></i>LOGOUT
							</a>
						</c:if>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>