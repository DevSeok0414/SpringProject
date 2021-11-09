<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#allCheck').click(function(){
        if($("#allCheck").prop("checked")){
           $("input[name=check]").prop("checked",true); 
           
           var priceArr = new Array();
			
			$("input[name='check']:checked").each(function () {
	            priceArr.push($(this).attr("data-no"));
	        });
			
			$.ajax({
	            url: "/myapp/cart/allPrice.do",
	            type: "post",
	            data: { priceArr : priceArr },
	            success: function (allPrice) {
	            	
	            	var orderPrice = allPrice;
	            	var formOrderPrice = orderPrice.toLocaleString();
	            	
	            	if(orderPrice != null && orderPrice != 0) {
	            		$('#allPrice span').text(formOrderPrice+"원");
	            		
	            	} else {
	            		$('#allPrice span').text('0원');
	            	}
	            }
	        });
       }else{
           $("input[name=check]").prop("checked",false); 
           
           $('#allPrice span').text('0원');
       }
   });
				 
});
</script>
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

<div class="album py-5 bg-light">
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
				<div class="allCheck form-check col-2">
					<input class="form-check-input" type="checkbox" id="allCheck" name="allCheck">
					<label class="form-check-label" for="allCheck">전체 선택</label>
				</div>
				
				<div class="col-5" align="center">상품</div>
				<div class="col-2">금액</div>
				<div class="col-1">수량</div>
				<div class="col-2">상품 금액</div>
			</div>
			
			<br>
		
				<c:if test="${!empty cartList}">
					<c:forEach var="cartList" items="${cartList }" varStatus="status">
						<div class="row" style="margin-bottom:10px;">
							<div class="check form-check col-2">
								<input class="form-check-input" type="checkbox" id="check" name="check" data-no="${cartList.no }">
							</div>
							<script>
								$(".check").click(function(){
									
									$("#allCheck").prop("checked", false);
									
									var priceArr = new Array();
									
									$("input[name='check']:checked").each(function () {
							            priceArr.push($(this).attr("data-no"));
							        });
									
									$.ajax({
							            url: "/myapp/cart/allPrice.do",
							            type: "post",
							            data: { priceArr : priceArr },
							            success: function (allPrice) {
							            	
							            	var orderPrice = allPrice;
							            	var formOrderPrice = orderPrice.toLocaleString();
							            	
							            	if(allPrice != null && allPrice != 0) {
							            		$('#allPrice span').text(formOrderPrice+"원");
							            		
							            	} else {
							            		$('#allPrice span').text('0원');
							            	}
							            }
							        });
									
									var checkedCount = $("input:checkbox[name='check']:checked").length;
									
									if(checkedCount == 0) {
										$('#allPrice span').text('0원');
									}
									
									
								});
								
							</script>
							
							<div class="col-2">
								<img src="/thumbnailPath/${cartList.productImage}" class="productImage" id="productImage" name="productImage">
							</div>
							<div class="col-3">
								<span id="name">${cartList.name }</span>
							</div>
							<div class="col-2">
								<fmt:formatNumber value="${cartList.price }" pattern="###,###,###"/>원
							</div>
							<div class="col-1">
								<span id="name">${cartList.productAmount }개</span>
							</div>
							<div class="col-2">
								<fmt:formatNumber value="${cartList.totalPrice }" pattern="###,###,###"/>원
							</div>
						</div>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty cartList}">
					<br>
					<div class="row">
						<div class="col">
							<h4>장바구니에 담겨진 상품이 없습니다. 구매를 원하시는 상품을 장바구니에 담아주세요.</h4>
						</div>
					</div>
				</c:if>
			
			<hr>
			
			<div class="row">
				<div class="col-3" role="group">
				  <button type="button" class="btn btn-outline-success" id="removeButton" name="removeButton">선택 삭제</button>
				  <c:if test="${!empty cartList}">
				  <script>
					$("#removeButton").click(function () {
					    var confirm_val = confirm("정말 삭제하시겠습니까?");
					
					    if (confirm_val) {
					        var checkArr = new Array();
					
					        $("input[name='check']:checked").each(function () {
					            checkArr.push($(this).attr("data-no"));
					        });
					
					        $.ajax({
					            url: "/myapp/cart/removeCart.do",
					            type: "post",
					            data: { checkArr : checkArr },
					            success: function (result) {
					            	
					            	if(result == 1) {
					            		alert("삭제 되었습니다.");
						                location.href = "${path}/cart/list.do";	
					            	} else {
					            		alert("삭제 실패했습니다.");
					            	}
					            	
					            }
					        });
					    }
					});
					</script>
					</c:if>
					<c:if test="${empty cartList}">
				  	<script>
					$("#removeButton").click(function () {
					    alert("삭제 할 상품이 없습니다.");
					});
					</script>
					</c:if>
				</div>
				<div class="col-6"></div>
				<div class="col-1">
					<span>총 금액 : </span>
				</div>
				<div class="col-2" id="allPrice">
					<span>0원</span> 
				</div>
			</div>
			
			<br>
			
			<div class="row">
				<div class="col-4"></div>
				<div class="col-2">
					<button type="button" onclick="location.href='${path }/product/list.do'" class="btn btn-outline-success">계속 쇼핑하기</button>
				</div>
				<div class="col-2">
					<button type="button" class="btn btn-outline-success" id="orderButton" name="orderButton">주문하기</button>
					<c:if test="${!empty cartList}">
				 	<script>
					$("#orderButton").click(function () {
					    var confirm_val = confirm("선택된 상품을 주문하시겠습니까?");
					
					    if (confirm_val) {
					        var checkArr = new Array();
					
					        $("input[name='check']:checked").each(function () {
					            checkArr.push($(this).attr("data-no"));
					        });
					
					        $.ajax({
					            url: "/myapp/order/checkArr.do",
					            type: "POST",
					            data: JSON.stringify(checkArr),
					            contentType: "application/json",
					            success: function(checkArr) {
					            	location.href="${path}/order/list.do/"+checkArr;
					            }
						                	
				            })
				        }
				    });
					</script>
					</c:if>
					<c:if test="${empty cartList}">
				  	<script>
					$("#orderButton").click(function () {
					    alert("주문 할 상품이 없습니다.");
					});
					</script>
					</c:if>
				</div>
				<div class="col-4"></div>
			</div>
			
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp" %>

</body>

</html>