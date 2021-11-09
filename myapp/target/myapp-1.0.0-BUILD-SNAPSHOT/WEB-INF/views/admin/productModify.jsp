<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.productImage {
	max-width: 500px;
	max-height: 500px;
}
</style>
</head>
<body>

<jsp:include page="../layout/header.jsp"  flush="true" />

<div class="album py-5 bg-light">
	<div class="container">

		<div class="row">
			<div class="col" style="text-align:center;">
				<h4 align="center">상품 수정</h4>
			</div>
		</div>
		
		<br>

		<form name="productModifyForm" method="POST" action="${path }/productModify.do" enctype="multipart/form-data">
			<input type="hidden" name="no" id="no" value="${dto.no }">
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="productName" class="col-1 col-form-label">상품 이름</label>
				<div class="col-3">
					<input type="text" class="form-control" name="name" id="name" value="${dto.name }" required>
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="productPrice" class="col-1 col-form-label">상품 가격</label>
				<div class="col-3">
					<input type="number" class="form-control" name="price" id="price" value="${dto.price }" required>
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="productDiscription" class="form-label col-1">상품 설명</label>
				<div class="col-3">
					<textarea class="form-control" name="description" id="description" rows="3" style="height: 150px;" required>${dto.description }</textarea>
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="productImage" class="form-label col-1">상품 이미지</label>
				<div class="col-5">
					<img src="/thumbnailPath/${dto.productImage}" class="productImage">
				</div>
				<div class="col-2"></div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<label for="file" class="form-label col-1">바꿀 이미지</label>
				<div class="col-3">
					<input type="file" class="form-control" name="file" id="file" required />
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-7"></div>
				<div class="col-2" align="left" style="margin-left: -4px;">
					<button type="submit" class="btn btn-primary">수정하기</button>
				</div>
				<div class="col-3"></div>
			</div>
			
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<div class="btn-group col-4" role="group">
				  <button type="button" onclick="location.href='${path }/productList.do'" class="btn btn-outline-primary btn-block">상품 목록</button>
				  <button type="button" onclick="location.href='${path }/productSave.do'" class="btn btn-outline-primary">상품 등록</button>
				  <button type="button" onclick="location.href='${path }/productModify.do?no=${dto.no }'" class="btn btn-outline-primary">상품 수정</button>
				  <button type="button" onclick="location.href='${path }/productRemove.do?no=${dto.no }'" class="btn btn-outline-primary">상품 삭제</button>
				</div>
				<div class="col-4"></div>
			</div>

		</form>
	</div>
</div>

<%@ include file="../layout/footer.jsp" %>


</body>
</html>