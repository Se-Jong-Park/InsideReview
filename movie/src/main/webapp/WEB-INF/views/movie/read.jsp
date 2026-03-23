<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<!-- Google Material icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Round">
<!-- js 연결 -->
<script defer src="/resources/js/main.js"></script>
<!-- css 연결 -->
<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<div id="body_layout">
	<div class="movie_read">
		<div class="inner">
			<div class="sub_list">
				<c:forEach items="${mList}" var="mvo">
					<c:if test="${mno eq mvo.mno and CURR eq null}">
						<c:set var="CURR" value="${mvo }"/> <!-- 현재글 -->
					</c:if>
					<c:if test="${mno < mvo.mno and NEXT eq null}">
						<c:set var="NEXT" value="${mvo }"/> <!-- 다음글 -->
					</c:if>
					<c:if test="${mno > mvo.mno }">
						<c:set var="PREV" value="${mvo }"/> <!-- 이전글 -->
					</c:if>
				</c:forEach>
			</div><!-- END OF sub_list -->
			
			<div>
				<a class="back-btn" href="javascript:list()">
				    <span class="material-icons-round">arrow_back</span>
				    목록으로
				</a>
				<script>
					function list() {
						location.href = "/movie/list";
					}
				</script>
			</div>
			
			<!-- 제목 -->
			<div class="m-content">
			    <img src="/upload/${CURR.mposter}">
			    <div class="m-info">
			        <div class="netflix-title">${CURR.mtitle}</div>
			        <div class="m-desc">${CURR.mcontent}</div>
			        <div class="meta-list">
			            <div class="meta-row">
			                <span class="meta-label">장르</span>
			                <span class="meta-value">${CURR.mgenre}</span>
			            </div>
			            <div class="meta-row">
			                <span class="meta-label">감독</span>
			                <span class="meta-value">${CURR.mdirector}</span>
			            </div>
			            <div class="meta-row">
			                <span class="meta-label">배우</span>
			                <span class="meta-value">${CURR.mactor}</span>
			            </div>
			            <div class="meta-row">
			                <span class="meta-label">개봉일</span>
			                <span class="meta-value"><fmt:formatDate value="${CURR.mreleasedate}" pattern="yyyy.MM.dd"/></span>
			            </div>
			        </div><!-- END OF meta-list -->
			    </div><!-- END OF m-info -->
			</div><!-- END OF m-content -->
			
			<ul class="d-btn">
			    <c:if test="${PREV ne null}">
			        <li>
			            <span class="btn-label">이전글</span>
			            <a href="/movie/read?mno=${PREV.mno}">${PREV.mtitle}</a>
			        </li>
			    </c:if>
			
			    <c:if test="${NEXT ne null}">
			        <li>
			            <span class="btn-label">다음글</span>
			            <a href="/movie/read?mno=${NEXT.mno}">${NEXT.mtitle}</a>
			        </li>
			    </c:if>
			</ul>

			<!-- 수정 버튼 -->
			<div class="admin-btn">
				<button type="button" onclick="location.href='/movie/form?mno=${CURR.mno}'">영화 수정</button>
				<form id="deleteForm" method="post" action="/movie/del">
				    <input type="hidden" name="mno" id="deleteMno">
				</form>
				<button type="button" onclick="deleteMovie('${CURR.mno}')">영화 삭제</button>
				<script>
				function deleteMovie(mno){
				    if(confirm("영화정보 삭제하시겠습니까?")){
				        document.getElementById("deleteMno").value = mno;
				        document.getElementById("deleteForm").submit();
				    }
				}
				</script>
			</div><!-- END OF admin-btn -->
			
			<c:if test="${not empty msg}">
			    <script>
			        var msg = "${msg}";
			
			        if(msg === "M_UP_SUC"){
			            alert("수정되었습니다.");
			        }else if(msg === "M_UP_ERR"){
			            alert("수정 실패했습니다.");
			        }else if(msg === "M_DEL_SUC"){
			            alert("삭제되었습니다.");
			        }else if(msg === "M_DEL_ERR"){
			            alert("삭제 실패했습니다.");
			        }
			    </script>
			</c:if>
			
		</div><!-- END OF inner -->
	</div><!-- END OF movie_read -->
</div><!-- END OF body_layout -->
</body>
</html>