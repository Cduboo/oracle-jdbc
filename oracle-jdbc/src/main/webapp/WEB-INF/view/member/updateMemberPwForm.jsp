<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updateMemberPw</title>
	</head>
	<body>
		<h1>비밀번호 변경</h1>
		<form action="${pageContext.request.contextPath}/member/updateMemberPw" method="post">
			비밀번호 : <input type="password" name="memberPw"/>
			새 비밀번호 : <input type="password" name="newMemberPw"/>
			새 비밀번호 확인 : <input type="password" name="newMemberPwCk"/>
			<button type="submit">변경</button>
		</form>
	</body>
</html>