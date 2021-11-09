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
		        	<span class="fs-4">주문 관리</span>
      			</a>
			</div>
		</div>
		
		<br>
		
		<div class="row">
			<div class="col-1" align="center">
				<span>주문 번호</span>
			</div>
			<div class="col-1" align="center">
				<span>주문자ID</span>
			</div>
			<div class="col-1" align="center">
				<span>총 금액</span>
			</div>
			<div class="col-1" align="center">
				<span>수령자</span>
			</div>
			<div class="col-2" align="center">
				<span>수령자 번호</span>
			</div>
			<div class="col-4" align="center">
				<span>받는 사람 주소</span>
			</div>
			<div class="col-1" align="center">
				<span>주문 상태</span>
			</div>
			<div class="col-1" align="center">
				<span>주문일</span>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<hr style="border: solid 1px black;">
			</div>
		</div>
		
		<c:choose>
			<c:when test="${!empty orderList}">
				<c:forEach var="orderList" items="${orderList}" begin="${pageMaker.startIndex }" end="${pageMaker.endIndex }">
					<div class="row">
						<div class="col-1" align="center">
							<a href="${path }/admin/orderListView.do?no=${orderList.no }">
								<span><b>${orderList.no }</b></span>
							</a>
						</div>
						<div class="col-1" align="center">
							<span>${orderList.memberId }</span>
						</div>
						<div class="col-1" align="center">
							<fmt:formatNumber value="${orderList.totalPrice }" pattern="###,###,###"/>원
						</div>
						<div class="col-1" align="center">
							<span>${orderList.receiverName }</span>
						</div>
						<div class="col-2" align="center">
							<span>${orderList.receiverPhone }</span>
						</div>
						<div class="col-4" align="center">
							<span>${orderList.receiverAddress }</span>
						</div>
						<div class="col-1" align="center">
							<span>${orderList.status }</span>
						</div>
						<div class="col-1" align="center">
							<fmt:formatDate value="${orderList.regDate }" pattern="yyyy.MM.dd"/>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<hr>
						</div>
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

		<br>		
		
		<div class="row box-footer clearfix">
			<div class="col-4"></div>		
			
			<div class="abc col-5" align="center">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <c:choose>
						<c:when test="${(pageMaker.startPage eq 1) && (pageMaker.criteria.pageNumber eq 1)}">
							<li class="page-item disabled"><a class="page-link" href="${path }/admin/orderList.do?pageNumber=1">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${path }/admin/orderList.do?pageNumber=1">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${pageMaker.startPage gt pageMaker.rangeSize}">
							<li class="page-item"><a class="page-link" href="${path }/admin/orderList.do?pageNumber=${pageMaker.startPage-1}">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="${path }/admin/orderList.do?pageNumber=${pageMaker.startPage-1}">&lt;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="i" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<c:choose>
							<c:when test="${pageMaker.criteria.pageNumber eq i}">
								<li class="page-item active"><a class="page-link" href="${path }/admin/orderList.do?pageNumber=${i }">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${path }/admin/orderList.do?pageNumber=${i }">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pageMaker.endPage lt pageMaker.totalPage}">
							<li class="page-item"><a class="page-link" href="${path }/admin/orderList.do?pageNumber=${pageMaker.endPage+1}">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="${path }/admin/orderList.do?pageNumber=${pageMaker.endPage+1}">&gt;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${(pageMaker.endPage eq pageMaker.totalPage) && (pageMaker.totalPage eq pageMaker.criteria.pageNumber)}">
							<li class="page-item disabled"><a class="page-link" href="${path }/admin/orderList.do?pageNumber=${pageMaker.totalPage}">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${path }/admin/orderList.do?pageNumber=${pageMaker.totalPage}">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
					
				  </ul>
				</nav>
			</div>
			
			<div class="col-4"></div>
		</div>
		
		<form name="searchForm" id="searchForm" method="GET" action="${path }/admin/searchOrderList.do">
		<div class="row box-footer clearfix">
			<div class="col-3"></div>
			<div class="col-6" align="center">
				<ul class="list list-group list-group-horizontal">
				  	<li class="list-group-item">
					  	<select class="form-select" id="searchSelect" name="searchSelect">
							<option selected>검색 항목</option>
							<option value="no">주문 번호</option>
							<option value="member_id">주문자 ID</option>
							<option value="receiver_name">수령자</option>
							<option value="receiver_address">받는 사람 주소</option>
							<option value="status">주문 상태</option>
						</select>
					</li>
					<li class="list-group-item">
						<input class="form-control" type="text" id="searchText" name="searchText" style="width:300px;">
					</li>
					<li class="list-group-item">
						<button type="button" class="btn btn-success" onclick="search();">검색</button>
					</li>
				</ul>
			</div>
			<div class="col-3"></div>
		</div>
		</form>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>

</body>

<script type="text/javascript">
	function search() {
		var searchSelect = document.getElementById('searchSelect').value;
		var searchText = document.getElementById('searchText').value;
		
		if (searchSelect == null || searchSelect.trim() == "" || searchText == null || searchText.trim() == "") {
			alert('검색 기능은 검색 항목과 검색어가 설정되어야합니다. ')
			return;
		} else {
			document.getElementById('searchForm').submit();
		}
	}
</script>

</html>