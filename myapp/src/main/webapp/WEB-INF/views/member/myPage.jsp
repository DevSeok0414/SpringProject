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
				<a href="#" class="align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
		        	<span class="fs-4">나의 정보</span>
      			</a>
			</div>
		</div>
		
		<br>
		
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3"></div>
			<label for="id" class="col-2 col-form-label" style="text-align:center;">아이디</label>
			<div class="col-3">
				<span class="form-control" id="id">${member.id }</span>
			</div>
			<div class="col-4"></div>
		</div>

		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3"></div>
			<label for="name" class="col-2 col-form-label" style="text-align:center;">이름</label>
			<div class="col-3">
				<span class="form-control" id="name">${member.name }</span>
			</div>
			<div class="col-4"></div>
		</div>
		
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3"></div>
			<label for="phone" class="col-2 col-form-label" style="text-align:center;">전화번호</label>
			<div class="col-3">
				<span class="form-control" id="phone">${member.phone }</span>
			</div>
			<div class="col-4"></div>
		</div>
		
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3"></div>
			<label for="email" class="col-2 col-form-label" style="text-align:center;">이메일</label>
			<div class="col-3">
				<span class="form-control" id="email">${member.email }</span>
			</div>
			<div class="col-4"></div>
		</div>
		
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-3"></div>
			<label for="address" class="col-2 col-form-label" style="text-align:center;">주소</label>
			<div class="col-5">
				<span class="form-control" id="address1" style="width:58%; margin-bottom:10px;">${dto.address1 }</span>
				<span class="form-control" id="address2" style="margin-bottom:10px;">${dto.address2 }</span>
				<span class="form-control" id="address3" style="margin-bottom:10px;">${dto.address3 }</span>
				<span class="form-control" id="address4" style="width:58%; margin-bottom:10px;">${dto.address4 }</span>
				<span class="form-control" id="address5" style="width:58%; margin-bottom:10px;">${dto.address5 }</span>
			</div>
			<div class="col-2"></div>
		</div>

		<div class="row" style="margin-bottom: 10px;">
			<div class="col-4"></div>
			<div class="col-2" align="right">
				<button type="button" onclick="location.href='${path }/member/modify.do'" class="btn btn-outline-primary">정보 수정</button>
			</div>
			<div class="col-2" align="left">
				<button type="button" onclick="location.href='${path }/member/myOrder.do'" class="btn btn-outline-success">나의 주문</button>
			</div>
			<div class="col-4"></div>
		</div>
		
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>

</body>
</html>