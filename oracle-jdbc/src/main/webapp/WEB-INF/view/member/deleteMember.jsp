<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>deleteMember</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
		<h1>deleteMember</h1>
		<form action="${pageContext.request.contextPath}/member/deleteMember" method="post">
			비밀번호 : <input type="password" name="memberPw">
			비밀번호 확인 : <input type="password" name="memberCkPw">
			<button type="submit">회원탈퇴</button>
		</form>
	</body>
</html>