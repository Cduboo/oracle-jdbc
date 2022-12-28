<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertBoardForm</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
		<h1>글쓰기</h1>
		<form action="${pageContext.request.contextPath}/board/insertBoard" method="post">
			제목 : <input type="text" name="boardTitle"/>
			내용 : <textarea rows="5" cols="20" name="boardContent"></textarea>
			<button type="submit">글쓰기</button>
		</form>
	</body>
</html>