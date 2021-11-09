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
				<h4 align="center">상품 등록</h4>
			</div>
		</div>
		
		<br>
		
		<form name="productSaveForm" method="POST" action="${path }/productSave.do" enctype="multipart/form-data">
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="productName" class="col-1 col-form-label">상품 이름</label>
				<div class="col-3">
					<input type="text" class="form-control" name="name" id="name" required>
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="productPrice" class="col-1 col-form-label">상품 가격</label>
				<div class="col-3">
					<input type="number" class="form-control" name="price" id="price" placeholder="단위 : 원" required>
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="productDiscription" class="form-label col-1">상품 설명</label>
				<div class="col-3">
					<textarea class="form-control" name="description" id="description" rows="3" style="height: 150px;" required></textarea>
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="file" class="form-label col-1">상품 이미지</label>
				<div class="col-3">
					<input type="file" class="form-control" name="file" id="file" required />
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-5"></div>
				<div class="col-2" align="right" style="margin-right: -9px;">
					<button type="submit" class="btn btn-outline-primary">상품 등록</button>
				</div>
				<div class="col-2" align="left">
					<button type="button" onclick="location.href='${path }/productList.do'" class="btn btn-outline-success">상품 목록</button>
				</div>
				<div class="col-3"></div>
			</div>

		</form>
	</div>
</div>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>