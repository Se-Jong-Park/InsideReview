<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container py-5">
	<div class="row justify-content-center">
		<div class="col-md-5">
			<div class="card shadow p-4">
			
			<div class="text-center mb-3">
				<span class="logo">MOVIE</span>
			</div>
			<h4 class="text-center mb-4">로그인</h4>
			
			<c:if test="${not empty msg}">
				<div class="alert alert-danger">${msg}</div>
			</c:if>
			
			<form action="/user/login" method="post">
				<div class="mb-3">
					<label class="form-label">아이디</label>
					<input type="text" name="uid" class="form-control" maxlength="15" required>
				</div>
				<div class="mb-4">
					<label class="form-label">비밀번호</label>
					<input type="password" name="upw" class="form-control" required>
				</div>
				<div class="d-grid">
					<button type="submit" class="btn btn-netflix">로그인</button>
				</div>
			</form>
			<hr style="border-color: #333;" class="mt-4">
			<div class="d-flex justify-content-between mt-3 px-1">
				<a href="/user/form">회원가입</a>
				<a href="/user/tempPwForm" class="link-gray">비밀번호 찾기</a>
			</div>
			
			</div>
		</div>
	</div>

</div>
</body>
</html>