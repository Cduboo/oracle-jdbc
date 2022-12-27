<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updateBoardForm</title>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/ModifyBoardActionController">
			글번호 : <input type="text" value="${boardOne.boardNo}" name="boardNo" readonly="readonly">
			제목 : <input type="text" value="${boardOne.boardTitle}" name="boardTitle"/>
			내용 : <textarea rows="5" cols="20" name="boardContent">${boardOne.boardContent}</textarea>
			작성일 : ${boardOne.createdate}
			<button type="submit">수정</button>
		</form>
	</body>
</html>