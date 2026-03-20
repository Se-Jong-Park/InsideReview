<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<!-- css 연결 -->
<link rel="stylesheet" type="text/css" href="/resources/css/main.css"> <!-- type 없어도 나옴 -->
</head>
<body>
	<form name="oneForm" id="body_layout">
		<a class="arrow-btn" href="<c:url value='/user/list${sc.queryString}'/>">
			<span class="material-icons-round">arrow_back</span>
		</a>		
		<ul class="oneList">
			<li>
				<label>이름</label>
				${uvo.uname }
			</li>
			<li>
				<label>아이디</label>
				${uvo.uid }
			</li>
			<li>
				<label>생년월일</label>
				${uvo.ubirth }
			</li>
			<li>
				<label>주소</label>
				${uvo.uaddr }
			</li>
			<li>
				<label>성별</label>
				${uvo.ugender }
			</li>
			<li>
				<label>전화번호</label>
				${uvo.uphone }
			</li>
			<li>
				<label>메일</label>
				${uvo.umail }
			</li>
			<li>
				<label>등록일</label>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${uvo.uinsertdate }"/>
			</li>
			<li>
				<label>수정일</label>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${uvo.uupdatedate }"/>
			</li>
		</ul>
	</form>
</body>
</html>