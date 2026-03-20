%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logForm.jsp</title>
<!-- jQeury cdn -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<!-- google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<!-- css 연결 -->
<link rel="stylesheet" type="text/css" href="/resources/css/main.css"> <!-- type 없어도 나옴 -->
<!-- js 연결 -->
<script defer src="/resources/js/main.js"></script>
<script>
let msg = "${msg}";
if(msg == "LOGIN_ERR"){alert("아이디 또는 비밀번호가 일치하지 않습니다.")}
if(msg == "NO_LOGIN"){alert("로그인이 필요합니다.")}
</script>
</head>
<body class="logForm-body">
	<form name="loginForm" id="body_layout" method="post" onsubmit="return login(this);">
		<p>로그인</p>
		<ul class="form-group">
			<li>
				<input Type="text" name="uid" id="uid" placeholder="아이디를 입력하세요."/>
			</li>
			<li>
				<input Type="password" name="upw" id="upw" placeholder="비밀번호를 입력하세요."/>
			</li>
			<li>
				<button>login</button>
				<!-- <input Type="button" value="login"> -->
			</li>
		</ul>
		<div class="menu" id="menu">
			<a href="javascript:search('I')">아이디찾기</a>
			<a href="javascript:search('P')">비밀번호찾기</a>
			<a href="/user/form">회원가입</a>
		</div>
	</form>
	<div class="popup">
		<div class="popup-inner" id="body_layout">
			<button type="button" class="popup-close" onclick="closePopup()">
				<span class="material-icons-round">close</span>				
			</button>
			<form name="searchForm">
				<p id="searchTitle"></p>
				<input type="hidden" name="flg" id="flg"/>
				<input type="text" name="uname" id="uname" placeholder="이름"/>
				<input type="text" name="uid" id="uid" placeholder="아이디"/>
				<input type="text" name="uphone" id="uphone" placeholder="전화번호"/>
				<input type="button" class="btn" value="검색" onclick="searchFun();"/>
			</form>
		</div>
	</div>
	<script>
		function searchFun(){
			let url = '';
			let data = null;
			let flg = document.searchForm.flg.value;
			let uid = document.searchForm.uid.value;
			let uname = document.searchForm.uname.value;
			let uphone = document.searchForm.uphone.value;
			
			if(flg === 'I'){
				url = '/user/searchID'
				data = {
						"uname" : uname,
						"uphone" : uphone
				}
			}else if(flg === 'P'){
				url = '/user/searchPW'
				data = {
					"uname" : uname,
					"uid" : uid,
					"uphone" : uphone
				}
			}
			$.ajax({
				type:'post',
				url: url,
				data: data,
				success : function(data){
					console.log(data);
					if(data == null || data === ''){
						alert("일치하는 회원이 없습니다.");
					}else{
						if(flg === 'I'){
							alert("아이디는 " + data + "입니다.");
							document.loginForm.uid.value = data;
							
						}else if(flg === 'P'){
							alert("임시 비밀번호 : " + data);
							document.loginForm.upw.value = data;
						}
						closePopup();
					}
				},error : function(err){
					console.log(err);
				}
			})
		}
		function search(flg){
			console.log(flg);
			
			let title = document.getElementById("searchTitle");
			let uid = document.searchForm.uid;
			
			if(flg === 'I'){
				title.innerText = "아이디 찾기";
				uid.type = 'hidden';
			}else if(flg === 'P'){
				title.innerText = "비밀번호 찾기";
				uid.type = 'text';
			}
			document.searchForm.flg.value = flg;
			popup();
		}
	</script>
</body>
</html>