<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 비로그인 회원  -->
<c:if test="${empty loginMember}">
	<a href="${pageContext.request.contextPath}/member/login">로그인</a>	
	<a href="${pageContext.request.contextPath}/member/insertMember">회원가입</a>	
</c:if>

<!-- 로그인 회원  -->
<c:if test="${!(empty loginMember)}">
	<a href="${pageContext.request.contextPath}/home">홈</a>
	${loginMember.memberName}님 안녕하세요.
	<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
	why? 오라클 사용하여 model2프로젝트 진행해보기 
	
	<a href="${pageContext.request.contextPath}/member/memberOne">마이페이지</a>
	<a href="${pageContext.request.contextPath}/board/boardList">게시판</a>
</c:if>