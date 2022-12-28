<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updateBoardForm</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
		<h1>글 수정</h1>
		<form action="${pageContext.request.contextPath}/board/updateBoard" method="post">
			글번호 : <input type="text" value="${boardOne.boardNo}" name="boardNo" readonly="readonly">
			제목 : <input type="text" value="${boardOne.boardTitle}" name="boardTitle"/>
			내용 : <textarea rows="5" cols="20" name="boardContent">${boardOne.boardContent}</textarea>
			작성일 : ${boardOne.createdate}
			<button type="submit">수정</button>
		</form>
	</body>
</html>