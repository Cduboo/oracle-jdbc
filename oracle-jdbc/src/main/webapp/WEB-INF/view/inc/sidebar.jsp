<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 사이드 메뉴 -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<!-- 비로그인 회원  -->
	<c:if test="${empty loginMember}">
		<ul class="nav">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/member/login">
					<i class="icon-head menu-icon"></i><span class="menu-title">LOGIN</span>
				</a>
			</li>
		</ul>
	</c:if>
	<!-- 로그인 회원  -->
	<c:if test="${!(empty loginMember)}">
		<ul class="nav">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/home">
					<i class="icon-grid menu-icon"></i><span class="menu-title">HOME</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="collapse" href="#mypage" aria-expanded="false" aria-controls="mypage">
					<i class="icon-head menu-icon"></i><span class="menu-title">MYPAGE</span><i class="menu-arrow"></i>
				</a>
				<div class="collapse" id="mypage">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/member/updateMember">Edit My Information</a>
						</li>
					</ul>
					<ul class="nav flex-column sub-menu">
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/member/updateMemberPw">Change Password</a>
						</li>
					</ul>
					<ul class="nav flex-column sub-menu">
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/member/deleteMember">Delete account</a>
						</li>
					</ul>
				</div>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/board/boardList">
					<i class="icon-paper menu-icon"></i><span class="menu-title">BOARD</span>
				</a>
			</li>
		</ul>
	</c:if>
</nav>
