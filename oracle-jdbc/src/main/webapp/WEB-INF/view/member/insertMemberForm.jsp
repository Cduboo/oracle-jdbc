<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertMemberForm</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
		<h1>회원가입</h1>
		<form action="${pageContext.request.contextPath}/member/insertMember" method="post">
			이름 : <input type="text" name="memberName"/>
			아이디 : <input type="text" name="memberId"/>
			패스워드 : <input type="password" name="memberPw">
			<button type="submit">회원가입</button>
		</form>
	</body>
</html>