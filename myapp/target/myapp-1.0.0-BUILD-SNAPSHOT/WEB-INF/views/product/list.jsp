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
				<a href="${path}/product/list.do" class="align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
		        	<span class="fs-4">상품 목록</span>
      			</a>
			</div>
		</div>
		
		<br>

		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
		<!-- per 1 row 4 items print. per 1 page total 12 items print -->

			<c:choose>
				<c:when test="${!empty list}">

					<c:forEach var="list" items="${list}" begin="${pageMaker.startIndex }" end="${pageMaker.endIndex }">
							
						<div class="col">
							<div class="card shadow-sm">
								<p style="text-align: center; width: 200px; height: 200px;">
								<a href="${path }/product/view.do?no=${list.no}">
									<img src="/thumbnailPath/${list.productThumbnail}" class="thumbnail">
								</a>
								</p>
								<div class="card-body">
									<h5 class="card-title">${list.name}</h5>
									<p class="card-text">
										${list.description }
									</p>
									<div class="d-flex align-items-left">
										<p>${list.price }원</p>
									</div>
								</div>
							</div>
						</div>
							
					</c:forEach>

				</c:when>

				<c:otherwise>
					<div class="col">
						<h3>등록된 상품이 없습니다. 상품을 등록해주세요.</h3>
					</div>
				</c:otherwise>
				
			</c:choose>
 
		</div>

		<br>		

		<div class="row box-footer clearfix">
			<div class="col-5">
			<!-- 검색기능!! -->
			</div>
			
			<div class="col-5" style="text-align:center;">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <c:choose>
						<c:when test="${(pageMaker.startPage eq 1) && (pageMaker.criteria.pageNumber eq 1)}">
							<li class="page-item disabled"><a class="page-link" href="${path }/product/list.do?pageNumber=1">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${path }/product/list.do?pageNumber=1">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${pageMaker.startPage gt pageMaker.rangeSize}">
							<li class="page-item"><a class="page-link" href="${path }/product/list.do?pageNumber=${pageMaker.startPage-1}&startPage=${(pageMaker.criteria.pageNumber-1)*pageMaker.rangeSize}">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="${path }/product/list.do?pageNumber=${pageMaker.startPage-1}&startPage=${(pageMaker.criteria.pageNumber-1)*pageMaker.rangeSize}">&lt;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="i" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<c:choose>
							<c:when test="${pageMaker.criteria.pageNumber eq i}">
								<li class="page-item active"><a class="page-link" href="${path }/product/list.do?pageNumber=${i }">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${path }/product/list.do?pageNumber=${i }">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pageMaker.endPage lt pageMaker.totalPage}">
							<li class="page-item"><a class="page-link" href="${path }/product/list.do?pageNumber=${pageMaker.endPage+1}">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="${path }/product/list.do?pageNumber=${pageMaker.endPage+1}">&gt;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${(pageMaker.endPage eq pageMaker.totalPage) && (pageMaker.totalPage eq pageMaker.criteria.pageNumber)}">
							<li class="page-item disabled"><a class="page-link" href="${path }/product/list.do?pageNumber=${pageMaker.totalPage}">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${path }/product/list.do?pageNumber=${pageMaker.totalPage}">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
					
				  </ul>
				</nav>
			</div>
			
			<div class="col-2"></div>
		</div>

	</div>
</div>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>