<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container py-5">
	<div class="row justify-content-center">
		<div class="col-md-5">
			<div class="card shadow p-4">
				<h4 class="text-center mb-4">비밀번호 변경</h4>
				
				<c:if test="${not empty msg}">
					<div class="alert alert-danger">${msg}</div>
				</c:if>
				<form action="/user/changePw" method="post">
					<div class="mb-3">
						<label class="form-label">현재 비밀번호</label>
						<input type="password" name="currentUpw" class="form-control" required>
					</div>
					<div class="mb-3">
						<label class="form-label">새 비밀번호</label>
						<input type="password" name="newUpw" id="newUpw" class="form-control" required>
					</div>
					<div class="mb-4">
						<label class="form-label">새 비밀번호 확인</label>
						<input type="password" id="newUpwConfirm" class="form-control" required>
					</div>
					<div class="d-flex justify-content-between">
						<a href="/user/mypage" class="btn btn-outline-gray">취소</a>
						<button type="submit" class="btn btn-netflix" onclick="return checkPw()">변경 완료</button>
					
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
function checkPw() {
	var n = document.getElementById('newUpw').value;
	var nc = document.getElementById('newUpwConfirm').value;
	if(n !== nc){
		alert('새 비밀번호가 일치하지 않습니다');
		return false;
	}
	return true;
}
</script>
</body>
</html>