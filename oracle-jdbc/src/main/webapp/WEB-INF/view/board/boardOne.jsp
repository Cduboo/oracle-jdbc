<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>boardOne</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
		<h1>글 상세보기</h1>
		글번호 : ${boardOne.boardNo}
		작성자 : ${boardOne.memberId}
		제목 : ${boardOne.boardTitle}
		내용 : ${boardOne.boardContent}
		작성일 : ${boardOne.createdate}
		<c:if test="${boardOne.memberId == loginMember.memberId}">
			<a href="${pageContext.request.contextPath}/board/updateBoard?boardNo=${boardOne.boardNo}">수정</a>
			<a href="${pageContext.request.contextPath}/board/deleteBoard?boardNo=${boardOne.boardNo}">삭제</a>
		</c:if>
	</body>
</html>