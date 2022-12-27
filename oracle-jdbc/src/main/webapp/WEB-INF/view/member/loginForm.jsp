<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginForm</title>
	</head>
	<body>
		<h1>로그인</h1>
		<form action="${pageContext.request.contextPath}/LoginActionController" method="post">
			아이디 : <input type="text" name="memberId"/>
			비밀번호 : <input type="password" name="memberPw"/>
			<button type="submit">로그인</button>
		</form>
		<a href="${pageContext.request.contextPath}/RegisterMemberFormController">회원가입</a>
	</body>
</html>