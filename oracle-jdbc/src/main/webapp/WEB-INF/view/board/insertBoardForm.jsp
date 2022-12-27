<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertBoardForm</title>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/RegisterBoardActionController">
			제목 : <input type="text" name="boardTitle"/>
			내용 : <textarea rows="5" cols="20" name="boardContent"></textarea>
			<button type="submit">글쓰기</button>
		</form>
	</body>
</html>