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
<!-- js 연결 -->
<!-- <script defer src="/resources/js/main.js"></script> -->
<!-- css 연결 -->
<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<div id="body_layout">
	<div class="movie_list">
		<div class="inner">
			<div class="list-header">
                <p class="main-tit">영화 목록</p>
                <div class="reg-btn">
                    <a href="/movie/form">영화 등록</a>
                </div></div><div class="sidebar">
                <ul>
                    <li><a href="/movie/list" class="${empty ph.sc.option ? 'active' : ''}">전체 목록</a></li>
                    <li><a href="/movie/list?option=MT" class="${ph.sc.option eq 'MT' ? 'active' : ''}">영화 제목</a></li>
                    <li><a href="/movie/list?option=MD" class="${ph.sc.option eq 'MD' ? 'active' : ''}">감독</a></li>
                    <li><a href="/movie/list?option=MA" class="${ph.sc.option eq 'MA' ? 'active' : ''}">배우</a></li>
                    <li><a href="/movie/list?option=MG" class="${ph.sc.option eq 'MG' ? 'active' : ''}">장르</a></li>
                </ul>
            </div><!-- END OF list-header -->
			
			<div class="content">
				<form action="/movie/list" method="get">
				    <input type="hidden" name="option" value="${ph.sc.option}">
				    <input type="text" name="keyword" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요.">
				    <input type="submit" value="검색">
				</form><!-- END OF searchForm -->
				
				<div class="movieBox">
				    <div class="movie-grid"> 
				    	<c:choose>
				            <c:when test="${mList == null || empty mList}">
				                <div class="no-data">등록된 영화 정보가 없습니다.</div>
				            </c:when>
				            <c:otherwise>
				                <c:forEach var="mvo" items="${mList}">
				                    <div class="movie-card">
				                        <a href="<c:url value='/movie/read?mno=${mvo.mno }'/>">
				                            <div class="poster-wrapper">
				                                <c:choose>
				                                    <c:when test="${not empty mvo.mposter}">
				                                        <img src="/upload/${mvo.mposter}" alt="${mvo.mtitle}">
				                                    </c:when>
				                                    <c:otherwise>
				                                        <div class="no-img">No Poster</div>
				                                    </c:otherwise>
				                                </c:choose>
				                                <div class="card-overlay">
				                                    <span class="view-btn">상세보기</span>
				                                </div><!-- END OF card-overlay -->
				                            </div><!-- END OF poster-wrapper -->
				                            <div class="movie-info">
				                                <p class="m-title"><c:out value="${mvo.mtitle}"/></p>
				                                <p class="m-sub">${mvo.mdirector} · ${mvo.mgenre}</p>
				                            </div><!-- END OF movie-info -->
				                        </a>
				                    </div><!-- END OF movie-card -->
				                </c:forEach>
				            </c:otherwise>
				        </c:choose>
				    </div><!-- END OF movie-grid -->
				</div><!-- END OF movieBox -->
				
				<div class="pagination">
			        <c:if test="${ph.totalCnt ne 0}">
			            <c:forEach begin="${ph.beginPage}" end="${ph.endPage}" var="i">
			                <a class='page ${ph.sc.page eq i ? "psging-active" : ""}'
			                   href="<c:url value='/movie/list${ph.sc.getQueryString(i)}'/>">
			                    <c:out value="${i}"/>
			                </a>    
			            </c:forEach>
			        </c:if>
			    </div><!-- END OF pagination -->
			    
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
			
			</div><!-- END OF content -->
		</div><!-- END OF inner -->
	</div><!-- END OF movie_list -->
</div><!-- END OF body_layout -->
</body>
</html>