<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#amountSelect").change(function() {
			$("#productAmount").val($(this).val());
		});
	});
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.productImage {
	max-width: 500px;
	max-height: 500px;
}
</style>
</head>
<body>

<jsp:include page="../layout/header.jsp" flush="true" />

<div class="album py-5 bg-light">
	<div class="container">
		<div class="row">
			<div class="col" style="text-align:center;">
				<a href="${path}/product/list.do" class="align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
		        	<span class="fs-4">상품 상세</span>
      			</a>
			</div>
		</div>
		
		<br>
		<br>
		
		<div class="container">
			<div class="row">
				<div class="col-4"></div>
				<div class="col-1" style="margin-top: 8px;">상품 이름</div>
				<div class="col-sm-3">
					<p class="form-control">${dto.name }</p>
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row" style="margin-bottom: 16px;">
				<div class="col-4"></div>
				<div class="col-1" style="margin-top: 8px;">상품 가격</div>
				<div class="col-3">
					<div class="form-control">
					<fmt:formatNumber value="${dto.price }" pattern="###,###,###"/>원
					</div>
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row">
				<div class="col-4"></div>
				<div class="col-1" style="margin-top: 8px;">상품 설명</div>
				<div class="col-3">
					<p class="form-control">${dto.description }</p>
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row" style="margin-bottom: 20px;">
				<div class="col-4" style="margin-bottom: -20px;"></div>
				<div class="col-1" style="margin-top: 8px;">등록일</div>
				<div class="col-3">
					<div class="form-control">
						<fmt:formatDate value="${dto.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</div>
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row" style="margin-bottom: 20px;">
				<div class="col-4"></div>
				<div class="col-1">이미지</div>
				<div class="col-3">
					<img src="/thumbnailPath/${dto.productImage}" class="productImage">
				</div>
				<div class="col-4"></div>
			</div>
			
			<input type="hidden" name="productNo" id="productNo" value="${dto.no }">
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-4"></div>
				<div class="col-2" style="margin-right: -10px;">
					<input type="hidden" name="productAmount" id="productAmount">
					<select class="form-select" name="amountSelect" id="amountSelect">
					  <option value="1" selected>1개</option>
					  <c:forEach var="i" begin="2" end="10">
					  	<option value="${i }">${i }개</option>
					  </c:forEach>
					</select>
				</div>
				
				<button type="submit" onclick="saveCart();" class="btn btn-outline-success btn-block col-2">장바구니에 담기</button>
				<div class="btn-group col-3" role="group">
				  <button type="button" onclick="location.href='${path }/product/list.do'" class="btn btn-outline-primary">상품 목록</button>
				  <button type="button" onclick="location.href='${path }/cart/list.do';" class="btn btn-outline-primary">장바구니 이동</button>
				</div>
				
				<div class="col-1"></div>
			</div>
			
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp" %>

</body>


<script type="text/javascript">
	function saveCart() {
		var productNo = $("#productNo").val();
		var productAmount = $("#amountSelect").val();
		
		var data = {
				productNo : productNo,
				productAmount : productAmount
		};
		
		$.ajax({
			url : "/myapp/cart/save.do",
			type : "post",
			data : data,
			success : function(result) {
				
				if(result == 1) {
					alert("카트 담기 성공");
					$("#amountSelect").val("1");
				} else {
					alert("로그인 상태에서 이용할 수 있습니다.")
					$("#amountSelect").val("1");
					false;
				}
			},
			error : function() {
				alert("카트 담기 실패");
				false;
			}
		});
		
	}
</script>

</html>