console.log("안녕");

//전화번호 자동 하이픈 함수
function autoHyphen(target){
		target.value = target.value
		.replace(/[^0-9]/g, '') //숫자만 남기기
		.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
		.replace(/(\-{1,2})$/g, "");
	}
//이메일 유효성 검사
function joinCheck(){
	//1.입력한 이메일 값을 가져옵니다.
	let umailValue=
	document.getElementById('umail').value;
	//2.이메일 정규표현식
	const emailRegex=/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	//3. 체크시작
	if(umailValue == ""){
		alert("이메일을 입력해주세요");
		return false;
	}
	
	if(!emailRegex.test(umailValue)){
	alert("올바른 이메일 형식이 아닙니다.");
	return false;
	}
	//모든 검사가 통과되면 서버로 전송
	document.userForm.submit();
}