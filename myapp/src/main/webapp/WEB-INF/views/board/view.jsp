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

<form id="replyWriteForm" name="replyWriteForm" method="POST" action="${path }/board/replyWrite.do">
<div class="album py-5 bg-light">
	<div class="container">
		<div class="row">
			<div class="col" style="text-align:center;">
				<a href="#" class="align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
		        	<span class="fs-4">문의게시판 - ${dto.no }번 글</span>
      			</a>
			</div>
		</div>
		
		<br>
		
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-3"></div>
			<div class="col-1" style="margin-top: 8px;">글 제목</div>
			<div class="col-6">
				<input type="text" id="subject" name="subject" class="form-control" value="${dto.subject }" disabled>
			</div>
			<div class="col-2"></div>
		</div>
		
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-3"></div>
			<div class="col-1" style="margin-top: 8px;">글 내용</div>
			<div class="col-6">
				<textarea id="content" name="content" class="form-control" style="height: 300px;" disabled>${dto.content }</textarea>
			</div>
			<div class="col-2"></div>
		</div>

		<div class="row" style="margin-bottom: 20px;">
			<div class="col-4"></div>
			<div class="btn-group col-4" role="group">
			  <button type="button" onclick="location.href='${path }/board/list.do'" class="btn btn-outline-success">글 목록</button>
			  <button type="button" onclick="location.href='${path }/board/write.do'" class="btn btn-outline-success">글쓰기</button>
			  <button type="button" onclick="reply();" class="btn btn-outline-success">답글쓰기</button>
			  <button type="button" onclick="modify();" class="btn btn-outline-success">글 수정</button>
			  <button type="button" onclick="remove();" class="btn btn-outline-success">글 삭제</button>
			</div>
			<div class="col-4"></div>
		</div>
		
		<input type="hidden" id="no" name="no" value="${dto.no }">
		<input type="hidden" id="memberId" name="memberId" value="${dto.memberId }">
		<input type="hidden" id="sessionId" name="sessionId" value="${sessionId }">
		<input type="hidden" id="auth" name="auth" value="${auth }">
		
	</div>
</div>
</form>

<%@ include file="../layout/footer.jsp" %>

</body>
<script type="text/javascript">
function reply() {
	var sessionId = document.getElementById('sessionId').value;
	var memberId = document.getElementById('memberId').value;
	var auth = document.getElementById('auth').value;
	var confirm_val = confirm("답글을 작성하시겠습니까?");
	
    if (confirm_val) {
		if ((sessionId == memberId) || (auth == 1)) {
			document.getElementById('replyWriteForm').submit();
		} else {
			alert('원래 글의 작성자 혹은 관리자만 답글을 달 수 있습니다.\n문의게시판으로 돌아갑니다.');
			location.href="${path }/board/list.do";
		}
    }
}
function modify() {
	var sessionId = document.getElementById('sessionId').value;
	var memberId = document.getElementById('memberId').value;
	var confirm_val = confirm("글을 수정하시겠습니까?");
	
    if (confirm_val) {
		if (sessionId == memberId) {
			location.href="${path }/board/modify.do?no=${dto.no }";
		} else {
			alert('본인이 작성한 글만 수정할 수 있습니다.\n문의게시판으로 돌아갑니다.');
			location.href="${path }/board/list.do";
		}
    }
}
function remove() {
	var sessionId = document.getElementById('sessionId').value;
	var memberId = document.getElementById('memberId').value;
	var confirm_val = confirm("글을 삭제하시겠습니까?");
	
    if (confirm_val) {
		if (sessionId == memberId) {
			location.href="${path }/board/remove.do?no=${dto.no }";
		} else {
			alert('본인이 작성한 글만 삭제할 수 있습니다.\n문의게시판으로 돌아갑니다.');
			location.href="${path }/board/list.do";
		}
    }
}
</script>
</html>