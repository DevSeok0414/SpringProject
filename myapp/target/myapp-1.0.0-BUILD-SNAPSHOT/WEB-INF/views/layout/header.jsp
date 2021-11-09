<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires",-1);	//0
	
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<c:set var="url" value="${pageContext.request.requestURL}"></c:set>
<c:set var="uri" value="${pageContext.request.requestURI}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>Spring MVC</title>
</head>
<body>

<div class="container">
	<!-- 로그인 하지 않았을 때 -->
	<c:if test="${member eq null}">
		<header class="d-flex flex-wrap justify-content-center py-3 mb-2 border-bottom">
	      <a href="${path}/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
	        <span class="fs-4">오늘의 코디</span>
	      </a>

	      <ul class="nav nav-pills">
	        <li class="nav-item"><a href="${path }/product/list.do" class="nav-link">상품목록</a></li>
	        <li class="nav-item"><a href="${path }/cart/list.do" class="nav-link">장바구니</a></li>
	        <li class="nav-item"><a href="${path }/board/list.do" class="nav-link">문의게시판</a></li>
        	<li class="nav-item"><a href="${path }/member/login.do" class="nav-link">로그인</a></li>
        	<li class="nav-item"><a href="${path }/member/signup.do" class="nav-link">회원가입</a></li>
	      </ul>
   		</header>
	</c:if>
	
	<!-- 로그인 했을 때 -->		
	<c:if test="${member ne null}">
		<!-- 일반 유저일 때 -->
		<c:if test="${auth eq 0}">
			<header class="d-flex flex-wrap justify-content-center py-3 mb-2 border-bottom">
				<a href="${path}/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
					<span class="fs-4">오늘의 코디</span>
				</a>

				<ul class="nav nav-pills">
					<li class="nav-item"><a href="${path }/product/list.do" class="nav-link">상품목록</a></li>
					<li class="nav-item"><a href="${path }/cart/list.do" class="nav-link">장바구니</a></li>
					<li class="nav-item"><a href="${path }/board/list.do" class="nav-link">문의게시판</a></li>
					<li class="nav-item"><a href="${path }/member/mypage.do" class="nav-link">마이페이지</a></li>
	        		<li class="nav-item"><a href="${path }/member/logout.do" class="nav-link">로그아웃</a></li>
				</ul>
   			</header>
		</c:if>
		
		<!-- 관리자일 때 -->
		<c:if test="${auth eq 1}">
			<header class="d-flex flex-wrap justify-content-center py-3 mb-3 border-bottom">
				<a href="${path}/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
					<span class="fs-4">오늘의 코디</span>
				</a>

				<ul class="nav nav-pills">
					<li class="nav-item"><a class="nav-link text-dark"><b>관리자 페이지</b></a>
					<li class="nav-item"><a href="#" class="nav-link">회원관리</a></li>
					<li class="nav-item"><a href="${path }/productList.do" class="nav-link">상품관리</a></li>
					<li class="nav-item"><a href="#" class="nav-link">주문관리</a></li>
					<li class="nav-item"><a href="#" class="nav-link">문의게시판</a></li>
					<li class="nav-item"><a href="${path }/member/logout.do" class="nav-link">로그아웃</a></li>
				</ul>
   			</header>
		</c:if>
		
	</c:if>
</div>