<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script>
	// 선민: 로그인 유효성검사 - 공란 방지
	// *** uid.focus()가 return false보다 빠르면 return false가 제대로 되지 않는 현상 발생 ***
	function checkLoginForm() {
		var id = document.getElementById("id");
		var password = document.getElementById("password");

		if (id.value.length == 0) {
			alert("아이디를 입력하세요.");
			return false;
			uid.focus();
		}
		else if (password.value.length == 0) {
			alert("비밀번호를 입력하세요.");
			return false;
			uid.focus();
		}
		else {}
	}
	
	// 선민: 로그인 유효성검사 - 아이디/패스워드 불일치 알림
	function showMessage(message) {
			alert(message);
	}
</script>
 
</head>
<body>
	<!-- 선민: 로그인 실패 후 로그인 폼에 돌아왔을 때, 로그인 실패 message를 전달받았다면 showMessage() 실행 -->
	<c:if test="${message != null}">
		<input type="hidden" id="message" value="${message }">
		<script>showMessage('${message}');</script>
	</c:if>

	<div style="padding: 80px 100px 10px 100px;">

		<form id="login_Form" method="post" action="login.pulu" onsubmit="return checkLoginForm();">
			<div id="login_id" style="text-align: center">
				<div>
					<h1>로그인</h1>
					<hr width="24%" color="grey" align="center"><br/><br/>
				</div>
				<div id="join_Title"></div>
				<span class="insertbox">
					<input type="text" name="ID" id="id" class="insert" maxlength="20" placeholder="아이디"
					style="width: 300px; height: 30px; font-size: 10px;">
				</span>
			</div>
			<br/>
			<div id="login_password" style="text-align: center">
				<div id="join_Title"></div>
				<span class="insertbox">
				<input type="password" name="PASSWORD" id="password" class="insert" maxlength="20" placeholder="비밀번호" 
					style="width: 300px; height: 30px; font-size: 10px;">
				</span>
			</div>
			<br/><br/>
			<div id="login_button" style="text-align: center">
				<input type="submit" name="submit" class="insert_bt" value="로그인"
				style="width: 300px; height: 30px; font-size: 11px;"> <!-- submit -->
			</div><br/>
		</form>
			
		<!-- 선아: 로그인 부가기능단 -->
		<div style="text-align: center">
			<a href="findIdForm.pulu"><span style="color: black">아이디찾기</span></a> &nbsp
			<a href="findPwForm.pulu"><span style="color: black">비밀번호찾기</span></a> &nbsp
			<a href="join.pulu"><span style="color: black">회원가입</span></a> &nbsp
		</div>
	</div>
</body> 
</html>