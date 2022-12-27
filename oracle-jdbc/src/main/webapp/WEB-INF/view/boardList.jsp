<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>boardList</title>
	</head>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<body>
		<h1>BOARD LIST</h1>
		<!-- 게시글 출력 개수 설정 -->
		<form id="pageForm" action="${pageContext.request.contextPath}/BoardListController" method="get">
			<select name="rowPerPage" id="rowPerPage">
				<c:if test="${rowPerPage == 10}">
					<option value="10" selected="selected">10</option>				
					<option value="20">20</option>
					<option value="30">30</option>
				</c:if>
				<c:if test="${rowPerPage == 20}">
					<option value="10">10</option>				
					<option value="20" selected="selected">20</option>
					<option value="30">30</option>
				</c:if>
				<c:if test="${rowPerPage == 30}">
					<option value="10">10</option>				
					<option value="20">20</option>
					<option value="30" selected="selected">30</option>
				</c:if>
			</select>
		</form>
		<!-- 게시글 리스트 -->
		<table border="1">
			<thead>
				<tr>
					<td>boardNo</td>
					<td>boardTitle</td>
					<td>createdate</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td>${board.boardNo}</td>
						<td><a href="">${board.boardTitle}</a></td>
						<td>${board.createdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 -->
		<div>
			<a href="${pageContext.request.contextPath}/BoardListController?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
			<a href="${pageContext.request.contextPath}/BoardListController?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
		</div>
		
		<script>
			$(document).ready(function() {
				$('#rowPerPage').change(function() {
					$('#pageForm').submit();
				})				
			});
		</script>
	</body>
</html>