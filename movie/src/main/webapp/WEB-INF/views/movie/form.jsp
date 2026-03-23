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
<!-- daum api cdn -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Google Material icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Round">
<!-- js 연결 -->
<!-- <script defer src="/resources/js/main.js"></script> -->
<!-- css 연결 -->
<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<div id="body_layout">
	<div class="movie">
		<div class="inner">
			<form name="movieForm" action="${mvo ne null ? '/movie/up' : '/movie/write'}" method="post" enctype="multipart/form-data">
				<h3 id="sub_tit">${mvo ne null ? '영화 수정' : '영화 등록' }</h3>
				<div class="close">
					<a href="/movie/list"><span class="material-icons-round">arrow_back</span></a>
					<script>
						function list(){
					    	location.href = "/movie/list";
					  	}
					</script>
				</div><!-- END OF close -->
				<c:if test="${mvo ne null }">
					<input type="hidden" name="mno" id="mno" value="${mvo.mno }"/>
				</c:if>
				<div class="mtitle">영화 제목
					<%-- <input type="text" name="mtitle" id="mtitle" value="<c:out value="${mvo ne null ? mvo.mtitle : '' }"/>"/> --%>
					<input type="text" name="mtitle" id="mtitle" value="${mvo ne null ? mvo.mtitle : ''}"/>
				</div>
				<div class="mcontent">영화 설명
					<input type="text" name="mcontent" id="mcontent" value="<c:out value="${mvo ne null ? mvo.mcontent : '' }"/>"/>
				</div>
				<div class="mgenre">장르
					<input type="text" name="mgenre" id="mgenre" value="<c:out value="${mvo ne null ? mvo.mgenre : '' }"/>"/>
				</div>
				<div class="mdirector">감독
					<input type="text" name="mdirector" id="mdirector" value="<c:out value="${mvo ne null ? mvo.mdirector : '' }"/>"/>
				</div>
				<div class="mactor">배우
					<input type="text" name="mactor" id="mactor" value="<c:out value="${mvo ne null ? mvo.mactor : '' }"/>"/>
				</div>
				<div class="mreleasedate">개봉일
					<fmt:formatDate value="${mvo.mreleasedate}" pattern="yyyy-MM-dd" var="fmtDate"/>
    				<input type="date" name="mreleasedate" id="mreleasedate" value="${mvo ne null ? fmtDate : ''}"/>
				</div>
				<div class="mposter">영화 이미지
				    <c:if test="${mvo ne null && mvo.mposter ne null}">
				        <div class="preview-box">
				            <img src="/upload/${mvo.mposter}" width="120" alt="현재 포스터">
				            <div style="flex:1;">
				                <p style="font-size:12px; color:#86868b; margin-bottom:10px;">기존 파일: ${mvo.morfile}</p>
				                <input type="hidden" name="mposter" value="${mvo.mposter}">
				                <input type="hidden" name="morfile" value="${mvo.morfile}">
				            </div>
				        </div>
				    </c:if>
				    <input type="file" name="mfile" id="mfile"/>
				</div>
				<input type="submit" value="${mvo ne null?'수정완료':'등록완료'}">
				<!-- <script>
					function movieInsert(){
						let form = document.movieForm;
						form.submit();
					}
				</script> -->
			</form><!-- END OF movieForm -->
		</div><!-- END OF inner -->
	</div><!-- END OF movie -->
</div><!-- END OF body_layout -->
</body>
</html>