<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container py-5">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card shadow p-4">
				<h4 class="text-center mb-4">회원정보 수정</h4>
				
				<form action="/user/modify" method="post">
					<div class="mb-3">
						<label class="form-label">이름</label>
						<input type="text" name="uname" class="form-control" value="${userInfo.uname}" maxlength="15" required>
					</div>
					
					<div class="mb-3">
						<label class="form-label">이메일</label>
						<input type="email" name="umail" class="form-control" value="${userInfo.umail}" maxlength="50" required>
					</div>
					
					<div class="mb-3">
						<label class="form-label">전화번호</label>
						<input type="text" name="uphone" class="form-control" value="${userInfo.uphone}" maxlength="13">
					</div>
					
					<div class="mb-3">
						<label class="form-label">생년월일</label>
						<input type="date" name="ubirth" class="form=control" value="<fmt:formatDate value='${userInfo.ubirth}' pattern='yyyy-MM-dd'/>">					
					</div>
					
					<div class="mb-3">
    <label class="form-label">성별</label>
    <div>
        <div class="form-check form-check-inline">
            <input type="radio" name="ugender" value="M" class="form-check-input" id="male"
                   ${userInfo.ugender.toString() == 'M' ? 'checked' : ''}>
            <label class="form-check-label" for="male">남성</label>
        </div>
        <div class="form-check form-check-inline">
            <input type="radio" name="ugender" value="F" class="form-check-input" id="female"
                   ${userInfo.ugender.toString() == 'F' ? 'checked' : ''}>
            <label class="form-check-label" for="female">여성</label>
        		</div>
   			 </div>
		</div>
					
					<div class="mb-4">
						<label class="form-label">주소</label>
						<input type="text" name="uaddr" class="form-control" 
								value="${userInfo.uaddr}" maxlength="100">
					</div>
					
					<div class="d-flex justify-content-between">
						<a href="/user/mypage" class="btn btn-outline-gray">취소</a>
						<button type="submit" class="btn btn-netflix">수정 완료</button>					
					</div>
					
				</form>
			</div>
		</div>
	</div>

</div>
</body>
</html>