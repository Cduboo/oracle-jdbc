<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>boardOne</title>
	</head>
	<body>
		글번호 : ${boardOne.boardNo}
		작성자 : ${boardOne.memberId}
		제목 : ${boardOne.boardTitle}
		내용 : ${boardOne.boardContent}
		작성일 : ${boardOne.createdate}
		
		<a href="${pageContext.request.contextPath}/ModifyBoardFormController?boardNo=${boardOne.boardNo}">수정</a>
		<a href="${pageContext.request.contextPath}/removeBoardActionController?boardNo=${boardOne.boardNo}">삭제</a>
	</body>
</html>