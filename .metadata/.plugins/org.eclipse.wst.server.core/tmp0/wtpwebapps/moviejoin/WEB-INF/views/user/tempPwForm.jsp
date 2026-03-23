<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container py-5">
	<div class="row justify-content-center">
		<div class="col-md-5">
			<div class="text=center mb-3">
				<span class="logo">MOVIE</span>
			</div>
			<h4 class="text-center mb-2">비밀번호 찾기</h4>
			<p class="text-center mb-4" style="color: #aaa;">
				가입 시 등록한 이메일을 입력하시면<br>임시 비밀번호를 발급해드립니다.
				</p>
				
				<c:if test="${not empty msg }">
					<div class="alert alert-info">${msg}</div>
				</c:if>
				
				<form action="/user/tempPw" method="post">
					<div class="mb-4">
						<label class="form-label">이메일</label>
						<input type="email" name="umail" class="form-conrtol" maxlength="50" required>
					</div>
					<div class="d-grid">
						<button type="submit" class="btn btn-netflix">임시 비밀번호 발급</button>
					</div>
				</form>
				
				<hr style="border-color: #333;" class="mt-4">
				<p class="text-center mb-0">
					<a href="/user/logForm">로그인으로 돌아가기</a>
		</div>
	</div>
</div>

</body>
</html>