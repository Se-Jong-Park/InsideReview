<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container py-5">
	<div class="row justify-content-center">
		<div class="col-md-5">
			<div class="card shadow p-4">
			<!-- 탈퇴 문구 -->
				<h4 class="text-center mb-3" style="color: white;">회원탈퇴</h4>
				<!-- 경고창 노란색 -->
				<div class="alert alert-warning">
					탈퇴 후 계정은 비활성화되며 복구되지 않습니다.
				</div>
				
				<c:if test="${not empty msg}">
					<div class="alert alert-danger">${msg}</div>
				</c:if>
				
					<form action="/user/withdraw" method="post" onsubmit="return confirm('정말로 탈퇴하시겠습니까?');">
						<div class="mb-4">
							<label class="form-label">비밀번호 확인</label>
							<input type="password" name="upw" class="form-control" required>
						</div>
						<div class="d-flex justify-content-between">
							<button type="submit" class="btn btn-danger-netflix">탈퇴하기</button>
						</div>
					</form>
			</div>
		</div>
	</div> 
</div>
</body>
</html>