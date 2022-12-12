<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" content="5;url=main.pulu" charset="UTF-8">
<title>회원가입 완료</title>

<!-- 선민: 페이지 이동 함수 -->
<script type="text/javascript">
	function Timer() {
		setTimeout("locateMain()", 10000);
	}
	function locateMain() {
		location.replace("loginForm.pulu");
	}
</script>

<!-- 선민: 카운트다운 함수 -->
<script type="text/javascript">
	count = 5; // 시간 설정
	function countdown() {
		if (count == 0) { // 남은시간이 0일 경우 이동
			locateMain();
		} else {
			// 시간이 남았을 경우 시간 1초씩 감소
			document.getElementById("joinOKDiv").style.fontSize = "15px"; // joinOKDiv에 속한 폰트 사이즈 15px
			document.all.joinOKDiv.innerHTML = count + "초 후 로그인 화면으로 이동합니다.";
			setTimeout("countdown()", 1000);
			count--;
		}
	}
</script>
</head>

<body onload="Timer();">
	<div style="padding: 80px 100px 10px 100px;">
		<div style="text-align: center">
			<strong><font size="6">회원가입을 환영합니다.</font></strong>
			<div id="joinOKDiv" style="margin-top: 20px"></div>
			<script>countdown();</script>
		</div>
	</div>
</body>

<div style="text-align: center; margin-top: 30px">
	<button type="button" onclick="location.href='loginForm.pulu';">로그인</button>
	<button type="button" onclick="location.href='main.pulu';">메인페이지</button>
</div>
</html>