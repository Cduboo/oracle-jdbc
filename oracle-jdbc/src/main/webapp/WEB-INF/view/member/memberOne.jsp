<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>memberOne</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
		<h1>마이페이지</h1>
		아이디 : ${loginMember.memberId}
		이름 : ${loginMember.memberName}
		
		<a href="${pageContext.request.contextPath}/member/updateMember">내정보 수정</a>
		<a href="${pageContext.request.contextPath}/member/updateMemberPw">비밀번호 변경</a>
		<a href="${pageContext.request.contextPath}/member/deleteMember">회원탈퇴</a>
	</body>
</html>