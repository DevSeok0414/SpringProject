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
	max-width: 100px;
	max-height: 100px;
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
		        	<span class="fs-4">주문 / 결제</span>
      			</a>
			</div>
		</div>
		
		<br>
		<br>
		
		<div class="row" style="margin-bottom: 3px;">
			<div class="col-4"></div>
			<div class="col" align="center" style="border-top:1px solid;">
				<h5>구매자 정보</h5>
			</div>
			<div class="col-4"></div>
		</div>

	<c:forEach var="memberList" items="${memberList }">
		<div class="row" style="margin-bottom: 3px;">
			<div class="col-4"></div>
			<div class="col-1" style="margin-top: 8px;">이름</div>
			<div class="col-3">
				<input class="form-control" value="${memberList.name }" disabled>
			</div>
			<div class="col-4"></div>
		</div>
		
		<div class="row" style="margin-bottom: 3px;">
			<div class="col-4"></div>
			<div class="col-1" style="margin-top: 8px;">연락처</div>
			<div class="col-3">
				<input class="form-control" value="${memberList.phone }" disabled>
			</div>
			<div class="col-4"></div>
		</div>
	</c:forEach>
		
	<c:forEach var="addressList" items="${addressList }">
		<div class="row" style="margin-bottom: 25px;">
			<div class="col-4"></div>
			<label for="address" class="col-1 col-form-label">주소</label>
			<div class="col-7">
				<input type="text" class="form-control" value="${addressList.address1 }" style="width:30%; margin-bottom: 3px;" disabled>
				<input type="text" class="form-control" value="${addressList.address2 }" style="width:50%; margin-bottom: 3px;" disabled>
				<input type="text" class="form-control" value="${addressList.address3 }" style="width:50%; margin-bottom: 3px;" disabled>
				<input type="text" class="form-control" value="${addressList.address4 }" style="width:30%; margin-bottom: 3px;" disabled>
				<input type="text" class="form-control" value="${addressList.address5 }" style="width:30%;" disabled>
			</div>
		</div>
	</c:forEach>
		
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4" align="center" style="border-top:1px solid;">
				<h5>받는사람 정보</h5>
			</div>
			<div class="col-4"></div>
		</div>
		
	<form name="payForm" id="payForm" method="POST" action="${path }/order/pay.do">
	<c:forEach var="memberList" items="${memberList }">
		<div class="row" style="margin-bottom: 3px;">
			<div class="col-4"></div>
			<div class="col-1" style="margin-top: 8px;">이름</div>
			<div class="col-3">
				<input class="form-control" name="inputReceiverName" id="inputReceiverName" value="${memberList.name }" required>
			</div>
			<div class="col-4"></div>
		</div>
		
		<div class="row" style="margin-bottom: 3px;">
			<div class="col-4"></div>
			<div class="col-1" style="margin-top: 8px;">연락처</div>
			<div class="col-3">
				<input class="form-control" name="inputReceiverPhone" id="inputReceiverPhone" value="${memberList.phone }" required>
			</div>
			<div class="col-4"></div>
		</div>
		<input type="hidden" id="inputMemberId" name="inputMemberId" value="${memberList.id }">
	</c:forEach>
		
		<div class="row" style="margin-bottom: 25px;">
			<div class="col-4"></div>
			<label for="address" class="col-1 col-form-label">주소</label>
			<div class="col-7">
				<input type="text" id="inputReceiverAddress1" name="inputReceiverAddress1" placeholder="우편번호" style="width:30%; margin-bottom: 3px;">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="inputReceiverAddress2" name="inputReceiverAddress2" placeholder="도로명주소" style="width:50%; margin-bottom: 3px;">
				<input type="text" id="inputReceiverAddress3" name="inputReceiverAddress3" placeholder="지번주소" style="width:50%; margin-bottom: 3px;" required><br>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="inputReceiverAddress4" name="inputReceiverAddress4" placeholder="상세주소" style="width:30%; margin-bottom: 3px;">
				<input type="text" id="inputReceiverAddress5" name="inputReceiverAddress5" placeholder="참고항목" style="width:30%;">
			</div>
		</div>
		
		
		<input type="hidden" id="inputFinalPrice" name="inputFinalPrice">
		<input type="hidden" id="inputCartListNoString" name="inputCartListNoString" value="${cartListNoString}">
		<input type="hidden" id="inputPayment" name="inputPayment">
		</form>
			
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4" align="center" style="border-top:1px solid;">
				<h5>주문 상품</h5>
			</div>
			<div class="col-4"></div>
		</div>
 			
<c:if test="${!empty outerList}">
	<c:forEach var="outerList" items="${outerList }" varStatus="status">
		<c:forEach var="innerList" items="${outerList }">
			<div class="row" style="margin-bottom:3px;">
				<div class="col-4"></div>
				
				<div class="col-1">
					<img src="/thumbnailPath/${innerList.productImage}" class="productImage" id="productImage" name="productImage">
				</div>
				
				<div class="col-2">
					<span id="name">${innerList.name }</span>
				</div>
				
				<div class="col-1">
					<span id="name">총&nbsp;${innerList.productAmount }개</span>
				</div>
				
				<div class="col-2">
					<fmt:formatNumber value="${innerList.totalPrice }" pattern="###,###,###"/>원
				</div>
				
				<div class="col-2"></div>
			</div>
		</c:forEach>
	</c:forEach>
</c:if>
			
		<div class="row" style="margin-top:25px;">
			<div class="col-4"></div>
			<div class="col" align="center" style="border-top:1px solid;">
				<h5>결제 정보</h5>
			</div>
			<div class="col-4"></div>
		</div>
		
		<div class="row" style="margin-bottom: 3px;">
			<div class="col-4"></div>
			<div class="col-1" style="margin-top: 8px;">총상품가격</div>
			<div class="col-3">
				<input class="form-control" value="${allPrice }" disabled>
			</div>
			<div class="col-4"></div>
		</div>
		
		<div class="row" style="margin-bottom: -5px;">
			<div class="col-4"></div>
			<div class="col-1" style="margin-top: 8px;">배송비</div>
			
			<c:if test="${allPrice ge 50000 }">
				<c:set var="deliveryFee" value="0"></c:set>
			</c:if>
			<c:if test="${allPrice lt 50000 }">
				<c:set var="deliveryFee" value="2500"></c:set>
			</c:if>
			<div class="col-3">
				<input class="form-control" value="${deliveryFee }" disabled>
			</div>
			<div class="col-4"></div>
		</div>
		
		<div class="row" style="margin-bottom: 3px;">
			<div class="col-4"></div>
			<div class="col-4" style="margin-top: 8px;" align="center">
				<a style="font-size:13px;">배송비: 2500원, 총상품가격이 50000원 이상이면 무료</a>
			</div>
			<div class="col-4"></div>
		</div>
		
		<c:set var="finalPrice" value="${allPrice + deliveryFee }"></c:set>
		
		<div class="row" style="margin-bottom: 3px;">
			<div class="col-4"></div>
			<div class="col-1" style="margin-top: 8px;">총결제금액</div>
			<div class="col-3">
				<input class="form-control" id="finalPrice" name="finalPrice" value="${finalPrice }" disabled>
			</div>
			<div class="col-4"></div>
		</div>
		
		<div class="row" style="margin-bottom: 25px;">
			<div class="col-4"></div>
			<div class="col-1" style="margin-top: 8px;">결제방법</div>
			<div class="container col-6">
				<div class="container">
					<label class="radio-inline" style="margin-top: 8px;">
					  <input type="radio" class="form-check-input" name="inlineRadioOptions" id="inlineRadio1" value="simplePay" checked>&nbsp;간편결제&nbsp;&nbsp;
					</label>
					<label class="radio-inline" style="margin-top: 8px;">
					  <input type="radio" class="form-check-input" name="inlineRadioOptions" id="inlineRadio2" value="creditCard">&nbsp;일반카드&nbsp;&nbsp;
					</label>
					<label class="radio-inline" style="margin-top: 8px;">
					  <input type="radio" class="form-check-input" name="inlineRadioOptions" id="inlineRadio3" value="corpCard">&nbsp;법인카드&nbsp;&nbsp;
					</label>
					<label class="radio-inline" style="margin-top: 8px;">
					  <input type="radio" class="form-check-input" name="inlineRadioOptions" id="inlineRadio4" value="accountTransfer">&nbsp;계좌이체&nbsp;&nbsp;
					</label>
					<label class="radio-inline" style="margin-top: 8px;">
					  <input type="radio" class="form-check-input" name="inlineRadioOptions" id="inlineRadio5" value="phonePay">&nbsp;휴대폰
					</label>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		
		
		
		<div class="row">
			<div class="col-4"></div>
			<div class="col-2" align="right">
				<button type="button" onclick="pay();" class="btn btn-outline-success">결제하기</button>
			</div>
			<div class="col-2" align="left">
				<button type="button" onclick="location.href='${path }/cart/list.do'" class="btn btn-outline-success">장바구니</button>
			</div>
			<div class="col-4"></div>
		</div>

	</div>
</div>

<%@ include file="../layout/footer.jsp" %>

</body>

<script>
	function pay() {
		var finalPrice = document.getElementById('finalPrice').value;
		document.getElementById('inputFinalPrice').value = finalPrice;
		
		var checkedValue = $("input[type=radio][name=inlineRadioOptions]:checked").val();
		document.getElementById('inputPayment').value = checkedValue;

		var confirm_val = confirm("선택된 상품을 주문하시겠습니까?");
		
	    if (confirm_val) {
	    	document.getElementById('payForm').submit();
	    }
		
		
	}

</script>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("inputReceiverAddress1").value = data.zonecode;
                document.getElementById("inputReceiverAddress2").value = roadAddr;
                document.getElementById("inputReceiverAddress3").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("inputReceiverAddress5").value = extraRoadAddr;
                } else {
                    document.getElementById("inputReceiverAddress5").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</html>