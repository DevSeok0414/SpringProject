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
				<h4 align="center">회원 등록</h4>
			</div>
		</div>
		
		<br>
		
		<form name="signupForm" id="signupForm" method="POST" action="${path }/member/signup.do">
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-3"></div>
				<label for="id" class="col-2 col-form-label" style="text-align:center;">아이디</label>
				<div class="col-3">
					<input type="text" class="form-control" name="id" id="id" required>
				</div>
				<div class="col-4"></div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-3"></div>
				<label for="password" class="col-2 col-form-label" style="text-align:center;">비밀번호</label>
				<div class="col-3">
					<input type="password" class="form-control" name="password" id="password" required>
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-3"></div>
				<label for="passwordCheck" class="col-2 col-form-label" style="text-align:center;">비밀번호확인</label>
				<div class="col-3">
					<input type="password" class="form-control" name="passwordCheck" id="passwordCheck" required>
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-3"></div>
				<label for="name" class="col-2 col-form-label" style="text-align:center;">이름</label>
				<div class="col-3">
					<input type="text" class="form-control" name="name" id="name" required>
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-3"></div>
				<label for="phone" class="col-2 col-form-label" style="text-align:center;">전화번호</label>
				<div class="col-3">
					<input type="text" class="form-control" name="phone" id="phone" placeholder="입력 예시: 010-1234-5678" required>
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-3"></div>
				<label for="email" class="col-2 col-form-label" style="text-align:center;">이메일</label>
				<div class="col-3">
					<input type="text" class="form-control" name="email" id="email" placeholder="입력 예시: google@google.com" required>
				</div>
				<div class="col-4"></div>
			</div>
			
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-3"></div>
				<label for="address" class="col-2 col-form-label" style="text-align:center;">주소</label>
				<div class="col-7">
					<input type="text" id="address1" name="address1" placeholder="우편번호" style="width:30%;">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="address2" name="address2" placeholder="도로명주소" style="width:50%;">
					<input type="text" id="address3" name="address3" placeholder="지번주소" style="width:50%;" required><br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="address4" name="address4" placeholder="상세주소" style="width:30%;">
					<input type="text" id="address5" name="address5" placeholder="참고항목" style="width:30%;">
				</div>
			</div>

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-5"></div>
				<div class="col-2" align="right" style="margin-right: -5px;">
					<button type="button" onclick="check()" class="btn btn-outline-primary">회원 등록</button>
				</div>
				<div class="col-2" align="left" style="margin-right: -3px;">
					<button type="button" onclick="location.href='${path }/'" class="btn btn-outline-success">메인으로</button>
				</div>
				<div class="col-3"></div>
			</div>

		</form>
	</div>
</div>





<%@ include file="../layout/footer.jsp" %>

</body>

<script type="text/javascript">
	function check() {
		var id = document.getElementById('id').value;
		var password = document.getElementById('password').value;
		var passwordCheck = document.getElementById('passwordCheck').value;
		var name = document.getElementById('name').value;
		var phone = document.getElementById('phone').value;
		var email = document.getElementById('email').value;
		var address3 = document.getElementById('address3').value;
		
		if(!id || id.trim() == ""){
		    alert("아이디를 입력해주세요.");
		    id.focus();
		    return false;
		}
		if(!password || password.trim() == ""){
		    alert("비밀번호를 입력해주세요.");
		    password.focus();
		    return false;
		}
		if(!passwordCheck || passwordCheck.trim() == ""){
		    alert("비밀번호 확인을 입력해주세요.");
		    passwordCheck.focus();
		    return false;
		}
		if(!name || name.trim() == ""){
		    alert("이름을 입력해주세요.");
		    name.focus();
		    return false;
		}
		if(!phone || phone.trim() == ""){
		    alert("전화번호를 입력해주세요.");
			phone.focus();
		    return false;
		}
		if(!email || email.trim() == ""){
		    alert("이메일을 입력해주세요.");
		    email.focus();
		    return false;
		}
		if(!address3 || address3.trim() == ""){
		    alert("주소를 검색해주세요.");
		    return false;
		}
		if(password != passwordCheck) {
			  alert("비밀번호가 일치 하지 않습니다");
			  return false;
			} else{
				alert("회원가입에 성공했습니다. 로그인 페이지로 이동합니다.")
			document.getElementById('signupForm').submit();
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
                document.getElementById('address1').value = data.zonecode;
                document.getElementById("address2").value = roadAddr;
                document.getElementById("address3").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("address5").value = extraRoadAddr;
                } else {
                    document.getElementById("address5").value = '';
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