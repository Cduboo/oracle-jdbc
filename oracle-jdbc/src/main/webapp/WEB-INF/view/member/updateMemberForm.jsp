<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updateMemberForm</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
		<h1>내정보 수정</h1>
		<form action="${pageContext.request.contextPath}/member/updateMember" method="post">
			아이디 : <input type="text" value="${loginMember.memberId}" readonly="readonly">
			이름 : <input type="text" value="${loginMember.memberName}" name="memberName">
			<button type="submit">수정</button>
		</form>
	</body>
</html>