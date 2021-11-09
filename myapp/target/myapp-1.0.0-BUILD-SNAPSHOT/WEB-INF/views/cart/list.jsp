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
.productImage {
	max-width: 150px;
	max-height: 150px;
}
</style>
</head>
<body>

<jsp:include page="../layout/header.jsp"  flush="true" />

<%-- <div class="album py-5 bg-light">
	<div class="container">
		<div class="row">
			<div class="col" style="text-align:center;">
				<a href="${path}/product/list.do" class="align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
		        	<span class="fs-4">장바구니</span>
      			</a>
			</div>
		</div>
		
		<br>
		<br>
		
		<div class="container">
			<div class="row">
				<div class="form-check col-2">
					<input class="form-check-input" type="checkbox" value="" id="flexCheck">
					<label class="form-check-label" for="flexCheck">전체 선택</label>
				</div>
				<div class="col-5">상품</div>
				<div class="col-2">금액</div>
				<div class="col-1">수량</div>
				<div class="col-2">상품 금액</div>
			</div>
		
			<div class="row">
				<a>상품내용</a>
			</div>
			
			<hr>
			
			<div class="row">
				<div class="col-10"></div>
				<div class="col-2">총 금액 : </div>
			</div>
			
			<div class="row">
				<div class="col-4"></div>
				<div class="col-2">계속 쇼핑하기</div>
				<div class="col-2">주문하기</div>
				<div class="col-4"></div>
			</div>
		</div>
	</div>
</div> --%>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>