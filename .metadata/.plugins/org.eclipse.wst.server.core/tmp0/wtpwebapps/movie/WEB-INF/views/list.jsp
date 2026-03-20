<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<!-- google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<!-- jQeury cdn -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<!-- css 연결 -->
<link rel="stylesheet" type="text/css" href="/resources/css/main.css"> <!-- type 없어도 나옴 -->
</head>
<body>
<%-- ${ph} --%>
<%-- ${uList}  --%><!-- 비어있는 리스트. 객체 생성은 됐으니 null은 아님 -->
	<div class="list-inner" id="body_layout">
		<a class="arrow-btn" href="<c:url value='/${sc.queryString}'/>">
		<span class="material-icons-round">arrow_back</span>
		</a>
		<p>회원조회</p>
		<!-- 회원 조회를 위한 form -->
		<form name="listForm" action="/user/list" method="get">
			<select name="option">
				<option>선택</option>
				<option value="NA" ${ph.sc.option=='NA'?'selected':'' }>이름</option>
				<option value="ID" ${ph.sc.option=='ID'?'selected':'' }>아이디</option>
			</select>
			<input type="text" name="keyword" id="keyword" value="${ph.sc.keyword }" placeholder="입력">
			<input class="search" type="submit" value="검색">
		</form>
		<c:choose>
			<c:when test="${!(uList eq null)}">
				<!-- 회원정보 있음 -->
				<ul class="userList">
					<c:forEach var="uvo" items="${uList}">
						<li>
							<a href="javascript:void(0)" class="btn-one" data-uno="${uvo.uno }">${uvo.uname}</a>
							<a href="javascript:void(0)" class="btn-one" data-uno="${uvo.uno }">${uvo.uid}</a>
						</li>		
					</c:forEach>
				</ul>
				<div>
					<div class="paging">
						<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}" step="1">
							<a href="<c:url value='/user/list${ph.sc.getQueryString(i)}'/>"><c:out value="${i}"/></a>
						</c:forEach>
					</div>
				</div>
			</c:when>
			<c:otherwise>
			<!-- 회원정보 없음 -->
				<div>회원정보가 없습니다.</div>
			</c:otherwise>
		</c:choose>
		<!-- 상세조회를 위한 회원번호 가져갈 form -->
		<form action="/user/one" method="post" name="userOne">
			<input type="hidden" name="uno" id="uno" />
		</form>
		<script>
			$(document).ready(function(){
				$("a.btn-one").click(function(e){
					let target = e.target;
					//console.log(target);
					let uno = target.getAttribute("data-uno");
					$("#uno").val(uno);
					document.userOne.submit();
				})
			});
		</script>
	</div>
</body>
</html>