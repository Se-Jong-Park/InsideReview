<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage.jsp</title>
<!-- google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<!-- jQeury cdn -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<!-- css 연결 -->
<link rel="stylesheet" type="text/css" href="/resources/css/main.css"> <!-- type 없어도 나옴 -->
<!-- js 연결 -->
<script defer src="/resources/js/main.js"></script>
<script>
	let msg = '${msg}';
	if(msg === "U_DEL_ERR"){
		alert("관리자에게 문의하세요. U3");
	}
</script>
</head>
<body class="mypage-body">
	<div class="mypage" id="body_layout">
		<a class="arrow-btn" href="<c:url value='/'/>">
			<span class="material-icons-round">arrow_back</span>
		</a>
		<c:set var="loginId" value="${pageContext.request.session.getAttribute('uid')}"/>
		<p>마이페이지</p>
		<p class="loginId">${loginId}</p>	
		<div class="mypage-menu" id="menu">
			<a href="/user/form">회원수정</a>
			<a href="javaScript:popup();" id="pop">회원탈퇴</a>
		</div>
		<img src="<c:url value='/resources/images/profile.jpg'/>" alt="기본프로필">
		<div class="profile-page"></div>
	</div>
	<div class="popup">
		<div class="popup-inner" id="body_layout">
			<button type="button" class="popup-close" onclick="closePopup()">
				<span class="material-icons-round">close</span>			
			</button>
			<form name="delForm" id="delForm" method="post">
				<p>비밀번호 확인</p>
				<input type="password" name="upw" id="upw" placeholder="비밀번호 입력"/>
				<input type="hidden" name="uid" id="uid" value="<c:out value="${pageContext.request.session.getAttribute('uid') }"/>"/>
				<input type="hidden" name="uno" id="uno" value="<c:out value="${pageContext.request.session.getAttribute('uno') }"/>"/>
				<input type="button" class="btn" value="확인" onclick="pwConfirm();"/>
			</form>
		</div>
	</div>
	<style>
		.popup{display: none}
		.popup.show{display:block}
	</style>
</body>
</html>