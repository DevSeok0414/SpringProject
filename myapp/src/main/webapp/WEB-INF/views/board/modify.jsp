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
		        	<span class="fs-4">문의게시판 - 글 수정</span>
      			</a>
			</div>
		</div>
		
		<br>
		
		<form id="modifyForm" name="modifyForm" method="POST" action="${path }/board/modifyBoard.do">
			<div class="row" style="margin-bottom: 20px;">
				<div class="col-3"></div>
				<div class="col-1" style="margin-top: 8px;">글 제목</div>
				<div class="col-6">
					<input type="text" id="subject" name="subject" class="form-control" value="${dto.subject }" required>
				</div>
				<div class="col-2"></div>
			</div>
			
			<div class="row" style="margin-bottom: 20px;">
				<div class="col-3"></div>
				<div class="col-1" style="margin-top: 8px;">글 내용</div>
				<div class="col-6">
					<textarea id="content" name="content" class="form-control" style="height: 300px;" required>${dto.content }</textarea>
				</div>
				<div class="col-2"></div>
			</div>
			
			<div class="row" style="margin-bottom: 20px;">
				<div class="col-4"></div>
				<div class="col-2" align="right">
					<button type="button" onclick="modify();" class="btn btn-outline-primary">글 수정</button>
				</div>
				<div class="col-2" align="left">
					<button type="button" onclick="location.href='${path }/board/list.do'" class="btn btn-outline-success">글 목록</button>
				</div>
				<div class="col-4"></div>
			</div>
			
			<input type="hidden" id="no" name="no" value="${dto.no }">
		</form>
		
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>

</body>
<script type="text/javascript">
	function modify() {
		var subject = document.getElementById('subject').value;
		var content = document.getElementById('content').value;
		
		if (!subject || subject.trim() == "") {
			alert("제목을 입력해주세요.");
		    subject.focus();
		    return false;
		}
		if (!content || content.trim() == "") {
			alert("내용을 입력해주세요.");
		    content.focus();
		    return false;
		}
		
		document.getElementById('modifyForm').submit();
	}
</script>
</html>