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
.abc {
	display: flex;
  	justify-content: center;
}
</style>
</head>
<body>

<jsp:include page="../layout/header.jsp"  flush="true" />

<div class="album py-5 bg-light">
	<div class="container">
		<div class="row">
			<div class="col" style="text-align:center;">
				<a href="#" class="align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
		        	<span class="fs-4">${orderDTO.no }번 주문 상세 정보</span>
      			</a>
			</div>
		</div>
		
		<br>
		
		<div class="row">
			<div class="col-3" align="center"></div>
			<div class="col-3" align="center">
				<span>상품명</span>
			</div>
			<div class="col-1" align="center">
				<span>상품 갯수</span>
			</div>
			<div class="col-1" align="center">
				<span>상품 가격</span>
			</div>
			<div class="col-1" align="center">
				<span>합계 가격</span>
			</div>
			<div class="col-3" align="center"></div>
		</div>
		
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<hr style="border: solid 1px black;">
			</div>
			<div class="col-3"></div>
		</div>
		
		<c:choose>
			<c:when test="${!empty orderDetailList}">
				<c:forEach var="orderDetailList" items="${orderDetailList}" varStatus="status">
					<div class="row">
						<div class="col-3" align="center"></div>
						<div class="col-3" align="center">
							<span>${productNameList[status.index]}</span>
						</div>
						<div class="col-1" align="center">
							<span>${orderDetailList.productAmount }개</span>
						</div>
						<div class="col-1" align="center">
							<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${orderDetailList.productPrice / orderDetailList.productAmount }" />원
						</div>
						<div class="col-1" align="center">
							<span>${orderDetailList.productPrice }원</span>
						</div>
						<div class="col-2" align="center"></div>
					</div>
					<div class="row">
						<div class="col-3"></div>
						<div class="col-6">
							<hr>
						</div>
						<div class="col-3"></div>
					</div>			
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="col-4"></div>
				<div class="col-4" align="center">
					<h3>주문하신 내역이 없습니다.</h3>
				</div>
				<div class="col-4"></div>
			</c:otherwise>
		</c:choose>
		
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-4"></div>
			<div class="col-2" align="center">
				<span>현재 주문 상태 : </span>
			</div>
			<div class="col-2" align="center">
				<span>[${orderDTO.status }]</span>
			</div>
			<div class="col-4"></div>
		</div>
		
		<form id="modifyOrderStatusForm" name="modifyOrderStatusForm" method="POST" action="${path }/admin/modifyOrderStatus.do">
			<div class="row" style="margin-bottom: 20px;">
				<div class="col-4"></div>
				<div class="col-2" align="center">
					<span>바꿀 주문 상태 </span>
				</div>
				<div class="col-2" align="center">
					<select class="form-select" id="status" name="status">
						<option value="주문접수" selected>주문접수</option>
						<option value="결제완료">결제완료</option>
						<option value="상품준비중">상품준비중</option>
						<option value="배송준비중">배송준비중</option>
						<option value="배송시작">배송시작</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
					</select>
				</div>
				<div class="col-4"></div>
			</div>
			<input type="hidden" id="no" name="no" value="${orderDTO.no }">
		</form>
		
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-4"></div>
			<div class="col-2" align="center">
				<button type="button" onclick="modify();" class="btn btn-outline-success">주문 상태 수정</button>
			</div>
			<div class="col-2" align="center">
				<button type="button" onclick="location.href='${path }/admin/orderList.do'" class="btn btn-outline-success">주문 목록</button>
			</div>
			<div class="col-4"></div>
		</div>
		
	</div>
</div>


			
			

<%@ include file="../layout/footer.jsp" %>

</body>
<script type="text/javascript">
	function modify() {
		document.getElementById('modifyOrderStatusForm').submit();
	}
</script>

</html>