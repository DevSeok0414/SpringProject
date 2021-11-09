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
				<h4 align="center">포트폴리오용 웹프로젝트</h4>
				<p>
					2주간 Spring Framework를 이용하여 간단한 쇼핑몰을 만들었습니다.
					관리자 기능을 부여받은 아이디로만 관리자 페이지에 접속할 수 있으며
					비 로그인 시에는 상품 목록만 확인 가능합니다.<br><br>
					준비된 아이디와 비밀번호는 아래와 같습니다.<br><br>
					(관리자) 아이디 : admin 비밀번호 : admin<br>
					(사용자) 아이디 : guest 비밀번호 : guest
				</p>
			</div>
		</div>
		
		<div class="col-1"></div>
		
		<div class="col-3 d-flex align-items-start">
			<div>
				<h4 align="center">프로젝트 개발 환경</h4>
				<ul>
					<li>Spring Framework 3.1.1</li>
					<li>Java 11</li>
					<li>Oracle 11g</li>
					<li>MyBatis</li>
					<li>Maven</li>
					<li>JSP</li>
					<li>jQuery</li>
					<li>Ajax</li>
					<li>Spring Security</li>
					<li>Lombok</li>
					<li>BootStrap 5.1.3</li>
					<li>Eclipse 2020-12</li>
				</ul>
			</div>
		</div>
		
		<div class="col-2"></div>
	</div>
	
	<div class="row g-4 py-5">
		<div class="col-2"></div>
		<div class="col-8">
			<div>
				<h4 align="center">개발 소감</h4>
				<ol>
					<li style="margin-bottom:15px;">학원에서 팀 프로젝트로 배정된 수업 시간을 내용 교육하는데 써서 결국 개인 프로젝트로 진행을 했습니다.
						학원 친구들과 협업을 하면서 좀 더 규모있고 짜임새가 탄탄한 웹 사이트를 만들어보고 싶었는데 그 부분이 많이 아쉬웠습니다.
					</li>
					<li style="margin-bottom:15px;">AWS나 Heroku를 통해서 프로젝트를 배포해보려고 하였으나 SK브로드밴드가 현 주거중인 주택가의 ip는
						개인 서버 구축용 포트 번호들을 닫아놓아서 억지로 배포 해보기엔 시간 관계상 제한이 있었기 때문에 부득이하게 배포해보지 못해서 아쉬웠습니다.
					</li>
					<li style="margin-bottom:15px;">Ajax, JavaScript, jQuery를 활용해야 할 때가 많다는 것을 알게되었습니다.
						Ajax, JavaScript, jQuery를 써야할 때면 직접 찾으면서 배우면서 적용시켜야 했던 관계로 오랜 시간 막혀있기도 했었습니다. 
						특히 장바구니에 담긴 물품을 체크하면 총 금액이 바뀌는 기능은 몇 시간을 써가며 시행착오를 겪고나서야 구현할 수 있었습니다.
						추후 Ajax, JavaScript, jQuery에 대해서 더 많이 공부를 해야 할 필요성을 강하게 느꼈습니다.
					</li>
					<li style="margin-bottom:15px;">공백 처리, null값 처리 등 예외적인 상황에 대한 처리를 해야할 것이 많다는 것을 느꼈고
						현재는 그것을 꼼꼼하게 처리해내지는 못했다고 생각합니다. 계속 이 프로젝트를 가다듬어가면서 보다 더 정교한 웹 사이트로 만들어봐야 할 것 같습니다.
					</li>
				</ol>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
		
</div>

<%@ include file="./layout/footer.jsp" %>

</body>
</html>