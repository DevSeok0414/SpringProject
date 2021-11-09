<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
</style>
</head>
<body>

<jsp:include page="../layout/header.jsp"  flush="true" />

<div class="album py-5 bg-light">
	<div class="container">

		<div class="row">
			<div class="col" style="text-align:center;">
				<h4 align="center">로그인</h4>
			</div>
		</div>
		
		<br>
		
		<form name="loginForm" method="POST" action="${path }/member/login.do">
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="id" class="col-1 col-form-label">아이디</label>
				<div class="col-3">
					<input type="text" class="form-control" name="id" id="id" required>
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="password" class="col-1 col-form-label">비밀번호</label>
				<div class="col-3">
					<input type="password" class="form-control" name="password" id="password" required>
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-5"></div>
				<div class="col-2" align="right" style="margin-right: -14px;margin-left:-10px;">
					<button type="submit" class="btn btn-outline-primary">로그인</button>
				</div>
				
				<div class="col-2">
					<button type="button" onclick="location.href='${path }/member/signup.do'" class="btn btn-outline-success">회원 가입</button>
				</div>
				<div class="col-3"></div>
				
				<c:if test="${msg == false}">
					<p style="color:#f00;">로그인을 실패했습니다. 아이디와 비밀번호를 다시 확인해주세요.</p>
				</c:if>
				
			</div>

		</form>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>

</body>
</html>