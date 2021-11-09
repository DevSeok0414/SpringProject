<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/config.jsp" %>
<%-- <c:set var="realPath" value="C:\sj\workspace_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\myapp\resources"></c:set> --%>
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
				<a href="#" class="align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
		        	<span class="fs-4">결제 완료</span>
      			</a>
			</div>
		</div>
		
		<br>
		<br>
		
		<div class="row" style="margin-bottom: 3px;">
			<div class="col-4"></div>
			<div class="col" align="center">
				<h5>구매해 주셔서 감사합니다.<br>
					주문 번호는 [${orderNo }]입니다.</h5>
			</div>
			<div class="col-4"></div>
		</div>

	</div>
</div>


<%@ include file="../layout/footer.jsp" %>

</body>
</html>