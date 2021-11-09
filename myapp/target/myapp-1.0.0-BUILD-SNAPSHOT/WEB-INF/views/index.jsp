<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layout/config.jsp" %>
<c:set var="realPath" value="C:\sj\workspace_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\myapp\resources"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.thumbnail {
	width: 200px;
	max-height: 200px;
}
</style>
</head>
<body>

<jsp:include page="./layout/header.jsp"  flush="true" />

<div class="container bg-light">
	<div style="text-align: center;">
		<img src="${path }/resources/images/main2.png" class="img-fluid"
			alt="main page image" width="80%">
	</div>
</div>

<div class="container px-4 py-5">
	<h2 class="pb-2 border-bottom" style="text-align: center;">사이트 안내</h2>
	<div class="row g-4 py-5">
		<div class="col-2"></div>
		
		<div class="col-4 d-flex align-items-start">
			<div>
				<h4>포트폴리오용 웹프로젝트</h4>
				<p>
					Spring Framework를 이용해 간단한 쇼핑몰을 만들었습니다. 회원가입을 직접 진행하셔서 웹페이지를 이용하셔도 되고 준비된
					아이디를 통해 웹사이트를 이용해보셔도 됩니다. 준비된 아이디와 비밀번호는 아래와 같습니다.<br><br>
					(관리자) 아이디 : admin 비밀번호 : admin<br>
					(사용자) 아이디 : user 비밀번호 : user<br>
					<br>
					비 로그인 시 상품 목록만 확인 가능합니다.
				</p>
			</div>
		</div>
		
		<div class="col-1"></div>

		<div class="col-3 d-flex align-items-start">
			<div>
				<h4>프로젝트 개발환경</h4>
				<ul>
					<li>Spring Framework 3.1.1</li>
					<li>Java 11</li>
					<li>Oracle 11g</li>
					<li>MyBatis</li>
					<li>Maven</li>
					<li>JSP</li>
					<li>BootStrap 5.1.3</li>
					<li>Lombok</li>
					<li>Eclipse 2020-12</li>
				</ul>
			</div>
		</div>
		
		<div class="col-2"></div>

	</div>
</div>

<%@ include file="./layout/footer.jsp" %>

</body>
</html>