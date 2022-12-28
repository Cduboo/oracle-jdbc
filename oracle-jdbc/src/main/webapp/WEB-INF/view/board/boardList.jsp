<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>boardList</title>
	</head>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<body>
		<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
		<h1>BOARD LIST</h1>
		<!-- 게시글 입력 -->
		<a href="${pageContext.request.contextPath}/board/insertBoard">글쓰기</a>
		<!-- 게시글 출력 개수 설정 -->
		<form id="pageForm" action="${pageContext.request.contextPath}/board/boardList" method="get">
			<input type="hidden" name="currentPage" value="${currentPage}">
			<input type="hidden" name="search" value="${search}">
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
					<td>글번호</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td>${board.boardNo}</td>
						<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${board.boardNo}">${board.boardTitle}</a></td>
						<td>${board.createdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 검색 -->
		<div>
			<form action="${pageContext.request.contextPath}/board/boardList">
				<input type="text" name="search" value="${search}" placeholder="제목 검색"/>
			</form>
		</div>
		<!-- 페이징 미완 -->
		<div>
			<c:set var="showNum" value="5"></c:set>
			<c:set var="startNum" value="${currentPage - (currentPage-1) % showNum}"></c:set> 
			<c:set var="endNum" value="${startNum + showNum}"></c:set>
			<c:set var="lastPage" value="${boardCount / rowPerPage}"></c:set>
			<fmt:formatNumber var="ceilLastPage" value="${lastPage + (1-(lastPage%1))%1 }"></fmt:formatNumber> <!-- 올림 --> 
			
			<!-- <<버튼 -->
			<c:if test="${currentPage-showNum > 0}"> 
				<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${startNum-1}&search=${search}">이전</a>
			</c:if>
			
			<!-- 페이지 번호 -->
			<c:forEach var="p" begin="${startNum}" end="${endNum-1}" step="1">
				<c:if test="${p <= ceilLastPage}">
					<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${p}&search=${search}">${p}</a>
				</c:if>
			</c:forEach>
			
			<!-- >>버튼 -->
			<c:if test="${startNum + showNum < lastPage}">
				<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${startNum + showNum}&search=${search}">다음</a>
			</c:if>
			
			page : ${currentPage} / ${ceilLastPage}
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